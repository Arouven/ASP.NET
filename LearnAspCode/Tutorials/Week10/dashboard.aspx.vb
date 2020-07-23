Imports System.Data.SqlClient
Public Class dashboard
	Inherits System.Web.UI.Page

	Private conn As String = ConfigurationManager.ConnectionStrings("MoviesCS").ToString

	Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
		If (Not IsNothing(Session("adminuname"))) Then
			Response.Redirect("~/Tutorials/Week5/login.aspx")
		End If

		lblMsg.Text = ""
		If Not IsPostBack Then
			BindCategoryData()
		End If
	End Sub
	Private Sub BindCategoryData()
		Dim sqlCon As New SqlConnection(conn)
		Dim cmd As New SqlCommand()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT * FROM tblCategory"
		cmd.Connection = sqlCon
		Dim da As New SqlDataAdapter(cmd)
		'Create a DataTable
		Dim dt As New DataTable
		Using (da)
			'Populate the DataTable
			da.Fill(dt)
		End Using
		'Set the DataTable as the DataSource
		gvCatNames.DataSource = dt
		gvCatNames.DataBind()
	End Sub
	'Read data from GridView and Populate the form
	Protected Sub gvCatNames_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
		txtCategoryId.Text =
		gvCatNames.DataKeys(gvCatNames.SelectedRow.RowIndex).Value.ToString()
		txtCategoryName.Text = (TryCast(gvCatNames.SelectedRow.FindControl("lblCatName"), Label)).Text
		'Hide Insert button during update/delete
		btnInsert.Visible = False
	End Sub
	Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
		ResetAll()
	End Sub
	Private Sub ResetAll()
		btnInsert.Visible = True
		txtCategoryId.Text = ""
		txtCategoryName.Text = ""
	End Sub

	Protected Sub btnInsert_Click(sender As Object, e As EventArgs)
		Dim IsAdded As Boolean = False
		'Add built-in function to remove spaces from Textbox Category name
		Dim CatName As String = txtCategoryName.Text.Trim
		Dim sqlCon As New SqlConnection(conn)
		Dim cmd As New SqlCommand()
		'add INSERT statement to create new category name
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "insert into tblCategroy (category_name) value (@cname);"
		'create Parameterized query to prevent sql injection by
		cmd.Parameters.AddWithValue("@cname", CatName)
		'using above String name
		cmd.Connection = sqlCon
		sqlCon.Open()
		'use Command method to execute INSERT statement and return
		'boolean if number of records inserted is greater than zero
		IsAdded = cmd.ExecuteNonQuery() > 0
		sqlCon.Close()
		If IsAdded Then
			lblMsg.Text = "'" & CatName & "' category added successfully!"
			lblMsg.ForeColor = System.Drawing.Color.Green
			'Refresh the GridView by calling the BindCategoryData()
			BindCategoryData()
		Else
			lblMsg.Text = "Error while adding '" & CatName & "' category"
			lblMsg.ForeColor = System.Drawing.Color.Red
		End If
		ResetAll()
	End Sub

	Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
		'check whether the categoryid textbox is empty
		If String.IsNullOrEmpty(txtCategoryId.Text) Then
			lblMsg.Text = "Please select record to update"
			lblMsg.ForeColor = System.Drawing.Color.Red
			Return
		End If
		Dim IsUpdated As Boolean = False
		Dim CatID As Integer = Convert.ToInt32(txtCategoryId.Text)
		'Add built-in function to remove spaces from Textbox Category name
		Dim CatName As String = txtCategoryName.Text.Trim
		Dim sqlCon As New SqlConnection(conn)
		Dim cmd As New SqlCommand()
		cmd.CommandType = CommandType.Text
		'Add UPDATE statement to update category name for the above CatID
		cmd.CommandText = "update tblcategory set category_name=@category_name where category_id=@ category_id;"
		'Create two parameterized queries [CatID and CatName]
		cmd.Parameters.AddWithValue("@category_name", CatName)
		cmd.Parameters.AddWithValue("@ category_id", CatID)
		cmd.Connection = sqlCon
		sqlCon.Open()
		'use Command method to execute UPDATE statement and return
		'boolean if number of records UPDATED is greater than zero
		IsUpdated = cmd.ExecuteNonQuery() > 0
		sqlCon.Close()
		If IsUpdated Then
			lblMsg.Text = "'" & CatName & "' category updated successfully!"
			lblMsg.ForeColor = System.Drawing.Color.Green
			'Refresh the GridView by calling the BindCategoryData()
			BindCategoryData()
		Else
			lblMsg.Text = "Error while updating '" & CatName & "' category"
			lblMsg.ForeColor = System.Drawing.Color.Red
		End If
		'Ensure that no rows are selected in Gridview by changing the EditIndex
		ResetAll()
	End Sub

	Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
		'check whether the categoryid textbox is empty
		If String.IsNullOrEmpty(txtCategoryId.Text) Then
			lblMsg.Text = "Please select record to delete"
			lblMsg.ForeColor = System.Drawing.Color.Red
			Return
		End If
		Dim IsDeleted As Boolean = False
		Dim CatID As Integer = Convert.ToInt32(txtCategoryId.Text)
		'Add built-in function to remove spaces from Textbox Category name
		Dim CatName As String = txtCategoryName.Text.Trim
		Dim sqlCon As New SqlConnection(conn)
		Dim cmd As New SqlCommand()
		cmd.CommandType = CommandType.Text
		'Add DELETE statement to delete the selected category for the above CatID
		cmd.CommandText = "delete from tblcategory where category_id=@cid;"
		'Create a parametererized query for CatID
		cmd.Parameters.AddWithValue("@cid", CatID)
		cmd.Connection = sqlCon
		sqlCon.Open()
		'use Command method to execute DELETE statement and return
		'boolean if number of records DELETED is greater than zero
		IsDeleted = cmd.ExecuteNonQuery > 0
		sqlCon.Close()
		If IsDeleted Then
			lblMsg.Text = "'" & CatName & "' category deleted successfully!"
			lblMsg.ForeColor = System.Drawing.Color.Green
			'Refresh the GridView by calling the BindCategoryData()
			BindCategoryData()
		Else
			lblMsg.Text = "Error while deleting '" & CatName & "' category"
			lblMsg.ForeColor = System.Drawing.Color.Red
		End If
		ResetAll()
	End Sub
End Class