Public Class AdminHome
  Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
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
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsNothing(Session("AdminId")) Then
			LabelWelcome.Text = "Welcome " & Session("AdminUsername") & " you are logged in as admin"


			LabelUnfreezeStudent.Text = NumberInTable("HouseKeeperTable", True, False)
			LabelFreezeStudent.Text = NumberInTable("HouseKeeperTable", True, True)
			LabelNoStudents.Text = (Convert.ToInt32(LabelUnfreezeStudent.Text) + Convert.ToInt32(LabelFreezeStudent.Text)).ToString
			LabelTotalStudent.Text = LabelNoStudents.Text

			LabelUnfreezeTutor.Text = NumberInTable("HouseOwnerTable", True, False)
			LabelFreezeTutor.Text = NumberInTable("HouseOwnerTable", True, True)
			LabelNoTutors.Text = (Convert.ToInt32(LabelUnfreezeTutor.Text) + Convert.ToInt32(LabelFreezeTutor.Text)).ToString
			LabelTotalTutor.Text = LabelNoTutors.Text

			LabelnoCourses.Text = NumberInTable("JobTable", False, Nothing)
			LabelTotalCourse.Text = (Convert.ToInt32(LabelnoCourses.Text)).ToString

			LabelTotalCategory.Text = NumberInTable("CategoryTable", False, Nothing)

			LabelTotalMaterial.Text = NumberInTable("LocationTable", False, Nothing)
		Else Response.Redirect("~/Admin/AdminLogin.aspx")
		End If

	End Sub

End Class