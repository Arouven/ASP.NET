Public Class ViewJobDetails
  Inherits System.Web.UI.Page

	Private JobId As Integer
	Private HKId As Integer
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub


	Private Sub showCourseDetails()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		'Dim courseid As Integer = Request.QueryString("id")
		cmd.CommandText = "select 
Jobtable.Jobid as JobId,
Jobtable.Title as Title,
Jobtable.DeadlineDate as DeadlineDate,
Jobtable.DatePosted as DatePosted,
Jobtable.Description as Description,
Jobtable.Salary as Salary,
categorytable.CategoryName as CategoryName
from Jobtable
inner join  jobcategoryassociativetable on jobCategoryAssociativeTable.JobId=Jobtable.JobId 
inner join CategoryTable on CategoryTable.CategoryId=jobcategoryassociativetable.CategoryId
where jobtable.JobId=@jobid;"
		cmd.Parameters.AddWithValue("@jobid", JobId)
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		Dim str As String = ""
		If reader.HasRows Then
			While reader.Read
				HiddenFieldCourseId.Value = reader(0)
				LabelTitle.Text = reader(1)
				LabelCourseName.Text = LabelTitle.Text
				LabelDateCreated.Text = reader(3)
				LabelDateSchedule.Text = reader(2)
				LabelCourseDescription.Text = reader(4)
				LabelAimsAndObjectives.Text = reader(5)
				str += ", " & reader(6).ToString
			End While
		End If
		str = str.Remove(0, 2)
		LabelCategoryName.Text = str
		reader.Close()
		con.Close()
	End Sub
	'	Private Sub GetMaterialList()
	'		'Dim courseid As Integer = Request.QueryString("id")
	'		Dim con As New SqlClient.SqlConnection(_conString)
	'		Dim cmd As New SqlClient.SqlCommand()
	'		cmd.Connection = con
	'		con.Open()
	'		cmd.CommandType = CommandType.Text
	'		cmd.CommandText = "select 
	'MaterialAssociativeTable.MaterialId,
	'MaterialAssociativeTable.CourseId,
	'MaterialAssociativeTable.MaterialTypeId,
	'MaterialAssociativeTable.MaterialPathUrl,
	'MaterialAssociativeTable.MaterialName,
	'MaterialTypeTable.MaterialTypeName
	'from MaterialAssociativeTable
	'inner join MaterialTypeTable on MaterialTypeTable.MaterialTypeId=MaterialAssociativeTable.MaterialTypeId
	'where MaterialAssociativeTable.courseid=@courseid;"
	'		cmd.Parameters.AddWithValue("@courseid", courseId)
	'		Dim sqlda As New SqlClient.SqlDataAdapter(cmd)
	'		Dim dt As New DataTable()
	'		sqlda.Fill(dt)
	'		con.Close()
	'		gvs.DataSource = dt
	'		gvs.DataBind()
	'	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsNothing(Session("HKId")) Then
			HKId = Session("HKId")
			JobId = Convert.ToInt32(Request.QueryString("id"))
			showCourseDetails()
		Else Response.Redirect("~/HouseKeeper/HKLogin.aspx")
		End If

	End Sub


	'Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
	'	If (gvs.Rows.Count > 0) Then
	'		gvs.UseAccessibleHeader = True
	'		gvs.HeaderRow.TableSection = TableRowSection.TableHeader
	'	End If
	'End Sub



	'Protected Sub btnDownload_Click(sender As Object, e As EventArgs)
	'	Dim filePath As String = (Server.MapPath(CType(sender, LinkButton).CommandArgument))
	'	HttpContext.Current.Response.Redirect("~/DownloadFiles.ashx?file=" + filePath)
	'End Sub










	Private Function IsAccepted()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT * FROM HKJobAssociativeTable WHERE  Accepted=1 and Pending=0 and Applied=1 and HKId=@HKId and JobId=@JobId "
		cmd.Parameters.AddWithValue("@HKId", HKId)
		cmd.Parameters.AddWithValue("@JobId", JobId)
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		If (reader.HasRows) Then : Return True
		Else : Return False
		End If
		reader.Close()
		con.Close()
	End Function
	'Protected Sub ButtonShowMaterials_Click(sender As Object, e As EventArgs)
	'	If IsAccepted() Then
	'		GetMaterialList()
	'		LabelMaterialMessage.Text = ""
	'	Else
	'		LabelMaterialMessage.Text = "You are not accepted by the tutor, you can't see these materials"
	'	End If
	'End Sub
End Class