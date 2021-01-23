Public Class HOViewsListOfHK
  Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Private HOId As Integer
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub
	Private Function TotalStudentInCourses(Pending As Boolean, Rejected As Boolean)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim paraPending As String = ""
		Dim paraRejected As String = ""
		If Pending Then
			paraPending = " and pending=1 and HKJobAssociativeTable.Applied=1"
		End If
		If Rejected Then
			paraRejected = " and HKJobAssociativeTable.Applied=1 and HKJobAssociativeTable.pending=0 and HKJobAssociativeTable.accepted=0"
		End If
		Dim sqlcom As String = "select count(*) 
from HouseKeeperTable
Inner join HKJobAssociativeTable On HKJobAssociativeTable.HKId = HouseKeeperTable.HKid
INNER JOIN JobTable ON JobTable.JobId=HKJobAssociativeTable.JobId
where  JobTable.HOId=@HOId" & paraPending & paraRejected
		cmd.CommandText = sqlcom
		cmd.Parameters.AddWithValue("@HOId", HOId)
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
		cmd.CommandText = "select JobTable.Title, JobTable.Jobid, JobTable.DeadlineDate 
from JobTable
where  JobTable.HOId=@HOId"
		cmd.Parameters.AddWithValue("@HOId", HOId)
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
		If Not IsNothing(Session("HOId")) Then
			HOId = Session("HOId")
			LabelTotalStudent.Text = TotalStudentInCourses(False, False).ToString
			LabelTotalStudentPending.Text = TotalStudentInCourses(True, False).ToString
			LabelTotalStudentRejected.Text = TotalStudentInCourses(False, True).ToString
			If Not IsPostBack Then : GetEventList()
			End If
		Else Response.Redirect("~/HouseOwner/HOLogin.aspx")
		End If

	End Sub

	Protected Sub btnStud_Click(sender As Object, e As EventArgs)
		Response.Redirect("~/HouseOwner/HOViewHKInJob.aspx?id=" & CType(sender, LinkButton).CommandArgument)

	End Sub
End Class