


'Imports System.Data
'Imports System.Data.SqlClient
'Imports System.Web.Configuration

Public Class WebForm3
	Inherits System.Web.UI.Page



	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not Page.IsPostBack Then
			getMovieList()
		End If
	End Sub
	Private Sub getMovieList()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand With {
			.CommandType = CommandType.Text,
			.CommandText = "select movie_id,moviename, boxofficetotals, description from tblMovies",
			.Connection = con
		} ' "select * from tblMovies as tm, tblCategory as tc where tc.category_id=tm.category_id"

		'Create DataAdapter named da 
		Dim da As New SqlClient.SqlDataAdapter(cmd)
		'Create DataSet named dstMovies
		Dim dstMovies As New DataSet
		'Populate the dataset using the Fill()
		da.Fill(dstMovies)


		'Bind dataset to detailsview
		GridView1.DataSource = dstMovies
		GridView1.DataBind()
	End Sub
	'Protected Sub DetailsView1_PageIndexChanging(sender As Object, e As DetailsViewPageEventArgs) Handles DetailsView1.PageIndexChanging
	'	DetailsView1.PageIndex = e.NewPageIndex
	'	getMovieList()
	'End Sub
End Class