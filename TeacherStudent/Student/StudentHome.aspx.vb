Public Class StudentHome
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Private StudentId As Integer
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
	Private Function MyTotalCourses()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select count(*) 
from StudentCourseAssociativeTable 
where  StudentId=@StudentId;"
		cmd.Parameters.AddWithValue("@StudentId", StudentId)
		con.Open()
		Return cmd.ExecuteScalar()
		con.Close()
	End Function
	Private Function MyEvents()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT count(*) FROM EventTable;"
		con.Open()
		Return cmd.ExecuteScalar()
		con.Close()
	End Function
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsNothing(Session("StudentId")) Then
			StudentId = Session("StudentId")
			LabelWelcome.Text = "Welcome " & Session("StudentUsername") & " you are logged in as Student"
			LabelTotalCourse.Text = TotalCourse()
			LabelMyTotalCourses.Text = MyTotalCourses()
			LabelEvents.Text = MyEvents()
		Else Response.Redirect("~/Student/StudentLogin.aspx")
		End If

	End Sub

End Class