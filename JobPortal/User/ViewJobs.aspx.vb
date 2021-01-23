Public Class ViewJobs
  Inherits System.Web.UI.Page

	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
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
				ddlCategory.DataValueField = "Jobid"
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
			sqlParam = " jobtable.Title LIKE '%' + @Title + '%'"
		End If
		If (CatIDs <> "-1") Then
			sqlParamCat = " and jobcategoryAssociativeTable.categoryid = @CatID"
		End If
		cmd.CommandText = "SELECT Jobtable.jobid, jobtable.Title, jobtable.salary FROM jobtable
inner join jobcategoryAssociativeTable on jobtable.jobid=jobcategoryAssociativeTable.jobid
WHERE" + sqlParam + sqlParamCat
		cmd.Parameters.AddWithValue("@Title", TextBox1.Text.Trim())
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



	Protected Sub LinkButtonDescription_Click(sender As Object, e As EventArgs)
		Dim courseid As Integer = Convert.ToInt32(CType(sender, LinkButton).CommandArgument)
		If Not IsNothing(Session("HKId")) Then
			Response.Redirect("~/HouseKeeper/ViewJobDetails.aspx?id=" & courseid)
		Else Response.Redirect("~/HouseKeeper/HKLogin.aspx")
		End If
	End Sub


End Class
