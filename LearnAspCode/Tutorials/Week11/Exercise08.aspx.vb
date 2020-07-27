Public Class Exercise08
	Inherits System.Web.UI.Page

	Dim totals As Decimal


	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT * FROM tblMovies"
		'Create DataReader
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		'Bind the reader to the repeater control
		dlstMovies.DataSource = reader
		dlstMovies.DataBind()
		reader.Close()
		con.Close()

	End Sub

	Protected Sub dlstMovies_ItemDataBound(sender As Object, e As DataListItemEventArgs)
		If Not IsNothing(e.Item.DataItem) Then
			totals += CType(DataBinder.Eval(e.Item.DataItem, "BoxOfficeTotals"), Decimal)
		End If
		If e.Item.ItemType = ListItemType.Footer Then
			Dim lblTotal As Label = CType(e.Item.FindControl("lblTotal"), Label)
			lblTotal.Text = totals.ToString("c")
		End If
	End Sub

End Class