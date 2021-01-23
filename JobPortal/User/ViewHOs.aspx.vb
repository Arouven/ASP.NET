Public Class ViewHOs
  Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub
	Private Sub FillListView(myList As ListView)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT HouseOwnerTable.HOId, HouseOwnerTable.UserName, HouseOwnerTable.ProfilePictureUrl, locationTable.LocationName 
FROM HouseOwnerTable 
inner join JobTable on JobTable.HOId=HouseOwnerTable.HOId
inner join JobLocationAssociativeTable on JobLocationAssociativeTable.JobId=JobTable.JobId
inner join LocationTable on LocationTable.LocationId=JobLocationAssociativeTable.LocationId;"

		'Create DataAdapter
		Dim myDataAdapter As New SqlClient.SqlDataAdapter(cmd)
		'Create DataSet
		Dim myDataSet As New DataSet()
		Using (myDataAdapter)
			myDataAdapter.Fill(myDataSet)
		End Using
		myList.DataSource = myDataSet
		myList.DataBind()
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		TextBox1.Style.Add("display", "none")
		FillListView(lvMovies)
		If (Not Page.IsPostBack) Then
			'LoadCategory()
			TextBox1_TextChanged(TextBox1, Nothing)
		End If

	End Sub

	Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs)
		'Dim CatIDs As String = ddlCategory.SelectedValue
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim sqlParam As String = ""
		Dim sqlParamCat As String = ""
		If (Not IsNothing(TextBox1.Text.Trim())) Then
			sqlParam = "UserName LIKE '%' + @UserName + '%'"
		End If
		Dim sql As String = "select * From HouseOwnerTable ;" ' & sqlParam
		cmd.CommandText = sql


		'		'"Select distinct Username,CategoryName from CourseTable
		'inner join  TutorTable on CourseTable.TutorId=TutorTable.TutorId 
		'inner join  CategoryAssociativeTable on CourseTable.CourseId=CategoryAssociativeTable.CourseId 
		'inner join  CategoryTable on CategoryAssociativeTable.CategoryId=CategoryTable.CategoryId 
		' WHERE " & sqlParam & "
		';" '"SELECT TutorId, UserName,  ProfilePictureUrl FROM TutorTable WHERE " + sqlParam + sqlParamCat
		'cmd.Parameters.AddWithValue("@UserName", TextBox1.Text.Trim())
		'Dim table As New DataTable()
		'Dim da As New SqlClient.SqlDataAdapter(cmd)
		con.Open()
		Dim rdr As SqlClient.SqlDataReader = cmd.ExecuteReader

		'If rdr.HasRows Then
		'	Do While rdr.Read()

		'		Dim item As ListViewItem

		'		item.Text = rdr("au_lname")
		'		item.SubItems.Add(rdr("au_fname"))
		'		item.SubItems.Add(rdr("zip"))

		'		lvMovies.Items.Add(item)

		'	Loop
		'Else
		'	MsgBox("no records")
		'End If
		'con.Open()
		'Dim dr As SqlClient.SqlDataReader
		'dr = cmd.ExecuteReader

		'While (dr.Read)
		'	Dim itm As ListViewItem = New ListViewItem(dr(0).ToString)
		'	lvMovies.Items.Add(itm)


		'End While
		'Dim obj As ListViewItem = New ListViewItem(,)
		'da.Fill(table)
		'lvMovies.DataSource = table
		'lvMovies.DataBind()
	End Sub
	Protected Sub lvMovies_PagePropertiesChanging(sender As Object, e As PagePropertiesChangingEventArgs)
		TryCast(lvMovies.FindControl("DataPager1"), DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, False)
		TextBox1_TextChanged(TextBox1, Nothing)
		lblmsg.Text = ""
	End Sub

	Protected Sub ddlCategory_TextChanged(sender As Object, e As EventArgs)
		TextBox1_TextChanged(TextBox1, Nothing)
	End Sub
End Class