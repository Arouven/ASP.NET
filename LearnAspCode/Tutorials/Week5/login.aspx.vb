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

Public Class login1
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
	End Sub
	Private Function Decrypt(cipherText As String) As String
		Dim EncryptionKey As String = "MAKV2SPBNI99212"
		Dim clearBytes As Byte() = Encoding.Unicode.GetBytes(cipherText)
		Using encryptor As Aes = Aes.Create()
			Dim pdb As New Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D,
											  &H65, &H64, &H76, &H65, &H64, &H65,
											  &H76})
			encryptor.Key = pdb.GetBytes(32)
			encryptor.IV = pdb.GetBytes(16)
			Using ms As New MemoryStream()
				Using cs As New CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write)
					cs.Write(clearBytes, 0, clearBytes.Length)
					cs.Close()
				End Using
				cipherText = Convert.ToBase64String(ms.ToArray())
			End Using
		End Using
		Return cipherText
	End Function
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If (Not Page.IsPostBack) Then
			'Verify if un and pwd cookies are not null
			If (Not IsNothing(Request.Cookies("un")) And Not IsNothing(Request.Cookies("pwd"))) Then
				'Populate the Username and Password Textboxes by retrieving the values
				'from the cookies
				userlogin.username = Request.Cookies("un").Value
				userlogin.password = Request.Cookies("pwd").Value
			End If
		End If
	End Sub

	Protected Sub btnLogin_Click(sender As Object, e As EventArgs)
		'get the value of username and password fields and state of checkbox from
		'login form
		Dim username As String = userlogin.Username
		Dim password As String = userlogin.password
		Dim chk As Boolean = userlogin.chk
		Dim con As New SqlConnection(_conString)
		Dim cmd As New SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		'searching for a record containing matching username & password with
		'an active status
		cmd.CommandText = "select * from tbluser where username=@uname and pwd=@pass and status=@status"
		'create three parameterized query for the above select statement
		'use above variables and decrypt password
		cmd.Parameters.AddWithValue("@uname", username)
		cmd.Parameters.AddWithValue("@pass", Decrypt(password))
		cmd.Parameters.AddWithValue("@status", 1)
		Dim myReader As SqlDataReader
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
				Session("userid") = myReader("User_Id")
				'redirect to the corresponding page
				Response.Redirect("showrndquotation.aspx")
				con.Close()
			End If
		Else
			'delete content of password field
			lblmsg.Text = "You are not registered or your account has been suspended!"
		End If
	End Sub
End Class