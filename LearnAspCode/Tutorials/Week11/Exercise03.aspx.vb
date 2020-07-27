Public Class Exercise03
	Inherits System.Web.UI.Page

	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		getMovies()
		countMovies()
	End Sub
	Private Sub getMovies()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT movie_id,moviename,boxofficetotals,poster,director FROM tblMovies;"
		'Create DataReader
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		'Bind the reader to the repeater control
		dlstMovies.DataSource = reader
		dlstMovies.DataBind()
		con.Close()
	End Sub
	Private Sub countMovies()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT count(*) FROM tblMovies;"

		con.Open()
		lblcount.Text = "Number of movies In store: " & cmd.ExecuteScalar()
		con.Close()
	End Sub
End Class