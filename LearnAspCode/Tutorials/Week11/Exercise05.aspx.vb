Public Class Exercise05
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
		cmd.CommandText = "SELECT * FROM tblcategory"
		'Create DataReader
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		'Bind the reader to the repeater control
		rptMovieCategories.DataSource = reader
		rptMovieCategories.DataBind()
		reader.Close()
		con.Close()

		Dim cmd2 As New SqlClient.SqlCommand()
		cmd2.Connection = con
		cmd2.CommandType = CommandType.Text
		Dim token As Integer = Request.QueryString("id")
		cmd2.CommandText = "SELECT * FROM tblmovies where category_id=" & token
		'Create DataReader
		Dim reader2 As SqlClient.SqlDataReader
		con.Open()
		reader2 = cmd2.ExecuteReader()
		'Bind the reader to the repeater control
		rptMovies.DataSource = reader2
		rptMovies.DataBind()
		reader2.Close()
		con.Close()
	End Sub
End Class