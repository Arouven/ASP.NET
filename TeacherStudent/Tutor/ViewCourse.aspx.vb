Public Class ViewCourse
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub


	Private Sub showCourseDetails()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim courseid As Integer = 15 'Request.QueryString("id")
		cmd.CommandText = "select 
coursetable.courseId,coursetable.TutorId,coursetable.CourseName,coursetable.DateCreated,coursetable.DateSchedule,coursetable.CourseDescription,coursetable.AimsAndObjectives,
CategoryTable.CategoryName,
MaterialAssociativeTable.MaterialPathUrl,MaterialAssociativeTable.DatePosted,
MaterialTypeTable.MaterialTypeName
from coursetable
inner join  categoryassociativetable on CategoryAssociativeTable.CourseId=coursetable.CourseId 
inner join CategoryTable on CategoryTable.CategoryId=categoryassociativetable.CategoryId
inner join  MaterialAssociativeTable on MaterialAssociativeTable.CourseId=coursetable.CourseId 
inner join MaterialTypeTable on MaterialTypeTable.MaterialTypeId=MaterialAssociativeTable.MaterialTypeId
where coursetable.CourseId=@courseid;"
		cmd.Parameters.AddWithValue("@courseid", courseid)
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		If reader.HasRows Then
			While reader.Read
				HiddenFieldCourseId.Value = reader(0)
				HiddenFieldTutorId.Value = reader(1)
				LabelTitle.Text = reader(2)
				LabelCourseName.Text = reader(2)
				LabelDateCreated.Text = reader(3)
				LabelDateSchedule.Text = reader(4)
				LabelCourseDescription.Text = reader(5)
				LabelAimsAndObjectives.Text = reader(6)
				LabelCategoryName.Text = reader(7)
			End While
		End If
		reader.Close()
		con.Close()
	End Sub
	Private Sub GetMaterialList()
		Dim courseid As Integer = 15 'Request.QueryString("id")
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select 
MaterialAssociativeTable.MaterialId,
MaterialAssociativeTable.CourseId,
MaterialAssociativeTable.MaterialTypeId,
MaterialAssociativeTable.MaterialPathUrl,
MaterialAssociativeTable.DatePosted,
MaterialAssociativeTable.MaterialName,
MaterialTypeTable.MaterialTypeName
from MaterialAssociativeTable
inner join MaterialTypeTable on MaterialTypeTable.MaterialTypeId=MaterialAssociativeTable.MaterialTypeId
where MaterialAssociativeTable.courseid=@courseid;"
		cmd.Parameters.AddWithValue("@courseid", courseid)
		Dim sqlda As New SqlClient.SqlDataAdapter(cmd)
		Dim dt As New DataTable()
		sqlda.Fill(dt)
		con.Close()
		gvs.DataSource = dt
		gvs.DataBind()
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		showCourseDetails()
		GetMaterialList()
	End Sub
	Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
		If (gvs.Rows.Count > 0) Then
			gvs.UseAccessibleHeader = True
			gvs.HeaderRow.TableSection = TableRowSection.TableHeader
		End If
	End Sub
	Protected Sub btnMatList_Click(sender As Object, e As EventArgs)

	End Sub



	Protected Sub btnDownload_Click(sender As Object, e As EventArgs)
		Dim filePath As String = (Server.MapPath(CType(sender, LinkButton).CommandArgument))
		HttpContext.Current.Response.Redirect("~/DownloadFiles.ashx?file=" + filePath)
	End Sub

	Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
		Response.Redirect("~/Tutor/AddMaterials.aspx?id=" & HiddenFieldTutorId.Value)
	End Sub
End Class