Public Class AdminCRUDCourseCategory
	Inherits System.Web.UI.Page

	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Private Sub GetCourseCategory()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "Select CategoryId, CategoryName from CategoryTable;"
		Dim sqlda As New SqlClient.SqlDataAdapter(cmd)
		Dim dt As New DataTable()
		sqlda.Fill(dt)
		con.Close()
		gvs.DataSource = dt
		gvs.DataBind()
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'loginRequired()
		If Not Page.IsPostBack Then : GetCourseCategory()
		End If
	End Sub

	Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "delete from CategoryTable where CategoryId=@CategoryId;"
		cmd.Parameters.AddWithValue("@CategoryId", Convert.ToInt32(CType(sender, LinkButton).CommandArgument))
		cmd.ExecuteNonQuery()
		con.Close()
		GetCourseCategory()
	End Sub

	Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
		If (gvs.Rows.Count > 0) Then
			gvs.UseAccessibleHeader = True
			gvs.HeaderRow.TableSection = TableRowSection.TableHeader
		End If
	End Sub

	Protected Sub UpdateButton_Click(sender As Object, e As EventArgs)
		Dim idToUpdate As Integer = Convert.ToInt32(myHiddenId.Value)
		Dim nameToUpdate As String = TextBoxUpdateCategory.Text.Trim
		If nameToUpdate = "" Then
		Else
			Dim con As New SqlClient.SqlConnection(_conString)
			Dim cmd As New SqlClient.SqlCommand()
			cmd.Connection = con
			con.Open()
			cmd.CommandType = CommandType.Text
			cmd.CommandText = "update CategoryTable set CategoryName=@CategoryName where CategoryId=@CategoryId;"
			cmd.Parameters.AddWithValue("@CategoryId", idToUpdate)
			cmd.Parameters.AddWithValue("@CategoryName", nameToUpdate)
			cmd.ExecuteNonQuery()
			con.Close()
			Response.Redirect(Request.RawUrl)
		End If

	End Sub

	Protected Sub AddButton_Click(sender As Object, e As EventArgs)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		con.Open()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "insert into CategoryTable(CategoryName) values (@CategoryName);"
		cmd.Parameters.AddWithValue("@CategoryName", TextBoxAddCategory.Text.Trim)
		cmd.ExecuteNonQuery()
		con.Close()
		Response.Redirect(Request.RawUrl)
	End Sub
End Class



'Private _conString As String = ConfigurationManager.ConnectionStrings("MoviesCS").ToString
'Dim dbconn As New SqlClient.SqlConnection(_conString)
'Private Sub getMovies()
'	dbconn.Open()
'	Dim ccmd As New SqlClient.SqlCommand()
'	ccmd.Connection = dbconn
'	ccmd.CommandType = CommandType.Text
'	ccmd.CommandText = "Select tm.movie_id as movie_id, "
'	ccmd.CommandText += "tm.moviename as mname, "
'	ccmd.CommandText += "tm.schedule as schedule, "
'	ccmd.CommandText += "tm.status as status, "
'	ccmd.CommandText += "tm.Description as descr, "
'	ccmd.CommandText += "tm.poster as poster, "
'	ccmd.CommandText += "tm.Boxofficetotals as box, "
'	ccmd.CommandText += "tc.category_name as cat_name "
'	ccmd.CommandText += "from tblMovies tm, tblcategory tc "
'	ccmd.CommandText += "where tm.category_id = tc.category_id "
'	ccmd.CommandText += "and tm.Status = 'True' "
'	Dim sqlda As New SqlClient.SqlDataAdapter(ccmd)
'	Dim dt As New DataTable()
'	sqlda.Fill(dt)
'	dbconn.Close()
'	gvs.DataSource = dt
'	gvs.DataBind()
'End Sub
'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
'	If (Not Page.IsPostBack) Then
'		getMovies()
'	End If
'End Sub


'Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
'	'Retrieving the MovieID from the command argument link button
'	'View movie schedule and delete movie
'	Dim mov_id As Integer = Convert.ToInt32(CType(sender, LinkButton).CommandArgument)
'	Dim schedule As String
'	dbconn.Open()
'	Dim scmd As New SqlClient.SqlCommand()
'	scmd.Connection = dbconn
'	scmd.CommandType = CommandType.Text
'	scmd.CommandText = "Select schedule,poster from tblmovies where movie_id='" & mov_id & "'"
'	scmd.Connection = dbconn
'	Dim dr As SqlClient.SqlDataReader
'	dr = scmd.ExecuteReader()
'	If (dr.HasRows) Then
'		While (dr.Read())
'			schedule = Server.MapPath(dr(0).ToString())
'			Dim poster As String = Server.MapPath("../../images/" + (dr(1).ToString()))
'			If (Not IsNothing(String.IsNullOrEmpty(schedule))) Then
'				IO.File.Delete(schedule)
'				IO.File.Delete(poster)
'			End If
'		End While
'	End If
'	dr.Close()
'	Dim dcmd As New SqlClient.SqlCommand()
'	dcmd.Connection = dbconn
'	dcmd.CommandType = CommandType.Text
'	dcmd.CommandText = "delete from tblmovies where movie_id= " & mov_id
'	dcmd.ExecuteNonQuery()
'	dbconn.Close()
'	Response.Redirect(Request.RawUrl)
'End Sub

'Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
'	If (gvs.Rows.Count > 0) Then
'		'This replaces <td> with <th> and adds the scope attribute
'		gvs.UseAccessibleHeader = True
'		'This will add the <thead> and <tbody> elements
'		gvs.HeaderRow.TableSection = TableRowSection.TableHeader
'	End If
'End Sub