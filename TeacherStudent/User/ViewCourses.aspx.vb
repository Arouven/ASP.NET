Public Class ViewCourses
	Inherits System.Web.UI.Page

	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'Label1.Text = DateTime.Now.ToString()
		If (Not Page.IsPostBack) Then
			LoadCategory()
			TextBox1_TextChanged(TextBox1, Nothing)
		End If
	End Sub
	Private Sub LoadCategory()
		Dim category As New DataTable()
		Dim con As New SqlClient.SqlConnection(_conString)
		Using con
			Try
				Dim adapter = New SqlClient.SqlDataAdapter("SELECT * from CategoryTable", _conString)
				adapter.Fill(category)
				ddlCategory.DataSource = category
				ddlCategory.DataTextField = "categoryname"
				ddlCategory.DataValueField = "categoryid"
				ddlCategory.DataBind()
			Catch ex As Exception
				'Handle the error
			End Try
		End Using
		ddlCategory.Items.Insert(0, New ListItem("Select Category", "-1"))
	End Sub
	Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs)
		Dim CatIDs As String = ddlCategory.SelectedValue
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim sqlParam As String = ""
		Dim sqlParamCat As String = ""
		If (Not IsNothing(TextBox1.Text.Trim())) Then
			sqlParam = "and coursetable.coursename LIKE '%' + @coursename + '%'"
		End If
		If (CatIDs <> "-1") Then
			sqlParamCat = "and categoryAssociativeTable.categoryid = @CatID"
		End If
		cmd.CommandText = "SELECT coursetable.courseid, coursetable.coursename, coursetable.AimsAndObjectives FROM coursetable
inner join categoryAssociativeTable on coursetable.courseid=categoryAssociativeTable.courseid
WHERE  " + sqlParam + sqlParamCat
		cmd.Parameters.AddWithValue("@coursename", TextBox1.Text.Trim())
		cmd.Parameters.AddWithValue("@CatID", CatIDs)
		Dim table As New DataTable()
		Dim da As New SqlClient.SqlDataAdapter(cmd)
		da.Fill(table)
		lvMovies.DataSource = table
		lvMovies.DataBind()
	End Sub
	Protected Sub lvMovies_PagePropertiesChanging(sender As Object, e As PagePropertiesChangingEventArgs)
		TryCast(lvMovies.FindControl("DataPager1"), DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, False)
		TextBox1_TextChanged(TextBox1, Nothing)
		lblmsg.Text = ""
	End Sub

	Protected Sub ddlCategory_TextChanged(sender As Object, e As EventArgs)
		TextBox1_TextChanged(TextBox1, Nothing)
	End Sub























	'Private Sub GetCourselist()
	'	Dim con As New SqlClient.SqlConnection(_conString)
	'	Dim cmd As New SqlClient.SqlCommand()
	'	cmd.Connection = con
	'	con.Open()
	'	cmd.CommandType = CommandType.Text
	'	cmd.CommandText = "Select CourseName, DateSchedule,AimsAndObjectives from CourseTable;"
	'	Dim sqlda As New SqlClient.SqlDataAdapter(cmd)
	'	Dim dt As New DataTable()
	'	sqlda.Fill(dt)
	'	con.Close()
	'	gvs.DataSource = dt
	'	gvs.DataBind()
	'End Sub

	'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
	'	'loginRequired()
	'	If Not Page.IsPostBack Then : GetCourselist()
	'	End If
	'End Sub


	'Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
	'	If (gvs.Rows.Count > 0) Then
	'		gvs.UseAccessibleHeader = True
	'		gvs.HeaderRow.TableSection = TableRowSection.TableHeader
	'	End If
	'End Sub

	'Protected Sub btnSubscribe_Click(sender As Object, e As EventArgs)
	'	Response.Redirect("~/LoginRequired.aspx")
	'End Sub
End Class
