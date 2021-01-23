Public Class UpdateJob
  Inherits System.Web.UI.Page

  Private ReadOnly _conString As String

  Private jobId As Integer
  Public Sub New()
    _conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
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
    cmd.CommandText = "SELECT CategoryId FROM JobCategoryAssociativeTable where jobId=@jobId;"
    cmd.Parameters.AddWithValue("@jobId", jobId)
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
  Private Function PopulateTexboxes() As String
    Dim locname As String = ""
    Dim con As New SqlClient.SqlConnection(_conString)
    Dim cmd As New SqlClient.SqlCommand()
    cmd.Connection = con
    cmd.CommandType = CommandType.Text
    cmd.CommandText = "SELECT distinct 
jobTable.Title,
jobTable.Salary,
jobtable.Description,
jobtable.dateposted,
jobtable.deadlinedate,
jobtable.vacant,
locationtable.locationname
FROM jobtable
inner join jobLocationAssociativeTable on jobLocationAssociativeTable.jobId=jobtable.jobId
inner join LocationTable on LocationTable.LocationId=jobLocationAssociativeTable.LocationId
where jobtable.jobid=@jobid;"
    cmd.Parameters.AddWithValue("@jobid", jobId)
    Dim reader As SqlClient.SqlDataReader
    con.Open()
    reader = cmd.ExecuteReader()
    While reader.Read
      TextBoxCourseName.Text = reader(0)
      TextBoxsalary.Text = reader(1)
      TextBoxCourseDescription.Text = reader(2)
      TextBoxCreatedDate.Text = reader(3)
      TextBoxScheduleDate.Text = Convert.ToDateTime(reader(4)).ToString("yyyy-MM-ddThh:mm")
      CheckBoxvacant.Checked = reader(5)
      locname = reader(6)
    End While
    reader.Close()
    con.Close()
    Return locname
  End Function



  Private Function GetJobCategoryDataTable() As DataTable
    Dim CategoryAssociativeTable As New DataTable
    CategoryAssociativeTable.Columns.Add("JobId")
    CategoryAssociativeTable.Columns.Add("CategoryId")
    For Each listItem As ListItem In CheckBoxListCourseCategory.Items
      If (listItem.Selected = True) Then
        Dim CategoryId As Integer = listItem.Value
        CategoryAssociativeTable.Rows.Add(jobId, CategoryId)
      End If
    Next
    Return CategoryAssociativeTable
  End Function




  Private Sub updateCourse()
    Dim CategoryAssociativeTable As DataTable = GetJobCategoryDataTable()
    Dim Title As String = TextBoxCourseName.Text.Trim
    Dim DeadlineDate As DateTime = Convert.ToDateTime(TextBoxScheduleDate.Text)
    Dim Description As String = TextBoxCourseDescription.Text
    Dim Salary As String = TextBoxsalary.Text
    Dim DatePosted As DateTime = Convert.ToDateTime(TextBoxCreatedDate.Text)
    Dim Vacant As Boolean = CheckBoxvacant.Checked
    Dim LocationId As Int16 = ddl0.Value

    Dim con As New SqlClient.SqlConnection(_conString)
    Dim cmd As New SqlClient.SqlCommand()
    cmd.Connection = con
    cmd.CommandType = CommandType.StoredProcedure
    cmd.CommandText = "ProcedureUpdateJobAndLocationAssociativeAndCategoryAssociative"
    Dim param1 As SqlClient.SqlParameter = New SqlClient.SqlParameter
    param1.ParameterName = "@TypeCategoryAssociativeTable"
    param1.Value = CategoryAssociativeTable
    cmd.Parameters.Add(param1)
    cmd.Parameters.AddWithValue("@JobId", jobId)
    cmd.Parameters.AddWithValue("@Title", Title)
    cmd.Parameters.AddWithValue("@Salary", Salary)
    cmd.Parameters.AddWithValue("@Description", Description)
    cmd.Parameters.AddWithValue("@DatePosted", DatePosted)
    cmd.Parameters.AddWithValue("@DeadlineDate", DeadlineDate)
    cmd.Parameters.AddWithValue("@Vacant", Vacant)
    cmd.Parameters.AddWithValue("@LocationId", LocationId)
    con.Open()
    cmd.ExecuteNonQuery()
    con.Close()
  End Sub
  Private Function CheckboxhasChecked() As Boolean
    Dim CategoryAssociativeTable As Integer = 0
    'Message.Text = "Selected Item(s):" & "<br />" & "<br />"

    For i As Integer = 0 To CheckBoxListCourseCategory.Items.Count - 1
      If CheckBoxListCourseCategory.Items(i).Selected Then
        CategoryAssociativeTable += 1
      End If
    Next

    'For Each listItem As ListItem In CheckBoxListCourseCategory.Items
    '  If (listItem.Selected = True) Then
    '    CategoryAssociativeTable += 1
    '  End If
    'Next
    If CategoryAssociativeTable > 0 Then : Return True
    Else : Return False
    End If
  End Function


  Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
    If CheckboxhasChecked() = False Then
      Label1.Text = "Please select at least one"
    Else
      If ddl0.SelectedIndex > 0 Then
        Label1.Text = ""
        updateCourse()
        Response.Redirect("~/HouseOwner/ViewJob.aspx?id=" & jobId)
      End If
    End If



  End Sub

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    If Not IsNothing(Session("HOId")) Then
      Dim mydate As DateTime = DateTime.Now.ToString("yyyy-MM-ddThh:mm")
      mydate = mydate.AddDays(1)
      TextBoxScheduleDate.Attributes("min") = mydate.ToString("yyyy-MM-ddThh:mm")
      jobId = Convert.ToInt32(Request.QueryString("id"))
      If Not Page.IsPostBack Then
        populateCategory()
        CheckCheckbox()
        Dim locname As String = PopulateTexboxes()
        populateMaterialName(locname)
      End If
    Else Response.Redirect("~/Tutor/TutorLogin.aspx")
    End If


  End Sub

  Protected Sub btview_Click(sender As Object, e As EventArgs)
    Response.Redirect("~/HouseOwner/HOCRUDJob")
  End Sub
  Private Sub populateMaterialName(locname)
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
    'ddl0.SelectedIndex = 0
    Dim ListItem As ListItem = ddl0.Items.FindByText(locname)
    If ListItem IsNot Nothing Then
      'ddl0.ClearSelection()
      ListItem.Selected = True
    Else
      ddl0.SelectedIndex = 0
    End If
    con.Close()
  End Sub
End Class