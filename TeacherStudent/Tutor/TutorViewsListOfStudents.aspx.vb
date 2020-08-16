Public Class TutorViewsListOfStudents
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Private TutorId As Integer
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Private Function TotalStudentInCourses(Pending As Boolean, Rejected As Boolean)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim paraPending As String = ""
		Dim paraRejected As String = ""
		If Pending Then
			paraPending = " and pending=1 and StudentCourseAssociativeTable.subscribe=1"
		End If
		If Rejected Then
			paraRejected = " and StudentCourseAssociativeTable.subscribe=1 and StudentCourseAssociativeTable.pending=0 and StudentCourseAssociativeTable.accepted=0"
		End If
		Dim sqlcom As String = "select count(*) 
from StudentTable
Inner join StudentCourseAssociativeTable On StudentCourseAssociativeTable.StudentId = StudentTable.Studentid
INNER JOIN CourseTable ON CourseTable.courseId=StudentCourseAssociativeTable.CourseId
where  CourseTable.TutorId=@TutorId" & paraPending & paraRejected
		cmd.CommandText = sqlcom
		cmd.Parameters.AddWithValue("@TutorId", TutorId)
		con.Open()
		Return cmd.ExecuteScalar()
		con.Close()
	End Function
	Private Sub GetEventList()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select courseTable.courseName, courseTable.courseid, courseTable.DateSchedule 
from courseTable
where  CourseTable.TutorId=@TutorId"
		cmd.Parameters.AddWithValue("@TutorId", TutorId)
		Dim sqlda As New SqlClient.SqlDataAdapter(cmd)
		Dim dt As New DataTable()
		sqlda.Fill(dt)
		con.Close()
		gvs.DataSource = dt
		gvs.DataBind()
	End Sub
	Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
		If (gvs.Rows.Count > 0) Then
			gvs.UseAccessibleHeader = True
			gvs.HeaderRow.TableSection = TableRowSection.TableHeader
		End If
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsNothing(Session("TutorId")) Then
			TutorId = Session("TutorId")
			LabelTotalStudent.Text = TotalStudentInCourses(False, False).ToString
			LabelTotalStudentPending.Text = TotalStudentInCourses(True, False).ToString
			LabelTotalStudentRejected.Text = TotalStudentInCourses(False, True).ToString
			If Not IsPostBack Then : GetEventList()
			End If
		Else Response.Redirect("~/Tutor/TutorLogin.aspx")
		End If

	End Sub

	Protected Sub btnStud_Click(sender As Object, e As EventArgs)
		Response.Redirect("~/Tutor/TutorViewStudentInCourse.aspx?id=" & CType(sender, LinkButton).CommandArgument)

	End Sub
End Class