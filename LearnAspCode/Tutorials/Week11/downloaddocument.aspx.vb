Public Class downloaddocument
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		'Modify the SQL statement to show only files that the current
		'user has uploaded – (from a user perspective)
		'or
		'SQL statement to show files that all users have 'uploaded –(from subadmin perspective)
		cmd.CommandText = "select * from tbldocs as td, tbluuser as tu where tu.user_id=td.user_id;"
		Dim dr As SqlClient.SqlDataReader
		con.Open()
		dr = cmd.ExecuteReader()
		rptdoc.DataSource = dr
		rptdoc.DataBind()
	End Sub


End Class