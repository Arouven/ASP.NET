Public Class AdminCRUDJob
  Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub
	Private Sub GetCourses()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.StoredProcedure
		cmd.CommandText = "ProcedureGetAllJobs"
		Dim sqlda As New SqlClient.SqlDataAdapter(cmd)
		Dim dt As New DataTable()
		sqlda.Fill(dt)
		con.Close()
		gvs.DataSource = dt
		gvs.DataBind()
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsNothing(Session("AdminId")) Then
			GetCourses()
		Else Response.Redirect("~/Admin/AdminLogin.aspx")
		End If

	End Sub
	Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "delete from JobTable where JobId=@JobId;"
		cmd.Parameters.AddWithValue("@JobId", Convert.ToInt32(CType(sender, LinkButton).CommandArgument))
		cmd.ExecuteNonQuery()
		con.Close()
		GetCourses()
	End Sub

	Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
		If (gvs.Rows.Count > 0) Then
			gvs.UseAccessibleHeader = True
			gvs.HeaderRow.TableSection = TableRowSection.TableHeader
		End If
	End Sub

End Class