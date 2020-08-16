Public Class StudentUpdatesProfile
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub

	Private StudentId As Integer

	Private Sub showCourseDetails()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select * from StudentTable where Studentid=@Studentid;"
		cmd.Parameters.AddWithValue("@StudentId", StudentId)
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		If reader.HasRows Then
			While reader.Read
				HiddenFieldTutorId.Value = reader(0)
				TextBoxFirstnameReg.Text = reader(1)
				TextBoxLastnameReg.Text = reader(2)
				ImageTutorProfile.ImageUrl = "~/ProfilePictures/" & reader(3)
				TextBoxAddress.Text = reader(4)
				textBoxDOB.Text = Convert.ToDateTime(reader(5)).ToString("yyyy-MM-dd")
				textBoxPhoneNumber.Text = reader(6)
				TextBoxEmail.Text = reader(7)
				TextBoxUsernameReg.Text = reader(8)
			End While
		End If
		reader.Close()
		con.Close()
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsNothing(Session("StudentId")) Then
			StudentId = Session("StudentId")
		Else Response.Redirect("~/Student/StudentLogin.aspx")
		End If
		If Not IsPostBack Then
			showCourseDetails()
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
			msg.Subject = "Updated profile"
			msg.IsBodyHtml = True
			Dim msgBody As New StringBuilder()
			msgBody.Append("Dear " + welcomeUsername + ", your account has been successfully updated.")
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

	Private Function UsernameExistInStudentTable(userName As String)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select count(UserName) from StudentTable where UserName=@UserName;"
		cmd.Connection = con
		'create a parameterized query
		cmd.Parameters.AddWithValue("@UserName", userName)
		'Create DataReader
		con.Open()
		Dim count As Integer = Convert.ToInt32(cmd.ExecuteScalar)
		If count > 1 Then
			Return True 'exist
		Else
			Return False 'his or non
		End If
		con.Close()
	End Function


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


	Private Function EmailExistInStudentTable(Email As String)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select count(Email) from StudentTable where Email=@Email;"
		cmd.Connection = con
		'create a parameterized query
		cmd.Parameters.AddWithValue("@Email", Email)
		'Create DataReader
		Dim count As Integer = Convert.ToInt32(cmd.ExecuteScalar)
		If count > 1 Then
			Return True 'exist
		Else
			Return False 'his or non
		End If
		con.Close()
	End Function

	Protected Sub ButtonRegister_Click(sender As Object, e As EventArgs)
		'Check whether the fileupload contains a file
		If (FileUpload1.HasFile) Then
			'Add the filename name as a parameter
			If (CheckFileType(FileUpload1.FileName)) Then
				Dim fileName As String = IO.Path.GetFileName(FileUpload1.PostedFile.FileName)
				FileUpload1.PostedFile.SaveAs(Server.MapPath("~/ProfilePictures/") + TextBoxUsernameReg.Text + fileName)
				'Check if username already exists in the DB
				If (UsernameExistInTable("TutorTable", TextBoxUsernameReg.Text)) OrElse (UsernameExistInTable("AdminTable", TextBoxUsernameReg.Text)) Then
					lblStatus.Text = "Username Already Exist, Please Choose Another"
					lblStatus.ForeColor = System.Drawing.Color.Red
					TextBoxUsernameReg.Focus()
				ElseIf (UsernameExistInStudentTable(TextBoxUsernameReg.Text)) Then
					lblStatus.Text = "Username Already Exist, Please Choose Another"
					lblStatus.ForeColor = System.Drawing.Color.Red
					TextBoxUsernameReg.Focus()


				ElseIf (EmailExistInTable("TutorTable", TextBoxEmail.Text)) OrElse (EmailExistInTable("AdminTable", TextBoxEmail.Text)) Then
					lblStatus.Text = "Email Already in use, Please Choose Another"
					lblStatus.ForeColor = System.Drawing.Color.Red
					TextBoxUsernameReg.Focus()
				ElseIf (EmailExistInStudentTable(TextBoxEmail.Text)) Then
					lblStatus.Text = "Email Already in use, Please Choose Another"
					lblStatus.ForeColor = System.Drawing.Color.Red
					TextBoxUsernameReg.Focus()
				Else
					Dim dt As DateTime = Convert.ToDateTime(textBoxDOB.Text)
					'Create another Command object to store insert statement
					Dim con1 As New SqlClient.SqlConnection(_conString)
					Dim cmd1 As New SqlClient.SqlCommand()
					cmd1.Connection = con1
					cmd1.CommandType = CommandType.Text
					cmd1.CommandText = "update StudentTable set 
