Public Class AdminViewsListOfHOHK
  Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

		If Not IsNothing(Session("AdminId")) Then

			FillDataList(DataListStudentUnfreeze, "HouseKeeperTable", False)
			FillDataList(DataListTutorUnfreeze, "HouseOwnerTable", False)
			FillDataList(DataListStudentFreeze, "HouseKeeperTable", True)
			FillDataList(DataListTutorFreeze, "HouseOwnerTable", True)


			LabelTotalStudentUnfreeze.Text = "Number of HK not freeze In Database: " & NumberInTable("HouseKeeperTable", True, False)
			LabelTotalTutorUnfreeze.Text = "Number of HO not freeze In Database: " & NumberInTable("HouseOwnerTable", True, False)
			LabelTotalStudentFreeze.Text = "Number of HK freeze In Database: " & NumberInTable("HouseKeeperTable", True, True)
			LabelTotalTutorFreeze.Text = "Number of HO freeze In Database: " & NumberInTable("HouseOwnerTable", True, True)


			LabelNoStudents.Text = "Number of HK not freeze In Database: " & (NumberInTable("HouseKeeperTable", True, False) + NumberInTable("HouseKeeperTable", True, True))
			LabelNoCourses.Text = "Number of Job In Database: " & NumberInTable("JobTable", False, Nothing)


		Else Response.Redirect("~/Admin/AdminLogin.aspx")
		End If

	End Sub



	Private Sub FillDataList(myDataList As DataList, tableName As String, freeze As Boolean)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim id As String = ""
		If tableName = "HouseKeeperTable" Then
			id = "HKId"
		ElseIf tableName = "HouseOwnerTable" Then
			id = "HOId"
		End If
		Dim sqlFreeze As String = ""
		If freeze Then : sqlFreeze = " where Freeze = 1"
		ElseIf Not freeze Then : sqlFreeze = " where Freeze = 0"
		End If
		cmd.CommandText = "SELECT " + id + ", UserName, ProfilePictureUrl FROM " + tableName + sqlFreeze + ";"

		'Create DataAdapter
		Dim myDataAdapter As New SqlClient.SqlDataAdapter(cmd)
		'Create DataSet
		Dim myDataSet As New DataSet()
		Using (myDataAdapter)
			myDataAdapter.Fill(myDataSet)
		End Using
		myDataList.DataSource = myDataSet
		myDataList.DataBind()
	End Sub
	Private Function NumberInTable(tableName As String, tableContainFreeze As Boolean, freeze As Boolean)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim sqlFreeze As String = ""
		If tableContainFreeze Then
			If freeze Then : sqlFreeze = " where Freeze = 1"
			ElseIf Not freeze Then : sqlFreeze = " where Freeze = 0"
			End If
		ElseIf Not tableContainFreeze Then
			sqlFreeze = ""
		End If
		cmd.CommandText = "SELECT count(*) FROM " + tableName + sqlFreeze + ";"
		con.Open()
		Return cmd.ExecuteScalar()
		con.Close()
	End Function

End Class