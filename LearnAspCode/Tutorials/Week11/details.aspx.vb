Public Class details1
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
		Dim token As Integer = Request.QueryString("id")
		cmd.CommandText = "SELECT moviename,boxofficetotals,Description,poster FROM tblmovies where category_id=" & token
		'Create DataReader
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		'Bind the reader to the repeater control
		dlstMovieDetails.DataSource = reader
		dlstMovieDetails.DataBind()
		reader.Close()
		con.Close()
	End Sub
End Class