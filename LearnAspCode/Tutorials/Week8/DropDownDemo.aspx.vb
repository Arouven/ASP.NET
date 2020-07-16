
Public Class DropDownDemo
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
		DropDownList1.DataSource = cmd.ExecuteReader()
		DropDownList1.DataTextField = "Category_Name"
		DropDownList1.DataValueField = "category_id"
		DropDownList1.DataBind()
		con.Close()
		Dim li As New ListItem("select category", "-1")
		DropDownList1.Items.Insert(0, li)
	End Sub
End Class