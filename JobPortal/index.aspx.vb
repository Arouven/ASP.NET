Public Class index
  Inherits System.Web.UI.Page
  '	Public Sub New()
  '		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
  '	End Sub
  '	Private Function NumberInTable(tableName As String, tableContainFreeze As Boolean, freeze As Boolean)
  '		Dim con As New SqlClient.SqlConnection(_conString)
  '		Dim cmd As New SqlClient.SqlCommand()
  '		cmd.Connection = con
  '		cmd.CommandType = CommandType.Text
  '		Dim sqlFreeze As String = ""
  '		If tableContainFreeze Then
  '			If freeze Then : sqlFreeze = " where Freeze = 1"
  '			ElseIf Not freeze Then : sqlFreeze = " where Freeze = 0"
  '			End If
  '		ElseIf Not tableContainFreeze Then
  '			sqlFreeze = ""
  '		End If
  '		cmd.CommandText = "SELECT count(*) FROM " + tableName + sqlFreeze + ";"
  '		con.Open()
  '		Return cmd.ExecuteScalar()
  '		con.Close()
  '	End Function
  '	Private Sub showDetails(lblCourseName As Label, lblCourseDescription As Label, lblDateSchedule As Label, lblTutorName As Label, lastRowpos As Int16)
  '		Dim con As New SqlClient.SqlConnection(_conString)
  '		Dim cmd As New SqlClient.SqlCommand()
  '		cmd.Connection = con
  '		cmd.CommandType = CommandType.Text
  '		cmd.CommandText = "SELECT TOP 1 * FROM (
  '	SELECT TOP " & lastRowpos & " CourseTable.CourseId,CourseTable.CourseName,CourseTable.CourseDescription,CourseTable.DateSchedule,TutorTable.UserName   FROM CourseTable inner join TutorTable on CourseTable.TutorId=TutorTable.TutorId order BY courseID DESC
  ') z ORDER BY courseID"
  '		'Create DataReader
  '		Dim reader As SqlClient.SqlDataReader
  '		con.Open()
  '		reader = cmd.ExecuteReader()
  '		If reader.HasRows Then
  '			While reader.Read
  '				lblCourseName.Text = reader("CourseName").ToString
  '				lblCourseDescription.Text = reader("CourseDescription")
  '				lblDateSchedule.Text = String.Format("{0:ddd dd, MMM, yyyy}", reader("DateSchedule"))
  '				lblTutorName.Text = reader("UserName")
  '			End While
  '		End If
  '		reader.Close()
  '		con.Close()
  '	End Sub
  '	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
  '		LabelnoCourses.Text = NumberInTable("CourseTable", False, Nothing)
  '		LabelNoStudents.Text = NumberInTable("StudentTable", True, False) + NumberInTable("StudentTable", True, True)
  '		LabelNoTutors.Text = NumberInTable("TutorTable", True, False) + NumberInTable("TutorTable", True, True)

  '		showDetails(LabelCourseTitle1, LabelCourseDescription1, LabelDateSchedule1, LabelTutorName1, 1)
  '		showDetails(LabelCourseTitle2, LabelCourseDescription2, LabelDateSchedule2, LabelTutorName2, 2)
  '		showDetails(LabelCourseTitle3, LabelCourseDescription3, LabelDateSchedule3, LabelTutorName3, 3)
  '		showDetails(LabelCourseTitle4, LabelCourseDescription4, LabelDateSchedule4, LabelTutorName4, 4)
  '	End Sub

End Class