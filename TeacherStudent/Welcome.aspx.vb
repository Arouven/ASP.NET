Public Class Welcome1
    Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub


	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'LoginRequired(mySession)
		'getWelcomeMessage()
	End Sub
	Private Sub LoginRequired(mySession)
		If Not IsNothing(mySession) Then
		Else Response.Redirect("~/Home.aspx")
		End If
	End Sub
	Private Sub getWelcomeMessage()
		Dim login As String = getLoginTitle()
		Dim name As String = Session("username")
		LabelWelcome.Text = "Welcome " & name & " you are logged in as " & login & "."
	End Sub
	Private Function getLoginTitle() As String
		Dim Name As String = ""
		Dim user As String = Session("username")
		If (UsernameExistInTable("StudentTable", user)) Then : Name = "Student"
		ElseIf (UsernameExistInTable("TutorTable", user)) Then : Name = "Tutor"
		ElseIf (UsernameExistInTable("AdminTable", user)) Then : Name = "Administrator"
		End If
		Return Name
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
End Class