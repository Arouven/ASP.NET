Public Class HKHome
  Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Private HKId As Integer
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub
	Private Function TotalCourse()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT count(*) FROM JobTable;"
		con.Open()
		Return cmd.ExecuteScalar()
		con.Close()
	End Function
	Private Function MyTotalCourses()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select count(*) 
from HKJobAssociativeTable 
where  HKId=@HKId;"
		cmd.Parameters.AddWithValue("@HKId", HKId)
		con.Open()
		Return cmd.ExecuteScalar()
		con.Close()
	End Function
	Private Function MyEvents()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT count(*) FROM EventTable;"
		con.Open()
		Return cmd.ExecuteScalar()
		con.Close()
	End Function
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsNothing(Session("HKId")) Then
			HKId = Session("HKId")
			LabelWelcome.Text = "Welcome " & Session("HKUsername") & " you are logged in as HouseKeeper"
			LabelTotalCourse.Text = TotalCourse()
			LabelMyTotalCourses.Text = MyTotalCourses()
			'LabelEvents.Text = MyEvents()
		Else Response.Redirect("~/HouseKeeper/HKLogin.aspx")
		End If

	End Sub

End Class