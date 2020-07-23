Imports System.Data.SqlClient


Public Class guestMasterPage
	Inherits System.Web.UI.MasterPage
	Private _conString As String = ConfigurationManager.ConnectionStrings("MoviesCS").ToString
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'verify if session username is not null
		If (Not IsNothing(Session("username"))) Then
			pnllog.Style.Add("visibility", "hidden")
			Page.Controls.Remove(pnllog)
			lgregis.CssClass = "nav navbar-nav navbar-right"
			lbllgged.CssClass = "btn btn-success text-white"
			'add the session name
			lbllgged.Text = "Welcome " & Session("username")
			btnlgout.Visible = True
			pnlmanagemov.Visible = True
			Dim con As New SqlConnection(_conString)
			con.Open()
			Dim scmd As New SqlCommand()
			scmd.Connection = con
			scmd.CommandType = CommandType.Text
			'add the session name
			scmd.CommandText = "Select user_id from tbluser where username='" + Session("username") + "'"
			Dim druid As SqlDataReader
			druid = scmd.ExecuteReader()
			If (druid.Read()) Then
				pnlprofile.Visible = True
				Dim user_id As Integer = Convert.ToInt32(druid(0))
				hyuser.Attributes("href") = ResolveUrl("~/Tutorials/Week5/updateprofile?id=" & user_id & "")
			End If
			con.Close()
		End If
		If (Not Page.IsPostBack) Then
			If (Not IsNothing(Request.Cookies("username")) And Not IsNothing(Request.Cookies("pwd"))) Then
				ucadminlogin.Username = Request.Cookies("username").Value
				ucadminlogin.Password = Request.Cookies("pwd").Value
			End If
		End If
		If (Not IsNothing(Session("adminuname"))) Then
			lgregis.CssClass = "nav navbar-nav navbar-right"
			lbllgged.CssClass = "btn btn-success text-white"
			lbllgged.Text = "Welcome " + Session("adminuname")
			btnlgout.Visible = True
			pnlmanage.Visible = True
			pnlmanagemov.Style.Add("visibility", "hidden")
			Page.Controls.Remove(pnlmanagemov)
			pnlprofile.Style.Add("visibility", "hidden")
			Page.Controls.Remove(pnlprofile)
			pnllog.Style.Add("visibility", "hidden")
			Page.Controls.Remove(pnllog)
		End If
	End Sub

	Protected Sub btnlgout_Click(sender As Object, e As EventArgs)
		lgout()
	End Sub
	Sub lgout()
		If (Not IsNothing(Session("username")) Or Not IsNothing(Session("adminuname"))) Then
			'Remove all session
			Session.RemoveAll()
			'Destroy all Session objects
			Session.Abandon()
			'Redirect to homepage or login page
			Response.Redirect("~/Tutorials/Week5/login.aspx")
		End If
	End Sub

	Protected Sub btnLogin_Click(sender As Object, e As EventArgs)
		'get the value of username and password fields and state of checkbox from
		'admin login form
		Dim username As String = ucadminlogin.Username
		Dim password As String = ucadminlogin.Password
		Dim chk As Boolean = ucadminlogin.Chk
		Dim con As New SqlConnection(_conString)
		Dim cmd As New SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		'searching for a record containing matching username & password with an		active status
		cmd.CommandText = "Select * from tblsubadmin where sa_username=@username and sa_password=@password and sa_status=@status;"
		'create three parameterized query for the above select statement
		cmd.Parameters.AddWithValue("@username", username)
		cmd.Parameters.AddWithValue("@password", password)
		cmd.Parameters.AddWithValue("@status", 1)
		'use above variables
		Dim myReader As SqlDataReader
		con.Open()
		myReader = cmd.ExecuteReader
		'check if the DataReader contains a record

		If (myReader.HasRows) Then
			If myReader.Read Then
				'create a memory cookie to store username and pwd
				Response.Cookies("username").Value = username
				Response.Cookies("pwd").Value = password
				If (chk) Then
					'if checkbox is checked, make cookies persistent
					Response.Cookies("username").Expires = DateAndTime.Now.AddDays(100)
					Response.Cookies("pwd").Expires = DateAndTime.Now.AddDays(100)
				Else
					'delete the cookies if checkbox is unchecked
					'delete content of password field
					Response.Cookies("username").Expires = DateAndTime.Now.AddDays(-100)
					Response.Cookies("pwd").Expires = DateAndTime.Now.AddDays(-100)
				End If
				'create and save adminuname in a session variable
				Session("adminuname") = username
				'create and save adminid in a session variable
				Session("adminid") = myReader("sa_is")
				'redirect to the dashboard page
				Response.Redirect("~/Tutorials/Week10/dashboard.aspx")
				con.Close()
			End If
		Else
			ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "adminModal();", True)
			'delete content of password field
			lblmsg.Style.Add("margin-left", "10%")
			lblmsg.ForeColor = Drawing.Color.Red
			username = ""
			password = ""
			lblmsg.Text = "You are not registered or your account has been suspended!"
		End If
	End Sub
End Class