Public Class Exercise07
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
		cmd.CommandText = "SELECT * FROM tblmovies"
		Dim da As New SqlClient.SqlDataAdapter(cmd)
		Dim dt As New DataTable()

		da.Fill(dt)
		dlstMovies.DataSource = dt
		dlstMovies.DataBind()
	End Sub
	Private Sub getMovies()
		Dim sql As String
		sql = "select * from tblMovies"
		'to verify which radiobutton has been checked
		If (radLow.Checked) Then
			'add the sql to sort ascending or descending
			sql += " order by boxofficetotal asc"
		ElseIf (radHigh.Checked) Then
			sql += " order by boxofficetotal desc"
		End If
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = sql
		'Create DataAdapter
		Dim da As New SqlClient.SqlDataAdapter(cmd)
		'Create DataSet
		Dim dstMovies As New DataSet()
		Using (da)
			da.Fill(dstMovies)
		End Using
		dlstMovies.DataSource = dstMovies
		dlstMovies.DataBind()
	End Sub
End Class