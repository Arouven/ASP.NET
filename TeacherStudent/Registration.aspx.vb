Public Class Registration
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim mydate As DateTime = DateTime.Now.ToString("yyyy-MM-dd")
		mydate = mydate.AddYears(-18)
		textBoxDOB.Attributes("max") = mydate.ToString("yyyy-MM-dd")

	End Sub
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
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
					'tblName=TutorTable | StudentTable
					'tblId=TutorId | StudentId
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
						If tblName = "StudentTable" Then
							'create a memory cookie to store username and pwd
							Response.Cookies("Sun").Value = TextBoxUsernameReg.Text
							Response.Cookies("Spwd").Value = TextBoxConfirmReg.Text
							If (chk) Then
								'if checkbox is checked, make cookies persistent
								Response.Cookies("Sun").Expires = DateAndTime.Now.AddDays(100)
								Response.Cookies("Spwd").Expires = DateAndTime.Now.AddDays(100)
							Else
								'delete the cookies if checkbox is unchecked
								Response.Cookies("Sun").Expires = DateAndTime.Now.AddDays(-100)
								Response.Cookies("Spwd").Expires = DateAndTime.Now.AddDays(-100)
								'delete content of password field
							End If
							'create and save username in a session variable
							Session("StudentUsername") = TextBoxUsernameReg.Text
							'create and save userid in a session variable
							Session("Studentid") = myReader("StudentId")
						ElseIf tblName = "TutorTable" Then
							'create a memory cookie to store username and pwd
							Response.Cookies("Tun").Value = TextBoxUsernameReg.Text
							Response.Cookies("Tpwd").Value = TextBoxConfirmReg.Text
							If (chk) Then
								'if checkbox is checked, make cookies persistent
								Response.Cookies("Tun").Expires = DateAndTime.Now.AddDays(100)
								Response.Cookies("Tpwd").Expires = DateAndTime.Now.AddDays(100)
							Else
								'delete the cookies if checkbox is unchecked
								Response.Cookies("Tun").Expires = DateAndTime.Now.AddDays(-100)
								Response.Cookies("Tpwd").Expires = DateAndTime.Now.AddDays(-100)
								'delete content of password field
							End If
							'create and save username in a session variable
							Session("TutorUsername") = TextBoxUsernameReg.Text
							'create and save userid in a session variable
							Session("TutorId") = myReader("TutorId")
						End If

					End If

					myReader.Close()
					'call the sendemail method
					sendMail(ClassSendMail.email, ClassSendMail.pass, TextBoxEmail.Text, TextBoxUsernameReg.Text, "~/ProfilePictures/" + fileName, "http://localhost/login")
					con1.Close()
					Response.Redirect("Welcome.aspx")
				End If
			End If
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
End Class