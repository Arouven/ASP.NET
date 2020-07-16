Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Public Class CreatingADataSetToWorkWithTheDisconnectedDataModel
	Inherits System.Web.UI.Page


	Private ReadOnly _conString As String
	Public Sub New()
		_conString =
		WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not Page.IsPostBack Then
			getMovieList()
		End If
	End Sub
	Private Sub getMovieList()
		Dim con As New SqlConnection(_conString)
		Dim cmd As New SqlCommand()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select moviename, boxofficetotals, description from tblMovies"
		cmd.Connection = con
		'Create DataAdapter named da (Refer to slide 30)
		Dim da As New SqlDataAdapter(cmd)
		'Create DataSet named dstMovies
		Dim dstMovies As New DataSet
		'Populate the dataset using the Fill()
		Using da
			da.Fill(dstMovies)
		End Using
		'Bind dataset to detailsview
		DetailsView1.DataSource = dstMovies
		DetailsView1.DataBind()
	End Sub
	Protected Sub DetailsView1_PageIndexChanging(sender As Object, e As DetailsViewPageEventArgs) Handles DetailsView1.PageIndexChanging
		DetailsView1.PageIndex = e.NewPageIndex
		getMovieList()
	End Sub
End Class