Public Class UpdateCourse
	Inherits System.Web.UI.Page

	Private ReadOnly _conString As String

	Private courseId As Integer
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Private Sub populateCategory()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT CategoryId,CategoryName FROM CategoryTable;"
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		While reader.Read
			Dim newlist As ListItem = New ListItem(reader(1).ToString, reader(0))
			CheckBoxListCourseCategory.Items.Add(newlist)
		End While
		reader.Close()
		con.Close()
	End Sub
	Private Sub CheckCheckbox()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT CategoryId FROM CategoryAssociativeTable where CourseId=@CourseId;"
		cmd.Parameters.AddWithValue("@CourseId", courseId)
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		While reader.Read
			Dim checkboxlistValue As String = reader(0).ToString
			For i As Integer = 0 To CheckBoxListCourseCategory.Items.Count - 1
				If checkboxlistValue = CheckBoxListCourseCategory.Items(i).Value Then
					CheckBoxListCourseCategory.Items(i).Selected = True
				End If
			Next
		End While
		reader.Close()
		con.Close()
	End Sub
	Private Sub PopulateTexboxes()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT CourseName,DateSchedule,DateCreated,CourseDescription,AimsAndObjectives FROM CourseTable where CourseId=@CourseId;"
		cmd.Parameters.AddWithValue("@CourseId", courseId)
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		While reader.Read
			TextBoxCourseName.Text = reader(0)
			TextBoxScheduleDate.Text = Convert.ToDateTime(reader(1)).ToString("yyyy-MM-ddThh:mm")
			TextBoxCreatedDate.Text = reader(2)
			TextBoxCourseDescription.Text = reader(3)
			TextBoxAimsAndObjectives.Text = reader(4)
		End While
		reader.Close()
		con.Close()
	End Sub
	Private Sub GetMaterialList()
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
		cmd.Parameters.AddWithValue("@courseid", courseId)
		Dim sqlda As New SqlClient.SqlDataAdapter(cmd)
		Dim dt As New DataTable()
		sqlda.Fill(dt)
		con.Close()
		gvs.DataSource = dt
		gvs.DataBind()
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

		Dim MaterialAssociativeTable As New DataTable
		Dim noUploaded As Integer = 0
		Dim noAlreadyExist As Integer = 0
		MaterialAssociativeTable.Columns.Add("CourseId")
		MaterialAssociativeTable.Columns.Add("MaterialTypeId")
		MaterialAssociativeTable.Columns.Add("MaterialPathUrl")
		MaterialAssociativeTable.Columns.Add("DatePosted")
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
				Dim DatePosted As DateTime = DateTime.Now

				If DoesExist(MaterialPathUrl) Then
					noAlreadyExist += 1
				Else
					MaterialAssociativeTable.Rows.Add(courseId, MaterialTypeId, MaterialPathUrl, DatePosted, MaterialName)
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
		param1.ParameterName = "@TypeMaterialAssociativeTable"
		param1.Value = MaterialAssociativeTable
		cmd.Parameters.Add(param1)
		con.Open()
		cmd.ExecuteNonQuery()
		con.Close()
		Response.Write("<script>var x=confirm('" & noUploaded & " files uploaded & " & noAlreadyExist & " already exist'); </script")
		Response.Redirect(Request.RawUrl)

	End Sub
	Private Function GetCourseCategoryDataTable() As DataTable
		Dim CategoryAssociativeTable As New DataTable
		CategoryAssociativeTable.Columns.Add("CourseId")
		CategoryAssociativeTable.Columns.Add("CategoryId")
		For Each listItem As ListItem In CheckBoxListCourseCategory.Items
			If (listItem.Selected = True) Then
				Dim CategoryId As Integer = listItem.Value
				CategoryAssociativeTable.Rows.Add(courseId, CategoryId)
			End If
		Next
		Return CategoryAssociativeTable
	End Function
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
	Private Sub LoginRequired(mySession)
		If Not IsNothing(mySession) Then 'there is something
		Else : Response.Redirect("~/LoginRequired")
		End If
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
	Private Sub updateCourse()
		Dim CategoryAssociativeTable As DataTable = GetCourseCategoryDataTable()
		Dim CourseName As String = TextBoxCourseName.Text.Trim
		Dim DateSchedule As DateTime = Convert.ToDateTime(TextBoxScheduleDate.Text)
		Dim CourseDescription As String = TextBoxCourseDescription.Text
		Dim AimsAndObjectives As String = TextBoxAimsAndObjectives.Text


		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.StoredProcedure
		cmd.CommandText = "ProcedureUpdateCourseAndCategoryAssociative"
		Dim param1 As SqlClient.SqlParameter = New SqlClient.SqlParameter
		param1.ParameterName = "@TypeCategoryAssociativeTable"
		param1.Value = CategoryAssociativeTable
		cmd.Parameters.Add(param1)
		cmd.Parameters.AddWithValue("@CourseId", courseId)
		cmd.Parameters.AddWithValue("@CourseName", CourseName)
		cmd.Parameters.AddWithValue("@DateSchedule", DateSchedule)
		cmd.Parameters.AddWithValue("@CourseDescription", CourseDescription)
		cmd.Parameters.AddWithValue("@AimsAndObjectives", AimsAndObjectives)


		con.Open()
		cmd.ExecuteNonQuery()
		con.Close()
	End Sub
	Private Function CheckboxhasChecked() As Boolean
		Dim CategoryAssociativeTable As Integer = 0
		For Each listItem As ListItem In CheckBoxListCourseCategory.Items
			If (listItem.Selected = True) Then
				CategoryAssociativeTable += 1
			End If
		Next
		If CategoryAssociativeTable > 0 Then : Return True
		Else : Return False
		End If
	End Function
	Protected Sub btnParam_Click(sender As Object, e As EventArgs)
		Response.Redirect("~/Tutor/EditMaterials.aspx?id=" & Convert.ToInt32(CType(sender, LinkButton).CommandArgument))
	End Sub

	Protected Sub btnUpload_Click(sender As Object, e As EventArgs)
		uploadMaterial("tom") 'will be taken from session
	End Sub

	Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
		If CheckboxhasChecked() = False Then
			Label1.Text = "Please select at least one"
		Else
			Label1.Text = ""
			updateCourse()
			Response.Redirect("~/Tutor/ViewCourse.aspx?id=" & courseId)
		End If



	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'LoginRequired(mySession)
		Dim mydate As DateTime = DateTime.Now.ToString("yyyy-MM-ddThh:mm")
		mydate = mydate.AddDays(1)
		TextBoxScheduleDate.Attributes("min") = mydate.ToString("yyyy-MM-ddThh:mm")
		courseId = Convert.ToInt32(Request.QueryString("id"))
		If Not Page.IsPostBack Then
			populateCategory()
			populateMaterialName()
			CheckCheckbox()
			PopulateTexboxes()
			GetMaterialList()
		End If

	End Sub

	Protected Sub btview_Click(sender As Object, e As EventArgs)
		Response.Redirect("~/Tutor/TutorCRUDCourse")
	End Sub
End Class