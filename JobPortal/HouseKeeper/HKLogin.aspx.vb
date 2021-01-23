Public Class HKLogin
  Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		LabelReset.Text = "Request the web admin to reset your password on" & ClassSendMail.email & "."
		If (Not Page.IsPostBack) Then
			If (Not IsNothing(Request.Cookies("HKun")) And Not IsNothing(Request.Cookies("HKpwd"))) Then
				TextBoxUsernameStudentLog.Text = Request.Cookies("HKun").Value
				TextBoxPasswordStudentLog.Attributes("value") = Request.Cookies("HKpwd").Value
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
	Protected Sub ButtonStudentLogin_Click(sender As Object, e As EventArgs)
		Dim username As String = TextBoxUsernameStudentLog.Text
		Dim password As String = TextBoxPasswordStudentLog.Text
		Dim chk As Boolean = StudentRememberMe.Checked
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		'searching for a record containing matching username & password with
		'an active status
		cmd.CommandText = "select * from HouseKeeperTable where username=@username and password=@password and freeze=0"
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
				Response.Cookies("HKun").Value = username
				Response.Cookies("HKpwd").Value = password
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
				Session("HKUsername") = username
				'create and save userid in a session variable
				Session("HKId") = myReader("HKId")
				'redirect to the corresponding page
				Response.Redirect("~/HouseKeeper/HKHome.aspx")
				con.Close()
			End If
		Else
			'delete content of password field
			lblStatus.Text = "You are not registered or your account has been suspended!"
			'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "PopS", "return loginModal()", True)
			'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowS", "return ShowStudent()", True)
		End If
	End Sub
End Class