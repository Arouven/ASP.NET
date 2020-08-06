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
		cmd.CommandType = CommandType.Text
		Dim tutorid As Integer = 3 'Convert.ToInt32(Request.QueryString("id")) 'tutorid
		Dim courseId As Integer = 0
		Dim sqlStatement As String = "insert into CourseTable( TutorId, CourseName, DateSchedule, DateCreated, CourseDescription, AimsAndObjectives) values (@TutorId, @CourseName, @DateSchedule, @DateCreated, @CourseDescription, @AimsAndObjectives);" & "SELECT @@IDENTITY AS [@@IDENTITY];"
		cmd.CommandText = sqlStatement
		cmd.Parameters.AddWithValue("@TutorId", tutorid)
		cmd.Parameters.AddWithValue("@CourseName", TextBoxCourseName.Text.Trim)
		cmd.Parameters.AddWithValue("@DateSchedule", DateTime.Now)
		cmd.Parameters.AddWithValue("@DateCreated", DateTime.Now)
		cmd.Parameters.AddWithValue("@CourseDescription", TextBoxCourseDescription.Text.Trim)
		cmd.Parameters.AddWithValue("@AimsAndObjectives", TextBoxAimsAndObjectives.Text.Trim)
		con.Open()
		courseId = cmd.ExecuteScalar
		con.Close()
		Return courseId
	End Function
	Private Sub populateCategory()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT CategoryId,CategoryName FROM CategoryTable;"
		'Create DataReader
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

	Private Sub uploadCourse(UserName As String)
		'check if file upload contains a file
		If (FileUploadDoc.HasFiles) Then
			'add the filename as an argument
			'Add a folder bearing the Session name in the path below
			Dim customfolder As String = "~/Tutor/files/" & UserName & "/docs/"
			Dim folderPath As String = Server.MapPath(customfolder)
			'create above directory by using
			'Directory.CreateDirectory() method
			IO.Directory.CreateDirectory(folderPath)
			'Upload file in filesystem by concatenating the folderpath
			'with the filename

			Dim noUploaded As Integer = 0
			Dim noOverwriten As Integer = 0
			Dim courseid As Integer = insertGetCourseId()
			insertCourseCategory(courseid)
			Dim MaterialId As String = DropDownListMaterialName.SelectedValue
			For Each file As HttpPostedFile In FileUploadDoc.PostedFiles
				Dim outputFileName As String = folderPath & file.FileName
				Dim dburl As String = customfolder & file.FileName
				If (IO.File.Exists(outputFileName)) Then
					IO.File.Delete(outputFileName)
					noOverwriten += 1
				Else
					noUploaded += 1
					insertUrl(courseid, dburl, MaterialId)
				End If
				file.SaveAs(outputFileName)
			Next
			Response.Redirect("~/Tutor/TutorCRUDCourse.aspx?id=" & Request.QueryString("id"))
		End If
	End Sub
	Private Sub insertCourseCategory(courseid)
		For Each listItem As ListItem In CheckBoxListCourseCategory.Items
			If (listItem.Selected) Then
				Dim CategoryId As Integer = listItem.Value
				insertingCat(CategoryId, courseid)
			End If
		Next
	End Sub
	Private Sub insertingCat(CategoryId, courseId)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "INSERT INTO CategoryAssociativeTable (CourseId, CategoryId) VALUES (@CourseId, @CategoryId);"
		cmd.Parameters.AddWithValue("@CourseId", courseId)
		cmd.Parameters.AddWithValue("@CategoryId", CategoryId)
		con.Open()
		cmd.ExecuteNonQuery()
		con.Close()
	End Sub
	Private Sub insertUrl(courseId As Integer, fileUrl As String, MaterialTypeId As Integer)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "INSERT INTO MaterialAssociativeTable (CourseId, MaterialTypeId, MaterialPathUrl,DatePosted,MaterialName) VALUES (@CourseId, @MaterialTypeId, @MaterialPathUrl,@DatePosted,@MaterialName);"
		cmd.Parameters.AddWithValue("@MaterialTypeId", MaterialTypeId)
		cmd.Parameters.AddWithValue("@CourseId", courseId)
		cmd.Parameters.AddWithValue("@MaterialPathUrl", fileUrl)
		cmd.Parameters.AddWithValue("@DatePosted", DateTime.Now.Date)
		Dim fname As String = IO.Path.GetFileName(Server.MapPath(fileUrl))
		cmd.Parameters.AddWithValue("@MaterialName", fname)
		con.Open()
		cmd.ExecuteNonQuery()
		con.Close()
	End Sub

	Private Sub populateMaterialName()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT MaterialTypeId,MaterialTypeName FROM MaterialTypeTable;"
		con.Open()
		DropDownListMaterialName.Items.Add(New ListItem("Select a material type", -1))
		DropDownListMaterialName.DataSource = cmd.ExecuteReader()
		DropDownListMaterialName.DataTextField = "MaterialTypeName"
		DropDownListMaterialName.DataValueField = "MaterialTypeId"
		DropDownListMaterialName.DataBind()
		DropDownListMaterialName.SelectedIndex = 0
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

		uploadCourse("tom") 'will be taken from session
	End Sub

	Protected Sub btnAddMaterials_Click(sender As Object, e As EventArgs)

	End Sub
End Class