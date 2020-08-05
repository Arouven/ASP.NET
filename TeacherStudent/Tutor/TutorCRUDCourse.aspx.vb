Public Class TutorCRUDCourse
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub

	Private Sub GetCourses()
		Dim tutorid As Integer = Convert.ToInt32(Request.QueryString("id")) 'tutorid
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.Text
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
where coursetable.TutorId=@tutorid;"
		cmd.Parameters.AddWithValue("@tutorid", tutorid)
		Dim sqlda As New SqlClient.SqlDataAdapter(cmd)
		Dim dt As New DataTable()
		sqlda.Fill(dt)
		con.Close()
		gvs.DataSource = dt
		gvs.DataBind()
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		GetCourses()
	End Sub
	Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "delete from CourseTable where CourseId=@CourseId;"
		cmd.Parameters.AddWithValue("@CourseId", Convert.ToInt32(CType(sender, LinkButton).CommandArgument))
		cmd.ExecuteNonQuery()
		con.Close()
		GetCourses()
	End Sub

	Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
		If (gvs.Rows.Count > 0) Then
			gvs.UseAccessibleHeader = True
			gvs.HeaderRow.TableSection = TableRowSection.TableHeader
		End If
	End Sub

	Protected Sub UpdateButton_Click(sender As Object, e As EventArgs)

	End Sub

	Protected Sub AddButton_Click(sender As Object, e As EventArgs)
		Dim tutorid As Integer = Convert.ToInt32(Request.QueryString("id")) 'tutorid
		Response.Redirect("~/Tutor/AddCourse.aspx?id=" & TutorId)
	End Sub
End Class