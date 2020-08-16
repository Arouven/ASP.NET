Public Class UserDetails
	Inherits System.Web.UI.Page

	Private ReadOnly _conString As String

	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'LoginRequired()
		If Not IsNothing(Session("AdminId")) Then


			showDetails(LabelTitle)

		Else Response.Redirect("~/Admin/AdminLogin.aspx")
		End If

	End Sub
	Private Sub LoginRequired()

	End Sub
	Protected Sub LinkButtonUpdate_Click(sender As Object, e As EventArgs)
		If UnfreezeFreezeUser() Then : Response.Redirect(Request.RawUrl)
		ElseIf Not UnfreezeFreezeUser() Then : ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertmsg", "alert('Problem encounter');", True)
		End If
	End Sub
	Protected Sub LinkButtonDelete_Click(sender As Object, e As EventArgs)
		If deleteUser() Then : Response.Redirect("~/AdminViewsListOfTutorsStudents.aspx")
		ElseIf Not deleteUser() Then : ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertmsg", "alert('Problem encounter');", True)
		End If
	End Sub

	Private Function deleteUser() As Boolean
		Dim IsDeleted As Boolean = False
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim requestId As Integer = Convert.ToInt32(Request.QueryString("id"))
		Dim requestUser As String = Request.QueryString("user")
		Dim tableName As String = ""
		Dim tableId As String = ""
		If requestUser = "Tutor" Then
			tableName = "TutorTable"
			tableId = "TutorId"
		ElseIf requestUser = "Student" Then
			tableName = "StudentTable"
			tableId = "StudentId"
		End If
		cmd.CommandText = "DELETE FROM " & tableName & " where " & tableId & "=@requestId;" '
		cmd.Parameters.AddWithValue("@requestId", requestId)
		con.Open()
		'use Command method to execute DELETE statement and return
		'boolean if number of records DELETED is greater than zero
		IsDeleted = cmd.ExecuteNonQuery > 0
		con.Close()
		Return IsDeleted
	End Function

	Protected Sub LinkButtonBack_Click(sender As Object, e As EventArgs)
		Response.Redirect("~/AdminViewsListOfTutorsStudents.aspx")
	End Sub






	Protected Sub LinkButtonResetPassword_Click(sender As Object, e As EventArgs)
		Dim ProfilePictureUrl As String = ""
		Dim UserEmail As String = ""
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim requestId As Integer = Convert.ToInt32(Request.QueryString("id"))
		Dim requestUser As String = Request.QueryString("user")
		Dim profileUpdateUrl As String = ""
		Dim tableName As String = ""
		Dim tableId As String = ""
		If requestUser = "Tutor" Then
			tableName = "TutorTable"
			tableId = "TutorId"
			profileUpdateUrl = ClassSendMail.tutorProfileUpdateUrl
		ElseIf requestUser = "Student" Then
			tableName = "StudentTable"
			tableId = "StudentId"
			profileUpdateUrl = ClassSendMail.studentProfileUpdateUrl
		End If
		cmd.CommandText = "SELECT  ProfilePictureUrl, Email FROM " & tableName & " where " & tableId & "=@requestId;" '
		cmd.Parameters.AddWithValue("@requestId", requestId)
		'Create DataReader
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		If reader.HasRows Then
			While reader.Read
				ProfilePictureUrl = "~/ProfilePictures/" & reader(0)
				UserEmail = reader(1)
			End While
		End If
		reader.Close()
		con.Close()
		Dim newPassword As String = CreateRandomPassword(10)

		Dim IsUpdated As Boolean = False
		Dim con2 As New SqlClient.SqlConnection(_conString)
		Dim cmd2 As New SqlClient.SqlCommand()
		cmd2.Connection = con2
		cmd2.CommandType = CommandType.Text
		cmd2.CommandText = "update " & tableName & " set Password=@Password where " & tableId & "=@requestId;"
		'Create two parameterized queries
		cmd2.Parameters.AddWithValue("@Password", Encrypt(newPassword))
		cmd2.Parameters.AddWithValue("@requestId", requestId)
		con2.Open()
		'use Command method to execute UPDATE statement and return
		'boolean if number of records UPDATED is greater than zero
		IsUpdated = cmd2.ExecuteNonQuery() > 0
		con2.Close()
		If (IsUpdated) Then : sendResetPasswordMail(ClassSendMail.email, ClassSendMail.pass, UserEmail, requestUser, ProfilePictureUrl, profileUpdateUrl)
		End If
	End Sub
	Private Function Encrypt(clearText As String) As String
		Dim EncryptionKey As String = "MAKV2SPBNI99212"
		Dim clearBytes As Byte() = Encoding.Unicode.GetBytes(clearText)
		Using encryptor As Security.Cryptography.Aes = Security.Cryptography.Aes.Create()
			Dim pdb As New Security.Cryptography.Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D, &H65, &H64, &H76, &H65, &H64, &H65, &H76})
			encryptor.Key = pdb.GetBytes(32)
			encryptor.IV = pdb.GetBytes(16)
			Using ms As New IO.MemoryStream()
				Using cs As New Security.Cryptography.CryptoStream(ms, encryptor.CreateEncryptor(), Security.Cryptography.CryptoStreamMode.Write)
					cs.Write(clearBytes, 0, clearBytes.Length)
					cs.Close()
				End Using
				clearText = Convert.ToBase64String(ms.ToArray())
			End Using
		End Using
		Return clearText
	End Function
	Private Function CreateRandomPassword(ByVal PasswordLength As Integer) As String
		Dim _allowedChars As String = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789*$-+?_&=!%{}/"
		Dim randomNumber As New Random()
		Dim chars(PasswordLength - 1) As Char
		Dim allowedCharCount As Integer = _allowedChars.Length
		For i As Integer = 0 To PasswordLength - 1
			chars(i) = _allowedChars.Chars(CInt(Fix((_allowedChars.Length) * randomNumber.NextDouble())))
		Next i
		Return New String(chars)
	End Function



	Private Sub sendResetPasswordMail(sentFrom As String, senderMailPassword As String, sendTo As String, username As String, profilePicUrl As String, clickHereUrl As String)
		Dim msg As New Net.Mail.MailMessage()
		Dim sc As New Net.Mail.SmtpClient()
		Try
			msg.From = New Net.Mail.MailAddress(sentFrom)
			msg.To.Add(sendTo)
			msg.Subject = "Password Reset!"
			msg.IsBodyHtml = True
			Dim msgBody As New StringBuilder()
			msgBody.Append("Dear " + username + ", Admin has reset your password, thank you for staying on Academy.")
			msg.Attachments.Add(New Net.Mail.Attachment(Server.MapPath(profilePicUrl)))
			msgBody.Append("<a href='" & clickHereUrl & "'>Click here and update your password</a>")
			msg.Body = msgBody.ToString()
			sc.Host = "smtp.gmail.com"
			sc.Port = 587
			sc.UseDefaultCredentials = False
			sc.Credentials = New Net.NetworkCredential(sentFrom, senderMailPassword)
			sc.EnableSsl = True
			sc.Send(msg)
			Response.Write("Email Sent successfully")
		Catch ex As Exception
			Response.Write(ex.Message)
		End Try
	End Sub




	Private Sub showDetails(userTitle As Label)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim requestId As Integer = Request.QueryString("id")
		Dim requestUser As String = Request.QueryString("user")
		userTitle.Text = requestUser.ToString
		Dim tableName As String = ""
		Dim tableId As String = ""
		If requestUser = "Tutor" Then
			tableName = "TutorTable"
			tableId = "TutorId"
		ElseIf requestUser = "Student" Then
			tableName = "StudentTable"
			tableId = "StudentId"
		End If
		cmd.CommandText = "SELECT Freeze, " & tableId & ", ProfilePictureUrl, UserName, FirstName, LastName, Address, BirthDate, PhoneNumber, Email FROM " & tableName & " where " & tableId & "=@requestId;" '
		cmd.Parameters.AddWithValue("@requestId", requestId)
		'Create DataReader
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		If reader.HasRows Then
			While reader.Read
				CheckBoxFreeze.Checked = Convert.ToBoolean(reader(0))
				If Convert.ToBoolean(reader(0)) Then : LinkButtonUpdate.Text = "Unfreeze"
				Else : LinkButtonUpdate.Text = "Freeze"
				End If
				Image1.ImageUrl = "~/ProfilePictures/" & reader(2)
				LabelUserName.Text = reader(3)
				LabelFirstName.Text = reader(4)
				LabelLastName.Text = reader(5)
				LabelAddress.Text = reader(6)
				LabelBirthDate.Text = String.Format("{0:dd/MM/yyyy} (DD/MM/YYYY)", reader(7))
				LabelPhoneNumber.Text = reader(8)
				LabelEmail.Text = reader(9)
			End While
		End If
		reader.Close()
		con.Close()
	End Sub
	Private Function getIsFreeze(tableName, tableId, requestId) As Boolean
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT Freeze FROM " & tableName & " where " & tableId & "=@requestId;" '
		cmd.Parameters.AddWithValue("@requestId", requestId)
		'Create DataReader
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		While reader.Read
			Return reader.GetBoolean(0)
		End While
		reader.Close()
		con.Close()
		Return False
	End Function


	Private Function UnfreezeFreezeUser() As Boolean
		Dim IsUpdated As Boolean = False
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim requestId As Integer = Request.QueryString("id")
		Dim requestUser As String = Request.QueryString("user")
		Dim tableName As String = ""
		Dim tableId As String = ""
		If requestUser = "Tutor" Then
			tableName = "TutorTable"
			tableId = "TutorId"
		ElseIf requestUser = "Student" Then
			tableName = "StudentTable"
			tableId = "StudentId"
		End If
		cmd.CommandText = "update " & tableName & " set Freeze=@isFreeze where " & tableId & "=@requestId;"
		'Create two parameterized queries
		cmd.Parameters.AddWithValue("@isFreeze", Not (getIsFreeze(tableName, tableId, requestId)))
		cmd.Parameters.AddWithValue("@requestId", requestId)
		con.Open()
		'use Command method to execute UPDATE statement and return
		'boolean if number of records UPDATED is greater than zero
		IsUpdated = cmd.ExecuteNonQuery() > 0
		con.Close()
		Return IsUpdated
	End Function


End Class