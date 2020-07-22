

'Imports System.Net.Mail

Public Class master1
	Inherits System.Web.UI.MasterPage

	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'If (Session("un") Is Nothing) Or (Session("un") = "Register / Login") Then
		'	LabelUsername.Text = "Register / Login"
		'	Logout.HRef = "Login"
		'Else
		'	LabelUsername.Text = Session("un") & " | Logout"
		'	Logout.HRef = "Logout"
		'End If

		If (Not Page.IsPostBack) Then
			'Verify if un and pwd cookies are not null

			'If (Not IsNothing(Request.Cookies("un")) And Not IsNothing(Request.Cookies("pwd"))) Then
			'	'Populate the Username and Password Textboxes by retrieving the values
			'	'from the cookies
			'	userlogin.username = Request.Cookies("un").Value
			'	userlogin.password = Request.Cookies("pwd").Value
			'End If
		End If


	End Sub

	Protected Sub ButtonRegister_Click(sender As Object, e As EventArgs)
		'Check whether the fileupload contains a file
		If (FileUpload1.HasFile) Then
			'Add the filename name as a parameter
			If (CheckFileType(FileUpload1.FileName)) Then
				Dim fileName As String = IO.Path.GetFileName(FileUpload1.PostedFile.FileName)
				FileUpload1.PostedFile.SaveAs(Server.MapPath("~/ProfilePictures/") + fileName)

				Dim tblName As String = ""
				Dim tblId As String = ""
				If (RadioButtonListRegister.SelectedItem.Text = "Student") Then
					tblName = "StudentTable"
					tblId = "StudentId"
				ElseIf (RadioButtonListRegister.SelectedItem.Text = "Tutor") Then
					tblName = "TutorTable"
					tblId = "TutorId"
				ElseIf (RadioButtonListRegister.SelectedItem.Text = "Administrator") Then
					tblName = "AdminTable"
					tblId = "AdminId"
				End If


				'Check if username already exists in the DB
				If (UsernameExistInTable("StudentTable", TextBoxUsernameReg.Text)) OrElse (UsernameExistInTable("TutorTable", TextBoxUsernameReg.Text)) OrElse (UsernameExistInTable("AdminTable", TextBoxUsernameReg.Text)) Then
					lblStatus.Text = "Username Already Exist, Please Choose Another"
					lblStatus.ForeColor = System.Drawing.Color.Red
					TextBoxUsernameReg.Focus()
				Else
					Dim dt As DateTime = Convert.ToDateTime(textBoxDOB.Text)
					'Create another Command object to store insert statement
					Dim con1 As New SqlClient.SqlConnection(_conString)
					Dim cmd1 As New SqlClient.SqlCommand()
					cmd1.Connection = con1
					cmd1.CommandType = CommandType.Text
					'tblName=TutorTable | AdminTable | StudentTable
					'tblId=TutorId | AdminId | StudentId
					cmd1.CommandText = "INSERT INTO " & tblName & " (FirstName, LastName, ProfilePictureUrl, Address,  BirthDate, PhoneNumber, Email, UserName, Password, Freeze) VALUES (@FirstName, @LastName, @ProfilePictureUrl, @Address, @BirthDate, @PhoneNumber, @Email, @UserName, @Password, @Freeze);"

					cmd1.Parameters.AddWithValue("@FirstName", TextBoxFirstnameReg.Text)
					cmd1.Parameters.AddWithValue("@LastName", TextBoxLastnameReg.Text)
					cmd1.Parameters.AddWithValue("@ProfilePictureUrl", fileName)
					cmd1.Parameters.AddWithValue("@Address", TextBoxAddress.Text)
					cmd1.Parameters.AddWithValue("@BirthDate", dt)
					cmd1.Parameters.AddWithValue("@PhoneNumber", textBoxPhoneNumber.Text)
					cmd1.Parameters.AddWithValue("@Email", TextBoxEmail.Text)
					cmd1.Parameters.AddWithValue("@UserName", TextBoxUsernameReg.Text)
					cmd1.Parameters.AddWithValue("@Password", Encrypt(TextBoxConfirmReg.Text))
					cmd1.Parameters.AddWithValue("@Freeze", 0)

					con1.Open()
					cmd1.ExecuteNonQuery()

					cmd1.CommandText = "select " & tblId & " from " & tblName & " where UserName=@UserName;"

					Dim myReader As SqlClient.SqlDataReader
					myReader = cmd1.ExecuteReader()
					Dim chk As Boolean = CheckBoxRegister.Checked
					If myReader.Read Then
						'create a memory cookie to store username and pwd
						Response.Cookies("un").Value = TextBoxUsernameReg.Text
						Response.Cookies("pwd").Value = TextBoxConfirmReg.Text
						If (chk) Then
							'if checkbox is checked, make cookies persistent
							Response.Cookies("un").Expires = DateAndTime.Now.AddDays(100)
							Response.Cookies("pwd").Expires = DateAndTime.Now.AddDays(100)
						Else
							'delete the cookies if checkbox is unchecked
							Response.Cookies("un").Expires = DateAndTime.Now.AddDays(-100)
							Response.Cookies("pwd").Expires = DateAndTime.Now.AddDays(-100)
							'delete content of password field
						End If
						'create and save username in a session variable
						Session("username") = TextBoxUsernameReg.Text
						'create and save userid in a session variable
						Session("userid") = myReader(tblId)
					End If

					myReader.Close()
					'call the sendemail method
					sendMail("admin@gmail.com", "password", TextBoxEmail.Text, TextBoxUsernameReg.Text, "~/ProfilePictures/" + fileName, "http://localhost/login")
					con1.Close()
					Response.Redirect("Welcome.aspx")
				End If
			End If
		End If
	End Sub

	Protected Sub ButtonLogin_Click(sender As Object, e As EventArgs) Handles ButtonLogin.Click
		'get the value of username and password fields and state of checkbox from
		'login form
		Dim username As String = TextBoxUsernameLog.Text
		Dim password As String = TextBoxPasswordLog.Text
		Dim chk As Boolean = RememberMe.Checked

		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		'searching for a record containing matching username & password with
		'an active status
		Dim tblName As String = ""
		Dim tblId As String = ""
		If (RadioButtonListRegister.SelectedItem.Text = "Student") Then
			tblName = "StudentTable"
			tblId = "StudentId"
		ElseIf (RadioButtonListRegister.SelectedItem.Text = "Tutor") Then
			tblName = "TutorTable"
			tblId = "TutorId"
		ElseIf (RadioButtonListRegister.SelectedItem.Text = "Administrator") Then
			tblName = "AdminTable"
			tblId = "AdminId"
		End If
		cmd.CommandText = "select UserName," & tblId & " from " & tblName & " where UserName=@UserName and Password=@Password and Freeze=@Freeze"
		'create three parameterized query for the above select statement
		'use above variables and decrypt password
		cmd.Parameters.AddWithValue("@UserName", username)
		cmd.Parameters.AddWithValue("@Password", Decrypt(password))
		cmd.Parameters.AddWithValue("@Freeze", 0)

		Dim myReader As SqlClient.SqlDataReader
		con.Open()
		myReader = cmd.ExecuteReader()
		'check if the DataReader contains a record
		If (myReader.HasRows) Then
			If myReader.Read Then
				'create a memory cookie to store username and pwd
				Response.Cookies("un").Value = username
				Response.Cookies("pwd").Value = password
				If (chk) Then
					'if checkbox is checked, make cookies persistent
					Response.Cookies("un").Expires = DateAndTime.Now.AddDays(100)
					Response.Cookies("pwd").Expires = DateAndTime.Now.AddDays(100)
				Else
					'delete the cookies if checkbox is unchecked
					Response.Cookies("un").Expires = DateAndTime.Now.AddDays(-100)
					Response.Cookies("pwd").Expires = DateAndTime.Now.AddDays(-100)
					'delete content of password field
				End If
				'create and save username in a session variable
				Session("username") = username
				'create and save userid in a session variable
				Session("userid") = myReader(tblId)
				'redirect to the corresponding page
				Response.Redirect("Welcome.aspx")
				con.Close()
			End If
		Else
			'delete content of password field
			ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "loginRegisterModal();", True)
			lblStatus.Text = "Wrong password or username or your account has been suspended!"
			lblStatus.ForeColor = System.Drawing.Color.Red
		End If
	End Sub
	Private Sub sendMail(sentFrom As String, senderMailPassword As String, sendTo As String, welcomeUsername As String, profilePicUrl As String, clickHereLoginUrl As String)
		Dim filename As String
		filename = IO.Path.GetFileName(FileUpload1.PostedFile.FileName)
		Dim msg As New Net.Mail.MailMessage()
		Dim sc As New Net.Mail.SmtpClient()
		Try
			msg.From = New Net.Mail.MailAddress(sentFrom)
			msg.To.Add(sendTo)
			msg.Subject = "This is a Test Mail"
			msg.IsBodyHtml = True
			Dim msgBody As New StringBuilder()
			msgBody.Append("Dear " + welcomeUsername + ", your registration is successful, thank you for signing up on xyz.")
			msg.Attachments.Add(New Net.Mail.Attachment(Server.MapPath(profilePicUrl)))
			msgBody.Append("<a href='" + clickHereLoginUrl + "'>Click here to login to ...</a>")
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

	Private Function UsernameExistInTable(tableName As String, userName As String)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select UserName from " & tableName & " where UserName=@UserName;"
		cmd.Connection = con
		'create a parameterized query
		cmd.Parameters.AddWithValue("@UserName", userName)
		'Create DataReader
		Dim myReader As SqlClient.SqlDataReader
		con.Open()
		myReader = cmd.ExecuteReader()
		If (myReader.HasRows) Then : Return True
		Else : Return False
		End If
		'Ensure the DataReader is closed
		myReader.Close()
		con.Close()
	End Function
	Private Function CheckFileType(ByVal fileName As String) As Boolean
		Dim ext As String = IO.Path.GetExtension(fileName)
		Select Case ext.ToLower()
			Case ".gif"
				Return True
			Case ".png"
				Return True
			Case ".jpg"
				Return True
			Case ".jpeg"
				Return True
			Case Else
				Return False
		End Select
	End Function
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
	Private Function Decrypt(cipherText As String) As String
		Dim EncryptionKey As String = "MAKV2SPBNI99212"
		Dim clearBytes As Byte() = Encoding.Unicode.GetBytes(cipherText)
		Using encryptor As Security.Cryptography.Aes = Security.Cryptography.Aes.Create()
			Dim pdb As New Security.Cryptography.Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D, &H65, &H64, &H76, &H65, &H64, &H65, &H76})
			encryptor.Key = pdb.GetBytes(32)
			encryptor.IV = pdb.GetBytes(16)
			Using ms As New IO.MemoryStream()
				Using cs As New Security.Cryptography.CryptoStream(ms, encryptor.CreateEncryptor(), Security.Cryptography.CryptoStreamMode.Write)
					cs.Write(clearBytes, 0, clearBytes.Length)
					cs.Close()
				End Using
				cipherText = Convert.ToBase64String(ms.ToArray())
			End Using
		End Using
		Return cipherText
	End Function
End Class


