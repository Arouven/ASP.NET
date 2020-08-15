Public Class TutorHome
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Private TutorId As Integer
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Private Function TotalCourse()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT count(*) FROM courseTable;"
		con.Open()
		Return cmd.ExecuteScalar()
		con.Close()
	End Function
	Private Function MyTotalStudent()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select count(*) 
from StudentTable
Inner join StudentCourseAssociativeTable On StudentCourseAssociativeTable.StudentId = StudentTable.Studentid
INNER JOIN CourseTable ON CourseTable.courseId=StudentCourseAssociativeTable.CourseId
where  CourseTable.TutorId=@TutorId;"
		cmd.Parameters.AddWithValue("@TutorId", TutorId)
		con.Open()
		Return cmd.ExecuteScalar()
		con.Close()
	End Function
	Private Function MyTotalCourse()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT count(*) FROM courseTable where TutorId=@TutorId;"
		cmd.Parameters.AddWithValue("@TutorId", TutorId)
		con.Open()
		Return cmd.ExecuteScalar()
		con.Close()
	End Function
	Private Function MyEvents()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT count(*) FROM EventTable where TutorId=@TutorId;"
		cmd.Parameters.AddWithValue("@TutorId", TutorId)
		con.Open()
		Return cmd.ExecuteScalar()
		con.Close()
	End Function
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		TutorId = 28 '''''''''''''''''''''''''''''
		LabelWelcome.Text = "Welcome " & Session("TutorUsername") & " you are logged in as Tutor"
		LabelTotalCourse.Text = TotalCourse()
		LabelMyTotalCourses.Text = MyTotalCourse()
		LabelMyTotalStudent.Text = MyTotalStudent()
		LabelMyEvents.Text = MyEvents()
	End Sub

End Class