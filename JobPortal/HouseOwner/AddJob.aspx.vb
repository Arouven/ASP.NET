Public Class AddJob
  Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Private hoid As Integer
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub
	Private Function insertAndGetJobId() As Integer
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.StoredProcedure
		cmd.CommandText = "ProcedureInsertJob"
		cmd.Parameters.AddWithValue("@HOId", hoid)
		cmd.Parameters.AddWithValue("@Title", TextBoxCourseName.Text.Trim)
		cmd.Parameters.AddWithValue("@DeadlineDate", Convert.ToDateTime(TextBoxScheduleDate.Text))
		cmd.Parameters.AddWithValue("@DatePosted", DateTime.Now)
		cmd.Parameters.AddWithValue("@Description", TextBoxCourseDescription.Text.Trim)
		cmd.Parameters.AddWithValue("@Salary", TextBoxSalary.Text.Trim)
		Dim retId = cmd.Parameters.Add("@lastJobIdInserted", SqlDbType.Int)
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
	Private Sub populateLocationName()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT locationId,locationName FROM locationTable;"
		con.Open()
		ddl0.DataSource = cmd.ExecuteReader()
		ddl0.DataTextField = "locationName"
		ddl0.DataValueField = "locationId"
		ddl0.DataBind()
		ddl0.Items.Insert(0, New ListItem("Select a location", ""))
		ddl0.SelectedIndex = 0
		con.Close()
	End Sub


	Private Sub uploadCourse()
		Dim jobid As Integer = insertAndGetJobId()
		Dim LocationId As Int16 = ddl0.Value
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.StoredProcedure
		cmd.CommandText = "ProcedureLocationAssociativeAndCategoryAssociative"
		Dim param1 As SqlClient.SqlParameter = New SqlClient.SqlParameter
		param1.ParameterName = "@TypeCategoryAssociativeTable"
		Dim CategoryAssociativeTable As DataTable = GetCourseCategoryDataTable(jobid)
		param1.Value = CategoryAssociativeTable
		cmd.Parameters.Add(param1)
		cmd.Parameters.AddWithValue("@JobId", jobid)
		cmd.Parameters.AddWithValue("@LocationId", LocationId)
		con.Open()
		cmd.ExecuteNonQuery()
		con.Close()
		Response.Redirect("~/HouseOwner/HOCRUDJob.aspx")
	End Sub
	Private Function GetCourseCategoryDataTable(courseid) As DataTable
		Dim CategoryAssociativeTable As New DataTable
		CategoryAssociativeTable.Columns.Add("JobId")
		CategoryAssociativeTable.Columns.Add("CategoryId")
		For Each listItem As ListItem In CheckBoxListCourseCategory.Items
			If (listItem.Selected = True) Then
				Dim CategoryId As Integer = listItem.Value
				CategoryAssociativeTable.Rows.Add(courseid, CategoryId)
			End If
		Next
		Return CategoryAssociativeTable
	End Function




	Private Function CheckboxhasChecked() As Boolean
		Dim CategoryAssociativeTable As Integer = 0
		For i As Integer = 0 To CheckBoxListCourseCategory.Items.Count - 1
			If CheckBoxListCourseCategory.Items(i).Selected Then
				CategoryAssociativeTable += 1
			End If
		Next
		'For Each listItem As ListItem In CheckBoxListCourseCategory.Items
		'	If (listItem.Selected = True) Then
		'		CategoryAssociativeTable += 1
		'	End If
		'Next
		If CategoryAssociativeTable > 0 Then : Return True
		Else : Return False
		End If
	End Function
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsNothing(Session("HOId")) Then
			hoid = Session("HOId")
			Dim mydate As DateTime = DateTime.Now.ToString("yyyy-MM-ddThh:mm")
			mydate = mydate.AddDays(1)
			TextBoxScheduleDate.Attributes("min") = mydate.ToString("yyyy-MM-ddThh:mm")
			If Not IsPostBack Then
				populateLocationName()
				populateCategory()
			End If
		Else Response.Redirect("~/HouseOwner/HOLogin.aspx")
		End If



	End Sub
	Protected Sub LinkButtonAdd_Click(sender As Object, e As EventArgs)
		If Not CheckboxhasChecked() Then
			Label1.Text = "Please select at least one"
		Else
			If ddl0.SelectedIndex > 0 Then
				Label1.Text = ""
				uploadCourse()
			Else
				Label1.Text = "Insert location"
			End If
		End If
	End Sub


End Class