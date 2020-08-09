Public Class AddCourse
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String

	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Private Function insertGetCourseId() As Integer
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.StoredProcedure
		cmd.CommandText = "ProcedureInsertCourse"
		Dim tutorid As Integer = 3 ''''''''''''''''''''''''''''''''''Convert.ToInt32(Request.QueryString("id")) 'tutorid
		cmd.Parameters.AddWithValue("@TutorId", tutorid)
		cmd.Parameters.AddWithValue("@CourseName", TextBoxCourseName.Text.Trim)
		cmd.Parameters.AddWithValue("@DateSchedule", Convert.ToDateTime(TextBoxScheduleDate.Text))
		cmd.Parameters.AddWithValue("@DateCreated", DateTime.Now)
		cmd.Parameters.AddWithValue("@CourseDescription", TextBoxCourseDescription.Text.Trim)
		cmd.Parameters.AddWithValue("@AimsAndObjectives", TextBoxAimsAndObjectives.Text.Trim)
		Dim retId = cmd.Parameters.Add("@lastCourseIdInserted", SqlDbType.Int)
		retId.Direction = ParameterDirection.ReturnValue
		con.Open()
		cmd.ExecuteNonQuery()
		Dim courseId As Integer = retId.Value
		con.Close()
		Return courseId
	End Function
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
	Private Sub LoginRequired(mySession)
		If Not IsNothing(mySession) Then 'there is something
		Else : Response.Redirect("~/LoginRequired")
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
	End Function
	Private Sub uploadCourse(UserName As String)
		Dim MaterialAssociativeTable As New DataTable
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

		Dim courseid As Integer = insertGetCourseId()
		Dim customfolder As String = "~/Tutor/files/" & UserName & "/docs/"
		IO.Directory.CreateDirectory(Server.MapPath(customfolder))
		Dim noUploaded As Integer = 0
		Dim noAlreadyExist As Integer = 0
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
					MaterialAssociativeTable.Rows.Add(courseid, MaterialTypeId, MaterialPathUrl, DatePosted, MaterialName)
					PostedFile.SaveAs(Server.MapPath(customfolder) + MaterialName)
					noUploaded += 1
				End If
			End If
		Next
		If noUploaded + noAlreadyExist = 0 Then : Label1.Text = "select files and material type"
		End If

		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.StoredProcedure
		cmd.CommandText = "ProcedureInsertMaterialAssociative"
		Dim param As SqlClient.SqlParameter = New SqlClient.SqlParameter
		param.ParameterName = "@TypeMaterialAssociativeTable"
		param.Value = MaterialAssociativeTable
		cmd.Parameters.Add(param)
		con.Open()
		cmd.ExecuteNonQuery()
		con.Close()

		Dim con2 As New SqlClient.SqlConnection(_conString)
		Dim cmd2 As New SqlClient.SqlCommand()
		cmd2.Connection = con2
		cmd2.CommandType = CommandType.StoredProcedure
		cmd2.CommandText = "ProcedureInsertCategoryAssociative"
		Dim param2 As New SqlClient.SqlParameter
		param2.ParameterName = "@TypeCategoryAssociativeTable"
		param2.Value = GetCourseCategoryDataTable(courseid)
		cmd2.Parameters.Add(param2)
		con2.Open()
		cmd2.ExecuteNonQuery()
		con2.Close()


		Response.Write("<script>return alert('" & noUploaded & " files uploaded & " & noAlreadyExist & " already exist');</script")
		Response.Redirect("~/Tutor/TutorCRUDCourse.aspx")




		'cmd.parameter.add(param)
		'If (FileUploadDoc.HasFiles) Then
		'	Dim customfolder As String = "~/Tutor/files/" & UserName & "/docs/"
		'	Dim folderPath As String = Server.MapPath(customfolder)
		'	IO.Directory.CreateDirectory(folderPath)
		'	Dim noUploaded As Integer = 0
		'	Dim noOverwriten As Integer = 0
		'	Dim courseid As Integer = insertGetCourseId()
		'	insertCourseCategory(courseid)
		'	Dim MaterialId As String = DropDownListMaterialName.SelectedValue
		'	For Each file As HttpPostedFile In FileUploadDoc.PostedFiles
		'		Dim outputFileName As String = folderPath & file.FileName
		'		Dim dburl As String = customfolder & file.FileName
		'		If (IO.File.Exists(outputFileName)) Then
		'			IO.File.Delete(outputFileName)
		'			noOverwriten += 1
		'		Else
		'			noUploaded += 1
		'			insertUrl(courseid, dburl, MaterialId)
		'		End If
		'		file.SaveAs(outputFileName)
		'	Next
		'	Response.Write("<script>return alert('total files uploaded=" & noUploaded & " & overwritten=" & noOverwriten & "');</script")
		'	Response.Redirect("~/Tutor/TutorCRUDCourse.aspx?id=" & Request.QueryString("id"))
		'End If
	End Sub
	Private Function GetCourseCategoryDataTable(courseid) As DataTable
		Dim CategoryAssociativeTable As New DataTable
		CategoryAssociativeTable.Columns.Add("CourseId")
		CategoryAssociativeTable.Columns.Add("CategoryId")
		For Each listItem As ListItem In CheckBoxListCourseCategory.Items
			If (listItem.Selected) Then
				Dim CategoryId As Integer = listItem.Value
				CategoryAssociativeTable.Rows.Add(courseid, CategoryId)
				'insertingCat(CategoryId, courseid)
			End If
		Next
		Return CategoryAssociativeTable
	End Function
	'Private Sub insertingCat(CategoryId, courseId)
	'	Dim con As New SqlClient.SqlConnection(_conString)
	'	Dim cmd As New SqlClient.SqlCommand()
	'	cmd.Connection = con
	'	cmd.CommandType = CommandType.Text
	'	cmd.CommandText = "INSERT INTO CategoryAssociativeTable (CourseId, CategoryId) VALUES (@CourseId, @CategoryId);"
	'	cmd.Parameters.AddWithValue("@CourseId", courseId)
	'	cmd.Parameters.AddWithValue("@CategoryId", CategoryId)
	'	con.Open()
	'	cmd.ExecuteNonQuery()
	'	con.Close()
	'End Sub
	'Private Sub insertUrl(courseId As Integer, fileUrl As String, MaterialTypeId As Integer)
	'	Dim con As New SqlClient.SqlConnection(_conString)
	'	Dim cmd As New SqlClient.SqlCommand()
	'	cmd.Connection = con
	'	cmd.CommandType = CommandType.Text
	'	cmd.CommandText = "INSERT INTO MaterialAssociativeTable (CourseId, MaterialTypeId, MaterialPathUrl,DatePosted,MaterialName) VALUES (@CourseId, @MaterialTypeId, @MaterialPathUrl,@DatePosted,@MaterialName);"
	'	cmd.Parameters.AddWithValue("@MaterialTypeId", MaterialTypeId)
	'	cmd.Parameters.AddWithValue("@CourseId", courseId)
	'	cmd.Parameters.AddWithValue("@MaterialPathUrl", fileUrl)
	'	cmd.Parameters.AddWithValue("@DatePosted", DateTime.Now.Date)
	'	Dim fname As String = IO.Path.GetFileName(Server.MapPath(fileUrl))
	'	cmd.Parameters.AddWithValue("@MaterialName", fname)
	'	con.Open()
	'	cmd.ExecuteNonQuery()
	'	con.Close()
	'End Sub

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
		ddl0.Items.Insert(0, New ListItem("Select a material type", -1))
		ddl0.SelectedIndex = 0
		con.Close()
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'LoginRequired(mySession)
		If Not IsPostBack Then
			populateCategory()
			populateMaterialName()
		End If

	End Sub

	Protected Sub LinkButtonAdd_Click(sender As Object, e As EventArgs)
		If Page.IsValid Then : uploadCourse("tom") 'will be taken from session
		End If
	End Sub


End Class