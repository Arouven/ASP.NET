Public Class TutorPostsEvent
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String

	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Private Sub insertEvent(tutorid)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim sqlStatement As String = "insert into EventTable( TutorId,EventName,EventDetail,Location, DateSchedule, DateCreated) values (@TutorId, @EventName, @EventDetail, @Location, @DateSchedule, @DateCreated);"
		cmd.CommandText = sqlStatement
		cmd.Parameters.AddWithValue("@TutorId", tutorid)
		cmd.Parameters.AddWithValue("@EventName", TextBoxEventName.Text.Trim)
		cmd.Parameters.AddWithValue("@EventDetail", TextBoxEventDetails.Text.Trim)
		cmd.Parameters.AddWithValue("@Location", TextBoxLocation.Text.Trim)
		cmd.Parameters.AddWithValue("@DateSchedule", Convert.ToDateTime(TextBoxDateSchedule.Text))
		cmd.Parameters.AddWithValue("@DateCreated", DateTime.Now)
		con.Open()
		cmd.ExecuteNonQuery()
		con.Close()
		Response.Redirect("~/Tutor/ViewEvents")
	End Sub






	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'LoginRequired(mySession)
		Dim mydate As DateTime = DateTime.Now.ToString("yyyy-MM-ddThh:mm")
		mydate = mydate.AddDays(1)
		TextBoxDateSchedule.Attributes("min") = mydate.ToString("yyyy-MM-ddThh:mm")
	End Sub

	Protected Sub LinkButtonAdd_Click(sender As Object, e As EventArgs)
		If Not IsNothing(Session("TutorId")) Then
			Dim tutorid As Integer = Session("TutorId")
			insertEvent(tutorid) 'will be taken from session
		Else Response.Redirect("~/Tutor/TutorLogin.aspx")
		End If

	End Sub


End Class