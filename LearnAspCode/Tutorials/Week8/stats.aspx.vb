Public Class stats
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		getCategories()
	End Sub
	Private Sub getCategories()
		Dim con As New System.Data.SqlClient.SqlConnection(_conString)
		Dim cmd As New System.Data.SqlClient.SqlCommand()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT count(*) FROM tblMovies"
		cmd.Connection = con
		con.Open()
		Label1.Text = "total number of movies: " & cmd.ExecuteScalar()
		cmd.CommandText = "SELECT count(*) FROM tblMovies where status=1"
		Label2.Text = "total number of movies available: " & cmd.ExecuteScalar()
		con.Close()
	End Sub
End Class