Public Class HOHome
  Inherits System.Web.UI.Page

	Private ReadOnly _conString As String
	Private HOId As Integer
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
	Private Function MyTotalStudent()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select count(*) 
from HouseKeeperTable
Inner join HKJobAssociativeTable On HKJobAssociativeTable.HKId = HouseKeeperTable.HKid
INNER JOIN JobTable ON JobTable.JobId = HKJobAssociativeTable.JobId
where  JobTable.HOId = @HOId;"
		cmd.Parameters.AddWithValue("@HOId", HOId)
		con.Open()
		Return cmd.ExecuteScalar()
		con.Close()
	End Function
	Private Function MyTotalCourse()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT count(*) FROM JobTable where HOId=@HOId;"
		cmd.Parameters.AddWithValue("@HOId", HOId)
		con.Open()
		Return cmd.ExecuteScalar()
		con.Close()
	End Function

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsNothing(Session("HOId")) Then
			HOId = Session("HOId")
			LabelWelcome.Text = "Welcome " & Session("HOUsername") & " you are logged in as HouseOwner"
			LabelTotalCourse.Text = TotalCourse()
			LabelMyTotalCourses.Text = MyTotalCourse()
			LabelMyTotalStudent.Text = MyTotalStudent()
		Else Response.Redirect("~/HouseOwner/HOLogin.aspx")
		End If

	End Sub

End Class