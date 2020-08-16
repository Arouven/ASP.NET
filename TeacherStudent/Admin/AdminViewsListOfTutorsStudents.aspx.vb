Public Class AdminViewsListOfTutorsStudents
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

		If Not IsNothing(Session("AdminId")) Then

			FillDataList(DataListStudentUnfreeze, "StudentTable", False)
			FillDataList(DataListTutorUnfreeze, "TutorTable", False)
			FillDataList(DataListStudentFreeze, "StudentTable", True)
			FillDataList(DataListTutorFreeze, "TutorTable", True)


			LabelTotalStudentUnfreeze.Text = "Number of Student not freeze In Database: " & NumberInTable("StudentTable", True, False)
			LabelTotalTutorUnfreeze.Text = "Number of Tutor not freeze In Database: " & NumberInTable("TutorTable", True, False)
			LabelTotalStudentFreeze.Text = "Number of Student freeze In Database: " & NumberInTable("StudentTable", True, True)
			LabelTotalTutorFreeze.Text = "Number of Tutor freeze In Database: " & NumberInTable("TutorTable", True, True)


			LabelNoStudents.Text = "Number of Student not freeze In Database: " & (NumberInTable("StudentTable", True, False) + NumberInTable("StudentTable", True, True))
			LabelNoCourses.Text = "Number of Course In Database: " & NumberInTable("CourseTable", False, Nothing)


		Else Response.Redirect("~/Admin/AdminLogin.aspx")
		End If

	End Sub



	Private Sub FillDataList(myDataList As DataList, tableName As String, freeze As Boolean)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim id As String = ""
		If tableName = "StudentTable" Then
			id = "StudentId"
		ElseIf tableName = "TutorTable" Then
			id = "TutorId"
		End If
		Dim sqlFreeze As String = ""
		If freeze Then : sqlFreeze = " where Freeze = 1"
		ElseIf Not freeze Then : sqlFreeze = " where Freeze = 0"
		End If
		cmd.CommandText = "SELECT " + id + ", UserName, ProfilePictureUrl FROM " + tableName + sqlFreeze + ";"

		'Create DataAdapter
		Dim myDataAdapter As New SqlClient.SqlDataAdapter(cmd)
		'Create DataSet
		Dim myDataSet As New DataSet()
		Using (myDataAdapter)
			myDataAdapter.Fill(myDataSet)
		End Using
		myDataList.DataSource = myDataSet
		myDataList.DataBind()
	End Sub
	Private Function NumberInTable(tableName As String, tableContainFreeze As Boolean, freeze As Boolean)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim sqlFreeze As String = ""
		If tableContainFreeze Then
			If freeze Then : sqlFreeze = " where Freeze = 1"
			ElseIf Not freeze Then : sqlFreeze = " where Freeze = 0"
			End If
		ElseIf Not tableContainFreeze Then
			sqlFreeze = ""
		End If
		cmd.CommandText = "SELECT count(*) FROM " + tableName + sqlFreeze + ";"
		con.Open()
		Return cmd.ExecuteScalar()
		con.Close()
	End Function

End Class