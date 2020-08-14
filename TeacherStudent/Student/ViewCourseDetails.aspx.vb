Public Class ViewCourseDetails
	Inherits System.Web.UI.Page

	Private courseId As Integer
	Private studentId As Integer
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub


	Private Sub showCourseDetails()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		'Dim courseid As Integer = Request.QueryString("id")
		cmd.CommandText = "select 
coursetable.courseid as courseId,
coursetable.CourseName as CourseName,
coursetable.DateSchedule as DateSchedule,
coursetable.DateCreated as DateCreated,
coursetable.CourseDescription as CourseDescription,
coursetable.AimsAndObjectives as AimsAndObjectives,
categorytable.CategoryName as CategoryName
from coursetable
inner join  categoryassociativetable on CategoryAssociativeTable.CourseId=coursetable.CourseId 
inner join CategoryTable on CategoryTable.CategoryId=categoryassociativetable.CategoryId
where coursetable.CourseId=@courseid;"
		cmd.Parameters.AddWithValue("@courseid", courseid)
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
	Private Sub GetMaterialList()
		'Dim courseid As Integer = Request.QueryString("id")
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
		studentId = 1 'session
		courseId = Convert.ToInt32(Request.QueryString("id"))
		showCourseDetails()
		'GetMaterialList()
		If Not IsPostBack Then
			'populateMaterialName()
		End If
	End Sub


	Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
		If (gvs.Rows.Count > 0) Then
			gvs.UseAccessibleHeader = True
			gvs.HeaderRow.TableSection = TableRowSection.TableHeader
		End If
	End Sub



	Protected Sub btnDownload_Click(sender As Object, e As EventArgs)
		Dim filePath As String = (Server.MapPath(CType(sender, LinkButton).CommandArgument))
		HttpContext.Current.Response.Redirect("~/DownloadFiles.ashx?file=" + filePath)
	End Sub










	Private Function IsAccepted()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT * FROM StudentCourseAssociativeTable WHERE  Accepted=1 and Pending=0 and Subscribe=1 and StudentId=@StudentId and CourseId=@CourseId "
		cmd.Parameters.AddWithValue("@StudentId", StudentId)
		cmd.Parameters.AddWithValue("@CourseId", courseId)
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		If (reader.HasRows) Then : Return True
		Else : Return False
		End If
		reader.Close()
		con.Close()
	End Function
	Protected Sub ButtonShowMaterials_Click(sender As Object, e As EventArgs)
		If IsAccepted() Then
			GetMaterialList()
			LabelMaterialMessage.Text = ""

		Else
			LabelMaterialMessage.Text = "You are not accepted by the tutor, you can't see these materials"
		End If
	End Sub
End Class