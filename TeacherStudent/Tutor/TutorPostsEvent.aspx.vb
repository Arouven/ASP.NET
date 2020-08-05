Public Class TutorPostsEvent
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String

	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Private Sub insertGetCourseId()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim tutorid As Integer = Convert.ToInt32(Request.QueryString("id")) 'tutorid
		Dim sqlStatement As String = "insert into EventTable( TutorId,EventName,EventDetail,Location, DateSchedule, DateCreated) values (@TutorId, @EventName, @EventDetail, @Location, @DateSchedule, @DateCreated);"
		cmd.CommandText = sqlStatement
		cmd.Parameters.AddWithValue("@TutorId", tutorid)
		cmd.Parameters.AddWithValue("@EventName", TextBoxEventName.Text.Trim)
		cmd.Parameters.AddWithValue("@EventDetail", TextBoxEventDetails.Text.Trim)
		cmd.Parameters.AddWithValue("@Location", TextBoxLocation.Text.Trim)
		cmd.Parameters.AddWithValue("@DateSchedule", TextBoxDateSchedule.Text.Trim)
		cmd.Parameters.AddWithValue("@DateCreated", HiddenFieldDate.Value)
		con.Open()
		cmd.ExecuteNonQuery()
		con.Close()
		Response.Redirect("~/Tutor/ViewEvents")
	End Sub

	Private Sub LoginRequired(mySession)
		If Not IsNothing(mySession) Then 'there is something
		Else : Response.Redirect("~/LoginRequired")
		End If
	End Sub





	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'LoginRequired(mySession)

	End Sub

	Protected Sub LinkButtonAdd_Click(sender As Object, e As EventArgs)
		insertGetCourseId() 'will be taken from session
	End Sub


End Class