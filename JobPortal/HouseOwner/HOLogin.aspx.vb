Public Class HOLogin
  Inherits System.Web.UI.Page

	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		LabelReset.Text = "Request the web admin to reset your password on" & ClassSendMail.email & "."
		If (Not Page.IsPostBack) Then
			If (Not IsNothing(Request.Cookies("HOun")) And Not IsNothing(Request.Cookies("HOpwd"))) Then
				TextBoxUsernameTutorLog.Text = Request.Cookies("HOun").Value
				TextBoxPasswordTutorLog.Attributes("value") = Request.Cookies("HOpwd").Value
			End If
		End If
	End Sub
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
	Protected Sub ButtonTutorLogin_Click(sender As Object, e As EventArgs)
		Dim username As String = TextBoxUsernameTutorLog.Text
		Dim password As String = TextBoxPasswordTutorLog.Text
		Dim chk As Boolean = TutorRememberMe.Checked
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		'searching for a record containing matching username & password with
		'an active status
		cmd.CommandText = "select * from HouseOwnerTable where username=@username and password=@password and freeze=0"
		'create three parameterized query for the above select statement
		'use above variables and decrypt password
		cmd.Parameters.AddWithValue("@username", username)
		cmd.Parameters.AddWithValue("@password", Decrypt(password))
		Dim myReader As SqlClient.SqlDataReader
		con.Open()
		myReader = cmd.ExecuteReader()
		'check if the DataReader contains a record
		If (myReader.HasRows) Then
			If myReader.Read Then
				'create a memory cookie to store username and pwd
				Response.Cookies("HOun").Value = username
				Response.Cookies("HOpwd").Value = password
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
				Session("HOUsername") = username
				'create and save userid in a session variable
				Session("HOId") = myReader("HOId")
				'redirect to the corresponding page
				Response.Redirect("~/HouseOwner/HOHome.aspx")
				con.Close()
			End If
		Else
			'delete content of password field
			lblStatus.Text = "You are not registered or your account has been suspended!"
			'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "PopT", "return loginModal()", True)
			'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowT", "return ShowTutor()", True)
		End If
	End Sub
End Class