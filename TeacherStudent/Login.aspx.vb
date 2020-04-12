
Imports System.Data.SqlClient
Imports System.Web.Mail
'Imports System.Net.Mail

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
        strSQL.Append(" SELECT COUNT(*) FROM [dbo].[RegisterTable]  WHERE [Name] = @sUsername  AND [Password] = @sPassword ")
        objCmd = New SqlCommand(strSQL.ToString(), objConn)
        objCmd.Parameters.Add("@sUsername", SqlDbType.VarChar).Value = Me.TextBoxUsernameLog.Text
        objCmd.Parameters.Add("@sPassword", SqlDbType.VarChar).Value = Me.TextBoxPasswordLog.Text
        intCount = objCmd.ExecuteScalar()

        objConn.Close()
        objConn = Nothing

        If intCount <= 0 Then
            Me.lblStatus.ForeColor = Drawing.Color.Red
            Me.lblStatus.Text = "Username or Password wrong!"
        Else
            Session("un") = Me.TextBoxUsernameLog.Text
            Response.Redirect("Home")
        End If

    End Sub

    Protected Sub ButtonRegister_Click(sender As Object, e As EventArgs) Handles ButtonRegister.Click
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

        '*** Check Username exists ***'
        strSQL = New StringBuilder
        strSQL.Append(" SELECT COUNT(*) FROM [dbo].[RegisterTable] WHERE [Name] = @sUsername ")
        objCmd = New SqlCommand(strSQL.ToString(), objConn)
        objCmd.Parameters.Add("@sUsername", SqlDbType.VarChar).Value = Me.TextBoxUsernameReg.Text
        intCount = objCmd.ExecuteScalar()
        If intCount >= 1 Then
            Me.lblStatus.ForeColor = Drawing.Color.Red
            Me.lblStatus.Text = "Username already exists!!"
            Exit Sub
        End If

        '*** Check Email exists ***'
        strSQL = New StringBuilder
        strSQL.Append(" SELECT COUNT(*) FROM [dbo].[RegisterTable]  WHERE [Email] = @sEmail ")
        objCmd = New SqlCommand(strSQL.ToString(), objConn)
        objCmd.Parameters.Add("@sEmail", SqlDbType.VarChar).Value = Me.TextBoxEmail.Text
        intCount = objCmd.ExecuteScalar()
        If intCount >= 1 Then
            Me.lblStatus.ForeColor = Drawing.Color.Red
            Me.lblStatus.Text = "Email already exists!!"
            Exit Sub
        End If

        '*** Insert New Member ***'
        strSQL = New StringBuilder
        strSQL.Append("INSERT INTO [dbo].[RegisterTable] ([Name], [Password], [Email] ) VALUES (@sUsername, @sPassword,@sEmail);")
        objCmd = New SqlCommand(strSQL.ToString(), objConn)
        objCmd.Parameters.Add("@sUsername", SqlDbType.VarChar).Value = Me.TextBoxUsernameReg.Text
        objCmd.Parameters.Add("@sPassword", SqlDbType.VarChar).Value = Me.TextBoxPasswordReg.Text
        objCmd.Parameters.Add("@sEmail", SqlDbType.VarChar).Value = Me.TextBoxEmail.Text
        objCmd.ExecuteNonQuery()

        objConn.Close()
        objConn = Nothing

        Session("un") = Me.TextBoxUsernameReg.Text
        Response.Redirect("Home")

        'Me.pnlRegister.Visible = False
        'Me.pnlFinish.Visible = True

    End Sub



End Class