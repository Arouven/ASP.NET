Public Class Exercise04
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
	End Sub
	Protected Sub txtmoviename_TextChanged(sender As Object, e As EventArgs)
		'retrieve the values from the textbox and dropdown and save in variables
		Dim strmovie As String = txtmoviename.Text.Trim
		Dim ddlval As String = ddlboxtotals.SelectedValue
		'declare two variables and initialize to empty string literal
		'check if moviename textbox is not empty
		'assign sql to search for moviename by starting character
		'check if dropdown is not equal -1
		'assign sql to check if boxofficetotals is greater than dropdown value
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT * FROM tblMovies where status=1"
		'create two parameters: moviename and amount
		cmd.Parameters.AddWithValue("@strmovie", strmovie)
		cmd.Parameters.AddWithValue("@ddlval", ddlval)
		Dim dr As SqlClient.SqlDataReader
		con.Open()
		dr = cmd.ExecuteReader
		dlstMovies.DataSource = dr
		dlstMovies.DataBind()
		con.Close()
	End Sub
End Class