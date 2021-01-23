Public Class AdminCRUDCategory
  Inherits System.Web.UI.Page

	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub
	Private Sub GetCourseCategory()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "Select CategoryId, CategoryName from CategoryTable;"
		Dim sqlda As New SqlClient.SqlDataAdapter(cmd)
		Dim dt As New DataTable()
		sqlda.Fill(dt)
		con.Close()
		gvs.DataSource = dt
		gvs.DataBind()
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

		If Not IsNothing(Session("AdminId")) Then
			If Not Page.IsPostBack Then : GetCourseCategory()
			End If
		Else Response.Redirect("~/Admin/AdminLogin.aspx")
		End If


	End Sub

	Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "delete from CategoryTable where CategoryId=@CategoryId;"
		cmd.Parameters.AddWithValue("@CategoryId", Convert.ToInt32(CType(sender, LinkButton).CommandArgument))
		cmd.ExecuteNonQuery()
		con.Close()
		GetCourseCategory()
	End Sub

	Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
		If (gvs.Rows.Count > 0) Then
			gvs.UseAccessibleHeader = True
			gvs.HeaderRow.TableSection = TableRowSection.TableHeader
		End If
	End Sub

	Protected Sub UpdateButton_Click(sender As Object, e As EventArgs)
		Dim idToUpdate As Integer = Convert.ToInt32(myHiddenId.Value)
		Dim nameToUpdate As String = TextBoxUpdateCategory.Text.Trim
		If nameToUpdate = "" Then
		Else
			Dim con As New SqlClient.SqlConnection(_conString)
			Dim cmd As New SqlClient.SqlCommand()
			cmd.Connection = con
			con.Open()
			cmd.CommandType = CommandType.Text
			cmd.CommandText = "update CategoryTable set CategoryName=@CategoryName where CategoryId=@CategoryId;"
			cmd.Parameters.AddWithValue("@CategoryId", idToUpdate)
			cmd.Parameters.AddWithValue("@CategoryName", nameToUpdate)
			cmd.ExecuteNonQuery()
			con.Close()
			Response.Redirect(Request.RawUrl)
		End If

	End Sub

	Protected Sub AddButton_Click(sender As Object, e As EventArgs)
		If TextBoxAddCategory.Text.Trim.Length > 0 Then
			Dim con As New SqlClient.SqlConnection(_conString)
			Dim cmd As New SqlClient.SqlCommand()
			cmd.Connection = con
			con.Open()
			cmd.CommandType = CommandType.Text
			cmd.CommandText = "insert into CategoryTable(CategoryName) values (@CategoryName);"
			cmd.Parameters.AddWithValue("@CategoryName", TextBoxAddCategory.Text.Trim)
			cmd.ExecuteNonQuery()
			con.Close()
			Response.Redirect(Request.RawUrl)
		End If
	End Sub
End Class
