Public Class UserDetails
	Inherits System.Web.UI.Page

	Private ReadOnly _conString As String
	Private isFreeze As Boolean


	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'AdminRequired()
		showDetails(LabelTitle)
	End Sub
	Protected Sub LinkButtonUpdate_Click(sender As Object, e As EventArgs)
		If UnfreezeFreezeUser() Then : Response.Redirect("~/AdminViewsListOfTutorsStudents.aspx")
		ElseIf Not UnfreezeFreezeUser() Then : ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertmsg", "alert('Problem encounter');", True)
		End If
	End Sub
	Protected Sub LinkButtonDelete_Click(sender As Object, e As EventArgs)
		If deleteUser() Then : Response.Redirect("~/AdminViewsListOfTutorsStudents.aspx")
		ElseIf Not deleteUser() Then : ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertmsg", "alert('Problem encounter');", True)
		End If
	End Sub
	Private Sub AdminRequired()

	End Sub
	Private Function deleteUser() As Boolean
		Dim IsDeleted As Boolean = False
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim requestId As Integer = Request.QueryString("id")
		Dim requestUser As String = Request.QueryString("user")
		Dim tableName As String = ""
		Dim tableId As String = ""
		If requestUser = "Tutor" Then
			tableName = "TutorTable"
			tableId = "TutorId"
		ElseIf requestUser = "Student" Then
			tableName = "StudentTable"
			tableId = "StudentId"
		End If
		cmd.CommandText = "DELETE FROM " & tableName & " where " & tableId & "=@requestId;" '
		cmd.Parameters.AddWithValue("@requestId", requestId)

		con.Open()
		'use Command method to execute DELETE statement and return
		'boolean if number of records DELETED is greater than zero
		IsDeleted = cmd.ExecuteNonQuery > 0
		con.Close()
		Return IsDeleted
	End Function








	Protected Sub LinkButtonResetPassword_Click(sender As Object, e As EventArgs)

	End Sub






	Private Sub showDetails(userTitle As Label)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim requestId As Integer = Request.QueryString("id")
		Dim requestUser As String = Request.QueryString("user")
		userTitle.Text = requestUser.ToString
		Dim tableName As String = ""
		Dim tableId As String = ""
		If requestUser = "Tutor" Then
			tableName = "TutorTable"
			tableId = "TutorId"
		ElseIf requestUser = "Student" Then
			tableName = "StudentTable"
			tableId = "StudentId"
		End If
		cmd.CommandText = "SELECT Freeze, " & tableId & ", ProfilePictureUrl, UserName, FirstName, LastName, Address, BirthDate, PhoneNumber, Email FROM " & tableName & " where " & tableId & "=@requestId;" '
		cmd.Parameters.AddWithValue("@requestId", requestId)
		'Create DataReader
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		'Bind the reader to the repeater control
		DataListUserDetails.DataSource = reader
		DataListUserDetails.DataBind()
		isFreeze = getIsFreeze(tableName, tableId, requestId)
		reader.Close()
		con.Close()
	End Sub
	Private Function getIsFreeze(tableName, tableId, requestId) As Boolean
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT Freeze FROM " & tableName & " where " & tableId & "=@requestId;" '
		cmd.Parameters.AddWithValue("@requestId", requestId)
		'Create DataReader
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()

		While reader.Read
			Return reader.GetBoolean(0)
		End While
		reader.Close()
		con.Close()
		Return False
	End Function


	Private Function UnfreezeFreezeUser() As Boolean
		Dim IsUpdated As Boolean = False
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim requestId As Integer = Request.QueryString("id")
		Dim requestUser As String = Request.QueryString("user")
		Dim tableName As String = ""
		Dim tableId As String = ""
		If requestUser = "Tutor" Then
			tableName = "TutorTable"
			tableId = "TutorId"
		ElseIf requestUser = "Student" Then
			tableName = "StudentTable"
			tableId = "StudentId"
		End If
		cmd.CommandText = "update " & tableName & " set Freeze=@isFreeze where " & tableId & "=@requestId;"
		'Create two parameterized queries
		cmd.Parameters.AddWithValue("@isFreeze", Not (isFreeze))
		cmd.Parameters.AddWithValue("@requestId", requestId)
		con.Open()
		'use Command method to execute UPDATE statement and return
		'boolean if number of records UPDATED is greater than zero
		IsUpdated = cmd.ExecuteNonQuery() > 0
		con.Close()
		Return IsUpdated
	End Function

End Class