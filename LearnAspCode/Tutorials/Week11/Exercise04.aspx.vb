Public Class Exercise04
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not Page.IsPostBack Then
			txtmoviename_TextChanged(txtmoviename, Nothing)
		End If
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
		Dim param1 As String = ""
		Dim param2 As String = ""
		'check if moviename textbox is not empty
		'assign sql to search for moviename by starting character
		If Not IsNothing(strmovie) Then
			param1 = " and moviename Like @strmovie + '%'"
		End If
		'check if dropdown is not equal -1
		'assign sql to check if boxofficetotals is greater than dropdown value
		If ddlval <> -1 Then
			param2 = " and boxofficetotals > @ddlval"
		End If
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT * FROM tblMovies where status=1" & param1 & param2 + ";"
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