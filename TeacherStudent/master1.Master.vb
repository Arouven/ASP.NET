

Public Class master1
	Inherits System.Web.UI.MasterPage




	Private Sub lgout()
		If (Not IsNothing(Session("username")) Or Not IsNothing(Session("adminuname"))) Then
			'Remove all session
			Session.RemoveAll()
			'Destroy all Session objects
			Session.Abandon()
			'Redirect to homepage or login page
			Response.Redirect("~/Tutorials/Week5/login.aspx")
		End If
	End Sub
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
		If (Not IsNothing(Session("adminuname"))) Then
			lgregis.CssClass = "nav navbar-nav navbar-right"
			lbllgged.CssClass = "btn btn-success text-white"
			lbllgged.Text = "Welcome " + Session("adminuname")
			btnlgout.Visible = True
			pnlmanage.Visible = True
			pnlmanagemov.Style.Add("visibility", "hidden")
			Page.Controls.Remove(pnlmanagemov)
			pnlprofile.Style.Add("visibility", "hidden")
			Page.Controls.Remove(pnlprofile)
			pnllog.Style.Add("visibility", "hidden")
			Page.Controls.Remove(pnllog)
		End If

		If (Not Page.IsPostBack) Then
			If (Not IsNothing(Request.Cookies("Sun")) And Not IsNothing(Request.Cookies("Spwd"))) Then
				btnlgout.Visible = True
			End If
			If (Not IsNothing(Request.Cookies("Tun")) And Not IsNothing(Request.Cookies("Tpwd"))) Then
				btnlgout.Visible = True
			End If
			If (Not IsNothing(Request.Cookies("Aun")) And Not IsNothing(Request.Cookies("Apwd"))) Then
				btnlgout.Visible = True
			End If
		End If


	End Sub


	'	Private Function Decrypt(cipherText As String) As String
	'		Dim EncryptionKey As String = "MAKV2SPBNI99212"
	'		Dim clearBytes As Byte() = Encoding.Unicode.GetBytes(cipherText)
	'		Using encryptor As Security.Cryptography.Aes = Security.Cryptography.Aes.Create()
	'			Dim pdb As New Security.Cryptography.Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D, &H65, &H64, &H76, &H65, &H64, &H65, &H76})
	'			encryptor.Key = pdb.GetBytes(32)
	'			encryptor.IV = pdb.GetBytes(16)
	'			Using ms As New IO.MemoryStream()
	'				Using cs As New Security.Cryptography.CryptoStream(ms, encryptor.CreateEncryptor(), Security.Cryptography.CryptoStreamMode.Write)
	'					cs.Write(clearBytes, 0, clearBytes.Length)
	'					cs.Close()
	'				End Using
	'				cipherText = Convert.ToBase64String(ms.ToArray())
	'			End Using
	'		End Using
	'		Return cipherText
	'	End Function

	'	Protected Sub ButtonAdminLogin_Click(sender As Object, e As EventArgs)
	'		Dim username As String = Request.Cookies("Aun").Value
	'		Dim password As String = Request.Cookies("Apwd").Value
	'		Dim chk As Boolean = AdminRememberMe.Checked
	'		Dim con As New SqlClient.SqlConnection(_conString)
	'		Dim cmd As New SqlClient.SqlCommand()
	'		cmd.Connection = con
	'		cmd.CommandType = CommandType.Text
	'		'searching for a record containing matching username & password with
	'		'an active status
	'		cmd.CommandText = "select * from AdminTable where username=@username and password=@password and freeze=0"
	'		'create three parameterized query for the above select statement
	'		'use above variables and decrypt password
	'		cmd.Parameters.AddWithValue("@username", username)
	'		cmd.Parameters.AddWithValue("@password", Decrypt(password))
	'		Dim myReader As SqlClient.SqlDataReader
	'		con.Open()
	'		myReader = cmd.ExecuteReader()
	'		'check if the DataReader contains a record
	'		If (myReader.HasRows) Then
	'			If myReader.Read Then
	'				'create a memory cookie to store username and pwd
	'				Response.Cookies("Aun").Value = username
	'				Response.Cookies("Apwd").Value = password
	'				If (chk) Then
	'					'if checkbox is checked, make cookies persistent
	'					Response.Cookies("Aun").Expires = DateAndTime.Now.AddDays(100)
	'					Response.Cookies("Apwd").Expires = DateAndTime.Now.AddDays(100)
	'				Else
	'					'delete the cookies if checkbox is unchecked
	'					Response.Cookies("Aun").Expires = DateAndTime.Now.AddDays(-100)
	'					Response.Cookies("Apwd").Expires = DateAndTime.Now.AddDays(-100)
	'					'delete content of password field
	'				End If
	'				'create and save username in a session variable
	'				Session("AdminUsername") = username
	'				'create and save userid in a session variable
	'				Session("AdminId") = myReader("AdminId")
	'				'redirect to the corresponding page
	'				Response.Redirect("~/Admin/AdminHome.aspx")
	'				con.Close()
	'			End If
	'		Else
	'			'delete content of password field
	'			lblStatus.Text = "You are not registered or your account has been suspended!"
	'			'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "PopA", "return loginModal()", True)
	'			'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowA", "return ShowAdmin()", True)
	'		End If
	'	End Sub

	'	Protected Sub ButtonTutorLogin_Click(sender As Object, e As EventArgs)
	'		Dim username As String = Request.Cookies("Tun").Value
	'		Dim password As String = Request.Cookies("Tpwd").Value
	'		Dim chk As Boolean = TutorRememberMe.Checked
	'		Dim con As New SqlClient.SqlConnection(_conString)
	'		Dim cmd As New SqlClient.SqlCommand()
	'		cmd.Connection = con
	'		cmd.CommandType = CommandType.Text
	'		'searching for a record containing matching username & password with
	'		'an active status
	'		cmd.CommandText = "select * from TutorTable where username=@username and password=@password and freeze=0"
	'		'create three parameterized query for the above select statement
	'		'use above variables and decrypt password
	'		cmd.Parameters.AddWithValue("@username", username)
	'		cmd.Parameters.AddWithValue("@password", Decrypt(password))
	'		Dim myReader As SqlClient.SqlDataReader
	'		con.Open()
	'		myReader = cmd.ExecuteReader()
	'		'check if the DataReader contains a record
	'		If (myReader.HasRows) Then
	'			If myReader.Read Then
	'				'create a memory cookie to store username and pwd
	'				Response.Cookies("Tun").Value = username
	'				Response.Cookies("Tpwd").Value = password
	'				If (chk) Then
	'					'if checkbox is checked, make cookies persistent
	'					Response.Cookies("Tun").Expires = DateAndTime.Now.AddDays(100)
	'					Response.Cookies("Tpwd").Expires = DateAndTime.Now.AddDays(100)
	'				Else
	'					'delete the cookies if checkbox is unchecked
	'					Response.Cookies("Tun").Expires = DateAndTime.Now.AddDays(-100)
	'					Response.Cookies("Tpwd").Expires = DateAndTime.Now.AddDays(-100)
	'					'delete content of password field
	'				End If
	'				'create and save username in a session variable
	'				Session("TutorUsername") = username
	'				'create and save userid in a session variable
	'				Session("TutorId") = myReader("TutorId")
	'				'redirect to the corresponding page
	'				Response.Redirect("~/Tutor/TutorHome.aspx")
	'				con.Close()
	'			End If
	'		Else
	'			'delete content of password field
	'			lblStatus.Text = "You are not registered or your account has been suspended!"
	'			'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "PopT", "return loginModal()", True)
	'			'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowT", "return ShowTutor()", True)
	'		End If
	'	End Sub

	'	Protected Sub ButtonStudentLogin_Click(sender As Object, e As EventArgs)
	'		Dim username As String = Request.Cookies("Sun").Value
	'		Dim password As String = Request.Cookies("Spwd").Value
	'		Dim chk As Boolean = StudentRememberMe.Checked
	'		Dim con As New SqlClient.SqlConnection(_conString)
	'		Dim cmd As New SqlClient.SqlCommand()
	'		cmd.Connection = con
	'		cmd.CommandType = CommandType.Text
	'		'searching for a record containing matching username & password with
	'		'an active status
	'		cmd.CommandText = "select * from StudentTable where username=@username and password=@password and freeze=0"
	'		'create three parameterized query for the above select statement
	'		'use above variables and decrypt password
	'		cmd.Parameters.AddWithValue("@username", username)
	'		cmd.Parameters.AddWithValue("@password", Decrypt(password))
	'		Dim myReader As SqlClient.SqlDataReader
	'		con.Open()
	'		myReader = cmd.ExecuteReader()
	'		'check if the DataReader contains a record
	'		If (myReader.HasRows) Then
	'			If myReader.Read Then
	'				'create a memory cookie to store username and pwd
	'				Response.Cookies("Sun").Value = username
	'				Response.Cookies("Spwd").Value = password
	'				If (chk) Then
	'					'if checkbox is checked, make cookies persistent
	'					Response.Cookies("Sun").Expires = DateAndTime.Now.AddDays(100)
	'					Response.Cookies("Spwd").Expires = DateAndTime.Now.AddDays(100)
	'				Else
	'					'delete the cookies if checkbox is unchecked
	'					Response.Cookies("Sun").Expires = DateAndTime.Now.AddDays(-100)
	'					Response.Cookies("Spwd").Expires = DateAndTime.Now.AddDays(-100)
	'					'delete content of password field
	'				End If
	'				'create and save username in a session variable
	'				Session("StudentUsername") = username
	'				'create and save userid in a session variable
	'				Session("StudentId") = myReader("StudentId")
	'				'redirect to the corresponding page
	'				Response.Redirect("~/Student/StudentHome.aspx")
	'				con.Close()
	'			End If
	'		Else
	'			'delete content of password field
	'			lblStatus.Text = "You are not registered or your account has been suspended!"
	'			'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "PopS", "return loginModal()", True)
	'			'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowS", "return ShowStudent()", True)
	'		End If
	'	End Sub
End Class


