Public Class ViewTutors
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

		If Not IsNothing(Session("AdminId")) Then
			If (Not Page.IsPostBack) Then
				LoadCategory()
				TextBox1_TextChanged(TextBox1, Nothing)
			End If
		Else Response.Redirect("~/Admin/AdminLogin.aspx")
		End If



	End Sub
	Private Sub LoadCategory()

		ddlCategory.Items.Add(New ListItem("Freeze", "1"))
		ddlCategory.Items.Add(New ListItem("Unfreeze", "0"))

		ddlCategory.Items.Insert(0, New ListItem("Select Category", "-1"))
	End Sub
	Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs)
		Dim Freeze As String = ddlCategory.SelectedValue
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim sqlParam As String = ""
		Dim sqlParamCat As String = ""
		If (Not IsNothing(TextBox1.Text.Trim())) Then
			sqlParam = " UserName LIKE '%' + @mname + '%'"
		End If
		If (Freeze <> "-1") Then
			sqlParamCat = " and Freeze = @Freeze"
		End If
		cmd.CommandText = "SELECT TutorId, ProfilePictureUrl, UserName FROM TutorTable WHERE" + sqlParam + sqlParamCat
		cmd.Parameters.AddWithValue("@mname", TextBox1.Text.Trim())
		cmd.Parameters.AddWithValue("@Freeze", Freeze)
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
End Class