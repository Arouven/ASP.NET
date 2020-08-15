Public Class AdminLogin
	Inherits System.Web.UI.Page

	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


		If (Not Page.IsPostBack) Then
			If (Not IsNothing(Request.Cookies("Aun")) And Not IsNothing(Request.Cookies("Apwd"))) Then
				TextBoxUsernameAdminLog.Text = Request.Cookies("Aun").Value
				TextBoxPasswordAdminLog.Attributes("value") = Request.Cookies("Apwd").Value
			End If
		End If
	End Sub


	Protected Sub ButtonAdminLogin_Click(sender As Object, e As EventArgs)
		Dim username As String = TextBoxUsernameAdminLog.Text
		Dim password As String = TextBoxPasswordAdminLog.Text
		Dim chk As Boolean = AdminRememberMe.Checked
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		'searching for a record containing matching username & password with
		'an active status
		cmd.CommandText = "select * from AdminTable where username=@username and password=@password and freeze=0"
		'create three parameterized query for the above select statement
		'use above variables and decrypt password
		cmd.Parameters.AddWithValue("@username", username)
		cmd.Parameters.AddWithValue("@password", password)
		Dim myReader As SqlClient.SqlDataReader
		con.Open()
		myReader = cmd.ExecuteReader()
		'check if the DataReader contains a record
		If (myReader.HasRows) Then
			If myReader.Read Then
				'create a memory cookie to store username and pwd
				Response.Cookies("Aun").Value = username
				Response.Cookies("Apwd").Value = password
				If (chk) Then
					'if checkbox is checked, make cookies persistent
					Response.Cookies("Aun").Expires = DateAndTime.Now.AddDays(100)
					Response.Cookies("Apwd").Expires = DateAndTime.Now.AddDays(100)
				Else
					'delete the cookies if checkbox is unchecked
					Response.Cookies("Aun").Expires = DateAndTime.Now.AddDays(-100)
					Response.Cookies("Apwd").Expires = DateAndTime.Now.AddDays(-100)
					'delete content of password field
				End If
				'create and save username in a session variable
				Session("AdminUsername") = username
				'create and save userid in a session variable
				Session("AdminId") = myReader("AdminId")
				'redirect to the corresponding page
				Response.Redirect("~/Admin/AdminHome.aspx")
				con.Close()
			End If
		Else
			'delete content of password field
			lblStatus.Text = "You are not registered or your account has been suspended!"
			'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "PopA", "return loginModal()", True)
			'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowA", "return ShowAdmin()", True)
		End If
	End Sub

End Class