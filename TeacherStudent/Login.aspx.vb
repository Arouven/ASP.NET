
Imports System.Data.SqlClient

Public Class Login
	Inherits System.Web.UI.Page


	Protected Sub ButtonLogin_Click(sender As Object, e As EventArgs) Handles ButtonLogin.Click
		' https://www.thaicreate.com/free-web-script/asp.net-register-login-reset-password-update-profile.html

		Dim objConn As SqlConnection
		Dim strConnString As String
		Dim strSQL As StringBuilder
		Dim objCmd As SqlCommand
		Dim intCount As Integer = 0

		'*** Open Connection ***'
		strConnString = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Arouven\Source\Repos\ASP.NET\TeacherStudent\App_Data\TeacherStudentDB.mdf;Integrated Security=True"
		objConn = New SqlConnection
		objConn.ConnectionString = strConnString
		objConn.Open()

		'*** Check Login ***'
		strSQL = New StringBuilder
		strSQL.Append(" SELECT COUNT(*) FROM [dbo].[RegisterTable] ")
		strSQL.Append(" WHERE [Name] = @sUsername ")
		strSQL.Append(" AND [Password] = @sPassword ")
		objCmd = New SqlCommand(strSQL.ToString(), objConn)
		objCmd.Parameters.Add("@sUsername", SqlDbType.VarChar).Value = Me.TextBoxUsernameLog.Text
		objCmd.Parameters.Add("@sPassword", SqlDbType.VarChar).Value = Me.TextBoxPasswordLog.Text
		intCount = objCmd.ExecuteScalar()

		objConn.Close()
		objConn = Nothing

		If intCount <= 0 Then
			Me.Response.Write("<script>alert('Username or Password wrong!')</script>")
		Else
			Session("un") = Me.TextBoxUsernameLog.Text
			Response.Redirect("Home.aspx")
		End If

	End Sub

	Protected Sub ButtonRegister_Click(sender As Object, e As EventArgs) Handles ButtonRegister.Click
		Dim connection As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Arouven\Source\Repos\ASP.NET\TeacherStudent\App_Data\TeacherStudentDB.mdf;Integrated Security=True")
		connection.Open()
		Dim cmd As New SqlCommand("INSERT INTO [dbo].[RegisterTable] ([Name], [Password], [Email] ) VALUES ('@username', '@password','@email');", connection)
		cmd.CommandType = CommandType.StoredProcedure
		cmd.Parameters.AddWithValue("@username", TextBoxUsernameReg.Text.Trim())
		cmd.Parameters.AddWithValue("@password", TextBoxPasswordReg.Text.Trim())
		cmd.Parameters.AddWithValue("@email", TextBoxEmail.Text.Trim())
		Dim da As New SqlDataAdapter(cmd)
		cmd.ExecuteNonQuery()
		connection.Close()
		Session.Add("username", TextBoxUsernameLog.Text)
		Response.Redirect("Home")
	End Sub




End Class