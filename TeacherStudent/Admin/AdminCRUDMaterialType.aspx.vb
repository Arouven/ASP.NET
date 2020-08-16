Public Class AdminCRUDMaterialType
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub

	Private Sub GetCourseCategory()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "Select MaterialTypeId, MaterialTypeName from MaterialTypeTable;"
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
		cmd.CommandText = "delete from MaterialTypeTable where MaterialTypeId=@MaterialTypeId;"
		cmd.Parameters.AddWithValue("@MaterialTypeId", Convert.ToInt32(CType(sender, LinkButton).CommandArgument))
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
		Dim nameToUpdate As String = TextBoxUpdateMaterial.Text.Trim
		If nameToUpdate = "" Then
		Else
			Dim con As New SqlClient.SqlConnection(_conString)
			Dim cmd As New SqlClient.SqlCommand()
			cmd.Connection = con
			con.Open()
			cmd.CommandType = CommandType.StoredProcedure
			cmd.CommandText = "ProcedureUpdateMaterialTypeTable"
			cmd.Parameters.AddWithValue("@MaterialTypeId", idToUpdate)
			cmd.Parameters.AddWithValue("@MaterialTypeName", nameToUpdate)
			cmd.ExecuteNonQuery()
			con.Close()
			Response.Redirect(Request.RawUrl)
		End If

	End Sub

	Protected Sub AddButton_Click(sender As Object, e As EventArgs)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "insert into MaterialTypeTable(MaterialTypeName) values (@MaterialTypeName);"
		cmd.Parameters.AddWithValue("@MaterialTypeName", TextBoxAddMaterial.Text.Trim)
		cmd.ExecuteNonQuery()
		con.Close()
		Response.Redirect(Request.RawUrl)
	End Sub
End Class