FirstName=@FirstName, 
LastName=@LastName, 
ProfilePictureUrl=@ProfilePictureUrl, 
Address=@Address,  
BirthDate=@BirthDate, 
PhoneNumber=@PhoneNumber, 
Email=@Email, 
UserName=@UserName, 
Password =@Password
where StudentId=@StudentId;"

					cmd1.Parameters.AddWithValue("@FirstName", TextBoxFirstnameReg.Text)
					cmd1.Parameters.AddWithValue("@LastName", TextBoxLastnameReg.Text)
					cmd1.Parameters.AddWithValue("@ProfilePictureUrl", TextBoxUsernameReg.Text + fileName)
					cmd1.Parameters.AddWithValue("@Address", TextBoxAddress.Text)
					cmd1.Parameters.AddWithValue("@BirthDate", dt)
					cmd1.Parameters.AddWithValue("@PhoneNumber", textBoxPhoneNumber.Text)
					cmd1.Parameters.AddWithValue("@Email", TextBoxEmail.Text)
					cmd1.Parameters.AddWithValue("@UserName", TextBoxUsernameReg.Text)
					cmd1.Parameters.AddWithValue("@Password", Encrypt(TextBoxConfirmReg.Text))
					cmd1.Parameters.AddWithValue("@StudentId", StudentId)
					con1.Open()
					cmd1.ExecuteNonQuery()
					con1.Close()
					Session("StudentUsername") = TextBoxUsernameReg.Text
					sendMail(ClassSendMail.email, ClassSendMail.pass, TextBoxEmail.Text, TextBoxUsernameReg.Text, "~/ProfilePictures/" + TextBoxUsernameReg.Text + fileName, ClassSendMail.TutorViewProfileUrl)
					Response.Redirect("~/Student/StudentHome.aspx")

				End If
			End If
		Else
			If (UsernameExistInTable("TutorTable", TextBoxUsernameReg.Text)) OrElse (UsernameExistInTable("AdminTable", TextBoxUsernameReg.Text)) Then
				lblStatus.Text = "Username Already Exist, Please Choose Another"
				lblStatus.ForeColor = System.Drawing.Color.Red
				TextBoxUsernameReg.Focus()
			ElseIf (UsernameExistInStudentTable(TextBoxUsernameReg.Text)) Then
				lblStatus.Text = "Username Already Exist, Please Choose Another"
				lblStatus.ForeColor = System.Drawing.Color.Red
				TextBoxUsernameReg.Focus()


			ElseIf (EmailExistInTable("TutorTable", TextBoxEmail.Text)) OrElse (EmailExistInTable("AdminTable", TextBoxEmail.Text)) Then
				lblStatus.Text = "Email Already in use, Please Choose Another"
				lblStatus.ForeColor = System.Drawing.Color.Red
				TextBoxUsernameReg.Focus()
			ElseIf (EmailExistInStudentTable(TextBoxEmail.Text)) Then
				lblStatus.Text = "Email Already in use, Please Choose Another"
				lblStatus.ForeColor = System.Drawing.Color.Red
				TextBoxUsernameReg.Focus()
			Else
				Dim dt As DateTime = Convert.ToDateTime(textBoxDOB.Text)
				'Create another Command object to store insert statement
				Dim con1 As New SqlClient.SqlConnection(_conString)
				Dim cmd1 As New SqlClient.SqlCommand()
				cmd1.Connection = con1
				cmd1.CommandType = CommandType.Text
				cmd1.CommandText = "update StudentTable set 
FirstName=@FirstName, 
LastName=@LastName, 
Address=@Address,  
BirthDate=@BirthDate, 
PhoneNumber=@PhoneNumber, 
Email=@Email, 
UserName=@UserName, 
Password =@Password
where StudentId=@StudentId;"

				cmd1.Parameters.AddWithValue("@FirstName", TextBoxFirstnameReg.Text)
				cmd1.Parameters.AddWithValue("@LastName", TextBoxLastnameReg.Text)
				cmd1.Parameters.AddWithValue("@Address", TextBoxAddress.Text)
				cmd1.Parameters.AddWithValue("@BirthDate", dt)
				cmd1.Parameters.AddWithValue("@PhoneNumber", textBoxPhoneNumber.Text)
				cmd1.Parameters.AddWithValue("@Email", TextBoxEmail.Text)
				cmd1.Parameters.AddWithValue("@UserName", TextBoxUsernameReg.Text)
				cmd1.Parameters.AddWithValue("@Password", Encrypt(TextBoxConfirmReg.Text))
				cmd1.Parameters.AddWithValue("@StudentId", StudentId)
				con1.Open()
				cmd1.ExecuteNonQuery()
				con1.Close()
				Session("StudentUsername") = TextBoxUsernameReg.Text
				sendMail(ClassSendMail.email, ClassSendMail.pass, TextBoxEmail.Text, TextBoxUsernameReg.Text, "", ClassSendMail.TutorViewProfileUrl)
				Response.Redirect("~/Student/StudentHome.aspx")

			End If
		End If
	End Sub
End Class