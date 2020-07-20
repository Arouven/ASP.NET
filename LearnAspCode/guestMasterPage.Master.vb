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
			Response.Redirect("login.aspx")
		End If
	End Sub
End Class