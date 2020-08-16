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
		Dim courseid As Integer = Request.QueryString("id")
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
		Dim courseid As Integer = Request.QueryString("id")
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
		If Not IsNothing(Session("TutorId")) Then
			showCourseDetails()
			GetMaterialList()
			gvs_PreRender(gvs, Nothing)
			If Not IsPostBack Then
				populateMaterialName()
			End If
		Else Response.Redirect("~/Tutor/TutorLogin.aspx")
		End If




	End Sub
	Private Function DoesExist(MaterialPathUrl)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT MaterialPathUrl FROM MaterialAssociativeTable WHERE MaterialPathUrl=@MaterialPathUrl;"
		cmd.Parameters.AddWithValue("@MaterialPathUrl", MaterialPathUrl)
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		If (reader.HasRows) Then : Return True
		Else : Return False
		End If
		reader.Close()
		con.Close()
	End Function
	Private Sub uploadMaterial(UserName As String)

		Dim courseid As Integer = Convert.ToInt64(Request.QueryString("id"))
		Dim MaterialAssociativeTable As New DataTable
		Dim noUploaded As Integer = 0
		Dim noAlreadyExist As Integer = 0
		MaterialAssociativeTable.Columns.Add("CourseId")
		MaterialAssociativeTable.Columns.Add("MaterialTypeId")
		MaterialAssociativeTable.Columns.Add("MaterialPathUrl")
		MaterialAssociativeTable.Columns.Add("MaterialName")

		Dim counter As Integer = Convert.ToInt32(SendA.Value)
		Dim myVal As New List(Of String)
		myVal.Add("0")
		For i As Integer = 1 To counter
			Dim toSearch As String = "ddl" & i
			Dim val As Integer = Convert.ToInt32(Request.Form(toSearch))
			If val > 0 Then
				myVal.Add(i.ToString)
			End If
		Next

		Dim customfolder As String = "~/Tutor/files/" & UserName & "/docs/"
		IO.Directory.CreateDirectory(Server.MapPath(customfolder))
		For i As Integer = 0 To Request.Files.Count - 1
			Dim PostedFile As HttpPostedFile = Request.Files(i)
			If PostedFile.ContentLength > 0 Then
				Dim toSearch As String = "ddl" & myVal(i)
				Dim MaterialTypeId As Integer = Convert.ToInt32(Request.Form(toSearch))
				If i = 0 Then
					MaterialTypeId = ddl0.Value
				End If
				Dim MaterialName As String = IO.Path.GetFileName(PostedFile.FileName)
				Dim MaterialPathUrl As String = customfolder & MaterialName

				If DoesExist(MaterialPathUrl) Then
					noAlreadyExist += 1
				Else
					MaterialAssociativeTable.Rows.Add(courseid, MaterialTypeId, MaterialPathUrl, MaterialName)
					PostedFile.SaveAs(Server.MapPath(customfolder) + MaterialName)
					noUploaded += 1
				End If
			End If
		Next


		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.StoredProcedure
		cmd.CommandText = "ProcedureInsertMaterialAssociative"
		Dim param1 As SqlClient.SqlParameter = New SqlClient.SqlParameter
		param1.ParameterName = "@TypeMaterialAssociativeeTable"
		param1.Value = MaterialAssociativeTable
		cmd.Parameters.Add(param1)
		con.Open()
		cmd.ExecuteNonQuery()
		con.Close()
		Response.Write("<script>var x=confirm('" & noUploaded & " files uploaded & " & noAlreadyExist & " already exist'); </script")
		Response.Redirect(Request.RawUrl)

	End Sub
	Private Sub populateMaterialName()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT MaterialTypeId,MaterialTypeName FROM MaterialTypeTable;"
		con.Open()
		ddl0.DataSource = cmd.ExecuteReader()
		ddl0.DataTextField = "MaterialTypeName"
		ddl0.DataValueField = "MaterialTypeId"
		ddl0.DataBind()
		ddl0.Items.Insert(0, New ListItem("Select a material type", ""))
		ddl0.SelectedIndex = 0
		con.Close()
	End Sub
	Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
		If (gvs.Rows.Count > 0) Then
			gvs.UseAccessibleHeader = True
			gvs.HeaderRow.TableSection = TableRowSection.TableHeader
		End If
	End Sub
	Protected Sub btnMatList_Click(sender As Object, e As EventArgs)

	End Sub
	Private Sub delServerFiles(MaterialId As Integer)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select MaterialPathUrl from MaterialAssociativeTable where MaterialId=@MaterialId;"
		cmd.Parameters.AddWithValue("@MaterialId", MaterialId)
		Dim MaterialPathUrl As String = ""
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		If reader.HasRows Then
			While reader.Read
				MaterialPathUrl = reader(0)
			End While
		End If
		MaterialPathUrl = Server.MapPath(MaterialPathUrl)
		Dim file As IO.FileInfo = New IO.FileInfo(MaterialPathUrl)
		file.Delete()
		con.Close()

	End Sub


	Protected Sub btnDownload_Click(sender As Object, e As EventArgs)
		Dim filePath As String = (Server.MapPath(CType(sender, LinkButton).CommandArgument))
		HttpContext.Current.Response.Redirect("~/DownloadFiles.ashx?file=" + filePath)
	End Sub

	Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
		Response.Redirect("~/Tutor/AddMaterials.aspx?id=" & HiddenFieldTutorId.Value)
	End Sub



	Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
		Dim MaterialId As Integer = Convert.ToInt32(CType(sender, LinkButton).CommandArgument)
		delServerFiles(MaterialId)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandText = "delete from MaterialAssociativeTable where MaterialId=@MaterialId;"
		cmd.Parameters.AddWithValue("@MaterialId", MaterialId)
		con.Open()

		cmd.ExecuteNonQuery()

		GetMaterialList()
		con.Close()
	End Sub

	Protected Sub btnParam_Click(sender As Object, e As EventArgs)
		Response.Redirect("~/Tutor/EditMaterials.aspx?id=" & Convert.ToInt32(CType(sender, LinkButton).CommandArgument))
	End Sub

	Protected Sub btnUpload_Click(sender As Object, e As EventArgs)
		uploadMaterial(Session("TutorUsername")) 'will be taken from session
	End Sub

	Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
		Dim courseid As Integer = Request.QueryString("id")
		Response.Redirect("~/Tutor/UpdateCourse.aspx?id=" & courseid)
	End Sub
End Class