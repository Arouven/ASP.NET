Imports System
Imports System.Web
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Configuration
Imports System.Text
Imports System.IO
Imports System.Security.Cryptography
Imports System.Net.Mail
Public Class Register1
	Inherits System.Web.UI.Page

	Private ReadOnly _conString As String
	Public Sub New()
		_conString = WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If IsPostBack = False Then
			getCountry()
			'insert a default item in Dropdown
			Dim li As New ListItem("select country", "-1")
			ddlCountry.Items.Insert(0, li)
		End If
	End Sub
	Public Sub getCountry()
		Dim con As New SqlConnection(_conString)
		Dim cmd As New SqlCommand()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "Select * from tblcountry"
		cmd.Connection = con
		'Create DataAdapter
		Dim da As New SqlDataAdapter(cmd)
		'Create DataSet
		Dim ds As New DataSet()
		'Fill the Dataset and ensure the DB Connection is closed
		da.Fill(ds)
		'To load country names in dropdown
		ddlCountry.DataSource = ds
		'Assign field name to ddl
		ddlCountry.DataTextField = "Country_Name"
		'ddlCountry.DataTextField = "Country_Id"
		ddlCountry.DataBind()
	End Sub

	Protected Sub btnClear_Click(sender As Object, e As EventArgs)
		txtFname.Text = ""
		txtLname.Text = ""
		txtDob.Text = ""
		ddlCountry.SelectedIndex = 0
		txtStreet.Text = ""
		txtEmail.Text = ""
		txtUsername.Text = ""
		txtPassword.Text = ""
		txtCpassword.Text = ""
	End Sub
	Private Function Encrypt(clearText As String) As String
		Dim EncryptionKey As String = "MAKV2SPBNI99212"
		Dim clearBytes As Byte() = Encoding.Unicode.GetBytes(clearText)
		Using encryptor As Aes = Aes.Create()
			Dim pdb As New Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D, &H65, &H64, &H76, &H65, &H64, &H65, &H76})
			encryptor.Key = pdb.GetBytes(32)
			encryptor.IV = pdb.GetBytes(16)
			Using ms As New MemoryStream()
				Using cs As New CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write)
					cs.Write(clearBytes, 0, clearBytes.Length)
					cs.Close()
				End Using
				clearText = Convert.ToBase64String(ms.ToArray())
			End Using
		End Using
		Return clearText
	End Function

	Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
		'Check whether the fileupload contains a file
		If (FileUpload1.HasFile) Then
			'Add the filename name as a parameter
			If (CheckFileType(FileUpload1.FileName)) Then
				Dim fileName As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
				FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName)
				Dim con As New SqlConnection(_conString)
				Dim cmd As New SqlCommand()
				cmd.CommandType = CommandType.Text
				'search for username from tbluser
				cmd.CommandText = "select username from tblUser where username=@uname;"
				cmd.Connection = con
				'create a parameterized query
				cmd.Parameters.AddWithValue("@uname", txtUsername.Text)

				'Create DataReader
				Dim myReader As SqlDataReader
				con.Open()
				myReader = cmd.ExecuteReader()
				'Check if username already exists in the DB
				If (myReader.HasRows) Then
					lblmsg.Text = "Username Already Exist, Please Choose Another"
					lblmsg.ForeColor = System.Drawing.Color.Red
					txtUsername.Focus()
				Else
					'Ensure the DataReader is closed
					myReader.Close()

					Dim strDate As String
					strDate = txtDob.Text
					Dim dt As DateTime
					dt = Convert.ToDateTime(strDate)
					'Create another Command object to store insert statement
					Dim con1 As New SqlConnection(_conString)
					Dim cmd1 As New SqlCommand()
					cmd1.Connection = con1
					cmd1.CommandType = CommandType.Text
					cmd1.CommandText = "INSERT INTO tbluser(firstname, lastname,country, street, DOB, imageurl, email, username, pwd, status, sa_id) VALUES (@firstname, @lastname, @country, @street, @dob, @imgname, @email, @username, @pwd, @status, @said);"
					cmd1.Parameters.AddWithValue("@firstname", txtFname.Text)
					cmd1.Parameters.AddWithValue("@lastname", txtLname.Text)
					cmd1.Parameters.AddWithValue("@country", ddlCountry.SelectedItem.Text)
					cmd1.Parameters.AddWithValue("@street", txtStreet.Text)
					cmd1.Parameters.AddWithValue("@dob", dt)
					cmd1.Parameters.AddWithValue("@imgname", fileName)
					cmd1.Parameters.AddWithValue("@email", txtEmail.Text)
					cmd1.Parameters.AddWithValue("@username", txtUsername.Text)
					'add a method to encrypt your password
					cmd1.Parameters.AddWithValue("@pwd", Encrypt(txtPassword.Text))
					'set the status to inactive or active
					cmd1.Parameters.AddWithValue("@status", 1)
					cmd1.Parameters.AddWithValue("@said", 1)


					con1.Open()
					cmd1.ExecuteNonQuery()
					'call the sendemail method
					'sendemail()

					con1.Close()
					Response.Redirect("login.aspx")
				End If
			End If
		End If
	End Sub

	'check file format before uploading
	Function CheckFileType(ByVal fileName As String) As Boolean
		Dim ext As String = Path.GetExtension(fileName)
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

	Public Sub sendemail()
		Dim filename As String
		filename = Path.GetFileName(FileUpload1.PostedFile.FileName)
		Dim msg As New MailMessage()
		Dim sc As New SmtpClient()
		Try
			msg.From = New MailAddress("admin@gmail.com")
			msg.To.Add(txtEmail.Text)
			msg.Subject = "This is a Test Mail"
			msg.IsBodyHtml = True
			Dim msgBody As New StringBuilder()
			msgBody.Append("Dear " + txtUsername.Text + ", your registration is successful, thank you for signing up on xyz.")
			msg.Attachments.Add(New Attachment(Server.MapPath("~/Images/") + filename))
			msgBody.Append("<a href='http://localhost/login'>Click here to login to ...</a>")
			msg.Body = msgBody.ToString()
			sc.Host = "smtp.gmail.com"
			sc.Port = 587
			sc.UseDefaultCredentials = False
			sc.Credentials = New System.Net.NetworkCredential("admin@gmail.com", "password")
			sc.EnableSsl = True
			sc.Send(msg)
			Response.Write("Email Sent successfully")
		Catch ex As Exception
			Response.Write(ex.Message)
		End Try
	End Sub
End Class