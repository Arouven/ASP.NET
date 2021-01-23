Public Class register
  Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim mydate As DateTime = DateTime.Now.ToString("yyyy-MM-dd")
		mydate = mydate.AddYears(-18)
		textBoxDOB.Attributes("max") = mydate.ToString("yyyy-MM-dd")

	End Sub
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub
	Private Function EmailExistInTable(tableName As String, Email As String)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select email from " & tableName & " where Email=@Email;"
		cmd.Connection = con
		'create a parameterized query
		cmd.Parameters.AddWithValue("@Email", Email)
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
	Protected Sub ButtonRegister_Click(sender As Object, e As EventArgs)
		'Check whether the fileupload contains a file
		If (FileUpload1.HasFile) Then
			'Add the filename name as a parameter
			If (CheckFileType(FileUpload1.FileName)) Then
				Dim fileName As String = IO.Path.GetFileName(FileUpload1.PostedFile.FileName)
				FileUpload1.PostedFile.SaveAs(Server.MapPath("~/ProfilePictures/") + TextBoxUsernameReg.Text + fileName)

				Dim tblName As String = ""
				Dim tblId As String = ""
				If (RadioButtonListRegister.SelectedItem.Text = "HouseKeeper") Then
					tblName = "HouseKeeperTable"
					tblId = "HKId"
				ElseIf (RadioButtonListRegister.SelectedItem.Text = "HouseOwner") Then
					tblName = "HouseOwnerTable"
					tblId = "HOId"
				End If


				'Check if username already exists in the DB
				If (UsernameExistInTable("HouseKeeperTable", TextBoxUsernameReg.Text)) OrElse (UsernameExistInTable("HouseOwnerTable", TextBoxUsernameReg.Text)) OrElse (UsernameExistInTable("AdminTable", TextBoxUsernameReg.Text)) Then
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
					If (RadioButtonListRegister.SelectedItem.Text = "HouseOwner") Then
						cmd1.CommandText = "INSERT INTO HouseOwnerTable (FirstName, LastName, ProfilePictureUrl, Address,  BirthDate, PhoneNumber, Email, UserName, Password, Freeze) VALUES (@FirstName, @LastName, @ProfilePictureUrl, @Address, @BirthDate, @PhoneNumber, @Email, @UserName, @Password, @Freeze);"

						cmd1.Parameters.AddWithValue("@FirstName", TextBoxFirstnameReg.Text)
						cmd1.Parameters.AddWithValue("@LastName", TextBoxLastnameReg.Text)
						cmd1.Parameters.AddWithValue("@ProfilePictureUrl", TextBoxUsernameReg.Text + fileName)
						cmd1.Parameters.AddWithValue("@Address", TextBoxAddress.Text)
						cmd1.Parameters.AddWithValue("@BirthDate", dt)
						cmd1.Parameters.AddWithValue("@PhoneNumber", textBoxPhoneNumber.Text)
						cmd1.Parameters.AddWithValue("@Email", TextBoxEmail.Text)
						cmd1.Parameters.AddWithValue("@UserName", TextBoxUsernameReg.Text)
						cmd1.Parameters.AddWithValue("@Password", Encrypt(TextBoxConfirmReg.Text))
						cmd1.Parameters.AddWithValue("@Freeze", 0)
					ElseIf (RadioButtonListRegister.SelectedItem.Text = "HouseKeeper") Then
						cmd1.CommandText = "
