Public Class blockuser
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
	End Sub
	Private Sub getActiveUsers()
		Dim dbconn As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "Select user_id, firstname, lastname, username from tbluser where status=1"
		cmd.Connection = dbconn
		Dim da As New SqlClient.SqlDataAdapter(cmd)
		Dim dt As New DataTable()
		da.Fill(dt)
		gvs.DataSource = dt
		gvs.DataBind()
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If (Not Page.IsPostBack) Then
			getActiveUsers()
		End If
	End Sub

	Protected Sub lnkblock_Click(sender As Object, e As EventArgs)
		'Retrieving the UserID from the command argument link button
		'Dim lnlk As LinkButton = CType(sender, LinkButton)
		Dim uid As Integer = Convert.ToInt16(sender.CommandArgument)
		Dim dbconn As New SqlClient.SqlConnection(_conString)
		'open Connection
		dbconn.Open()
		'Create Command
		Dim ucmd As New SqlClient.SqlCommand()
		ucmd.CommandType = CommandType.Text
		ucmd.CommandText = "update tblUser set status='0' Where user_id ='" & uid & "';"
		ucmd.Connection = dbconn
		ucmd.ExecuteNonQuery()
		dbconn.Close()
		getActiveUsers()
	End Sub

	Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
		If (gvs.Rows.Count > 0) Then
			'This replaces <td> with <th> and adds the scope attribute
			gvs.UseAccessibleHeader = True
			'This will add the <thead> and <tbody> elements
			gvs.HeaderRow.TableSection = TableRowSection.TableHeader
		End If
	End Sub
End Class