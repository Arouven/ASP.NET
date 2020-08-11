Public Class ViewEvents
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Dim TutorId As Integer
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub

	Private Sub LoginRequired(mySession)
		If Not IsNothing(mySession) Then 'there is something
		Else : Response.Redirect("~/LoginRequired")
		End If
	End Sub

	Private Sub GetEventList()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select EventId,EventName,EventDetail,Location,DateSchedule,DateCreated from EventTable where TutorId=@TutorId;"
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
		' LoginRequired(mySession)
		TutorId = 3 'Request.QueryString("id")
		GetEventList()
	End Sub

	Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
		Dim eventId As Integer = Convert.ToInt32(CType(sender, LinkButton).CommandArgument)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "delete from EventTable where eventId=@eventId;"
		cmd.Parameters.AddWithValue("@eventId", eventId)
		cmd.ExecuteNonQuery()
		con.Close()
		GetEventList()
	End Sub

	Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
		Response.Redirect("~/Tutor/TutorPostsEvent.aspx")
	End Sub

	Protected Sub UpdateButton_Click(sender As Object, e As EventArgs)
		Dim idToUpdate As Integer = Convert.ToInt32(myHiddenId.Value)
		Dim EventName As String = TextBoxEventName.Text.Trim
		Dim EventDetail As String = TextBoxEventDetail.Text.Trim
		Dim location As String = TextBoxLocation.Text.Trim
		Dim dateSchedule As String = TextBoxDateSchedule.Text.Trim
		Dim dateCreated As String = TextBoxDateCreated.Text.Trim

		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "update EventTable set EventName=@EventName, EventDetail=@EventDetail, location=@location, dateSchedule=@dateSchedule where EventId=@EventId;"
		cmd.Parameters.AddWithValue("@EventId", idToUpdate)
		cmd.Parameters.AddWithValue("@EventName", EventName)
		cmd.Parameters.AddWithValue("@EventDetail", EventDetail)
		cmd.Parameters.AddWithValue("@location", location)
		cmd.Parameters.AddWithValue("@dateSchedule", Convert.ToDateTime(dateSchedule))
		cmd.ExecuteNonQuery()
		con.Close()
		Response.Redirect(Request.RawUrl)
	End Sub
End Class