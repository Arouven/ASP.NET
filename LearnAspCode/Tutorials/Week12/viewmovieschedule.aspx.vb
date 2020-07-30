Public Class viewmovieschedule
	Inherits System.Web.UI.Page
	Private _conString As String = ConfigurationManager.ConnectionStrings("MoviesCS").ToString
	Dim dbconn As New SqlClient.SqlConnection(_conString)
	Private Sub getMovies()
		dbconn.Open()
		Dim ccmd As New SqlClient.SqlCommand()
		ccmd.Connection = dbconn
		ccmd.CommandType = CommandType.Text
		ccmd.CommandText = "Select tm.movie_id as movie_id, "
		ccmd.CommandText += "tm.moviename as mname, "
		ccmd.CommandText += "tm.schedule as schedule, "
		ccmd.CommandText += "tm.status as status, "
		ccmd.CommandText += "tm.Description as descr, "
		ccmd.CommandText += "tm.poster as poster, "
		ccmd.CommandText += "tm.Boxofficetotals as box, "
		ccmd.CommandText += "tc.category_name as cat_name "
		ccmd.CommandText += "from tblMovies tm, tblcategory tc "
		ccmd.CommandText += "where tm.category_id = tc.category_id "
		ccmd.CommandText += "and tm.Status = 'True' "
		Dim sqlda As New SqlClient.SqlDataAdapter(ccmd)
		Dim dt As New DataTable()
		sqlda.Fill(dt)
		dbconn.Close()
		gvs.DataSource = dt
		gvs.DataBind()
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If (Not Page.IsPostBack) Then
			getMovies()
		End If
	End Sub


	Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
		'Retrieving the MovieID from the command argument link button
		'View movie schedule and delete movie
		Dim mov_id As Integer = Convert.ToInt32(CType(sender, LinkButton).CommandArgument)
		Dim schedule As String
		dbconn.Open()
		Dim scmd As New SqlClient.SqlCommand()
		scmd.Connection = dbconn
		scmd.CommandType = CommandType.Text
		scmd.CommandText = "Select schedule from tblmovies where movie_id='" & mov_id & "'"
		scmd.Connection = dbconn
		Dim dr As SqlClient.SqlDataReader
		dr = scmd.ExecuteReader()
		If (dr.HasRows) Then
			While (dr.Read())
				schedule = Server.MapPath(dr(0).ToString())
				If (Not IsNothing(String.IsNullOrEmpty(schedule))) Then
					IO.File.Delete(schedule)
				End If
			End While
		End If
		dr.Close()
		Dim dcmd As New SqlClient.SqlCommand()
		dcmd.Connection = dbconn
		dcmd.CommandType = CommandType.Text
		dcmd.CommandText = "delete from tblmovies where movie_id= " & mov_id
		dcmd.ExecuteNonQuery()
		dbconn.Close()
		Response.Redirect(Request.RawUrl)
	End Sub

	Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
		If (gvs.Rows.Count > 0) Then
			'This replaces <td> with <th> and adds the scope attribute
			gvs.UseAccessibleHeader = True
			'This will add the <thead> and <tbody> elements
			gvs.HeaderRow.TableSection = TableRowSection.TableHeader
		End If
	End Sub
End Class