declare @lastHKIdInserted int;
INSERT INTO HouseKeeperTable (FirstName, LastName, ProfilePictureUrl, Address,  BirthDate, PhoneNumber, Email, UserName, Password, Freeze) VALUES (@FirstName, @LastName, @ProfilePictureUrl, @Address, @BirthDate, @PhoneNumber, @Email, @UserName, @Password, @Freeze);
SET @lastHKIdInserted = SCOPE_IDENTITY();
Insert into certificationTable(HKid,certificateName) values (@lastHKIdInserted,@certificateName);
"

						cmd1.Parameters.AddWithValue("@FirstName", TextBoxFirstnameReg.Text)
						cmd1.Parameters.AddWithValue("@LastName", TextBoxLastnameReg.Text)
						cmd1.Parameters.AddWithValue("@ProfilePictureUrl", TextBoxUsernameReg.Text + fileName)
						cmd1.Parameters.AddWithValue("@Address", TextBoxAddress.Text)
						cmd1.Parameters.AddWithValue("@BirthDate", dt)
						cmd1.Parameters.AddWithValue("@PhoneNumber", textBoxPhoneNumber.Text)
						cmd1.Parameters.AddWithValue("@Email", TextBoxEmail.Text)
						cmd1.Parameters.AddWithValue("@UserName", TextBoxUsernameReg.Text)
						cmd1.Parameters.AddWithValue("@Password", Encrypt(TextBoxConfirmReg.Text))
						cmd1.Parameters.AddWithValue("@Freeze", 0)
						cmd1.Parameters.AddWithValue("@certificateName", textBoxCertification.Text)
					End If

					con1.Open()
					cmd1.ExecuteNonQuery()

					cmd1.CommandText = "select " & tblId & " from " & tblName & " where UserName=@UserName;"

					Dim myReader As SqlClient.SqlDataReader
					myReader = cmd1.ExecuteReader()
					Dim chk As Boolean = CheckBoxRegister.Checked
					If myReader.Read Then
						If tblName = "HouseKeeperTable" Then
							'create a memory cookie to store username and pwd
							Response.Cookies("HKun").Value = TextBoxUsernameReg.Text
							Response.Cookies("HKpwd").Value = TextBoxConfirmReg.Text
							If (chk) Then
								'if checkbox is checked, make cookies persistent
								Response.Cookies("HKun").Expires = DateAndTime.Now.AddDays(100)
								Response.Cookies("HKpwd").Expires = DateAndTime.Now.AddDays(100)
							Else
								'delete the cookies if checkbox is unchecked
								Response.Cookies("HKun").Expires = DateAndTime.Now.AddDays(-100)
								Response.Cookies("HKpwd").Expires = DateAndTime.Now.AddDays(-100)
								'delete content of password field
							End If
							'create and save username in a session variable
							Session("HKUsername") = TextBoxUsernameReg.Text
							'create and save userid in a session variable
							Session("HKid") = myReader("HKId")
						ElseIf tblName = "HouseOwnerTable" Then
							'create a memory cookie to store username and pwd
							Response.Cookies("HOun").Value = TextBoxUsernameReg.Text
							Response.Cookies("HOpwd").Value = TextBoxConfirmReg.Text
							If (chk) Then
								'if checkbox is checked, make cookies persistent
								Response.Cookies("HOun").Expires = DateAndTime.Now.AddDays(100)
								Response.Cookies("HOpwd").Expires = DateAndTime.Now.AddDays(100)
							Else
								'delete the cookies if checkbox is unchecked
								Response.Cookies("HOun").Expires = DateAndTime.Now.AddDays(-100)
								Response.Cookies("HOpwd").Expires = DateAndTime.Now.AddDays(-100)
								'delete content of password field
							End If
							'create and save username in a session variable
							Session("HOUsername") = TextBoxUsernameReg.Text
							'create and save userid in a session variable
							Session("HOId") = myReader("HOId")
						End If

					End If

					myReader.Close()
					con1.Close()
					If Not IsNothing(Session("HKUsername")) Then
						'call the sendemail method
						sendMail(ClassSendMail.email, ClassSendMail.pass, TextBoxEmail.Text, TextBoxUsernameReg.Text, "~/ProfilePictures/" + TextBoxUsernameReg.Text + fileName, ClassSendMail.HKViewProfileUrl)
						Response.Redirect("~/HouseKeeper/HKHome.aspx")
					ElseIf Not IsNothing(Session("HOUsername")) Then
						'call the sendemail method
						sendMail(ClassSendMail.email, ClassSendMail.pass, TextBoxEmail.Text, TextBoxUsernameReg.Text, "~/ProfilePictures/" + TextBoxUsernameReg.Text + fileName, ClassSendMail.HOViewProfileUrl)
						Response.Redirect("~/HouseOwner/HOHome.aspx")
					End If
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
			msg.Subject = "Welcome to MoCoolMaid"
			msg.IsBodyHtml = True
			Dim msgBody As New StringBuilder()
			msgBody.Append("Dear " + welcomeUsername + ", your registration is successful, thank you for signing up on MoCoolMaid.")
			msg.Attachments.Add(New Net.Mail.Attachment(Server.MapPath(profilePicUrl)))
			msgBody.Append("<a href='" + clickHereLoginUrl + "'>Click here to view your profile.</a>")
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