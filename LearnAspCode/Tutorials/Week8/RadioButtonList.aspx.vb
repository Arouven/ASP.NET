Public Class RadioButtonList1
	Inherits System.Web.UI.Page

	Private ReadOnly _conString As String

	Public Sub New()
		_conString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		getCategories()
	End Sub
	Private Sub getCategories()
		Dim con As New System.Data.SqlClient.SqlConnection(_conString)
		Dim cmd As New System.Data.SqlClient.SqlCommand()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT * FROM tblCategory"
		cmd.Connection = con
		con.Open()
		RadioButtonList1.DataSource = cmd.ExecuteReader()
		RadioButtonList1.DataTextField = "Category_Name"
		RadioButtonList1.DataValueField = "category_id"
		RadioButtonList1.DataBind()
		con.Close()
	End Sub
End Class