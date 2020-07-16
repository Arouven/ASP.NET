Public Class WorkingWithTheBulletedListControl
	Inherits System.Web.UI.Page

	Private ReadOnly _conString As String

	Public Sub New()
		_conString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		getMovieDetails()
	End Sub
	Private Sub getMovieDetails()
		Dim con As New System.Data.SqlClient.SqlConnection(_conString)
		Dim cmd As New System.Data.SqlClient.SqlCommand()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select * from tblMovies as tm, tblCategory as tc where tc.category_id=tm.category_id"
		cmd.Connection = con
		con.Open()
		Dim dr As System.Data.SqlClient.SqlDataReader
		dr = cmd.ExecuteReader()
		While dr.Read()
			Dim newItem As New ListItem()
			newItem.Text = dr("category_name") & ": " & dr("MovieName") & ", $ " & dr("Boxofficetotals")
			'newItem.Value = dr(“Movie_Id”)
			list1.Items.Add(newItem)
		End While
		dr.Close()
	End Sub

End Class