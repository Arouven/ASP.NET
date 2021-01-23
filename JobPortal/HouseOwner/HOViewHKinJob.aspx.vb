Public Class HOViewHKinJob
  Inherits System.Web.UI.Page
	Private JobId As Integer
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub

	'	Private Sub FillDataList(myDataList As DataList)
	'		Dim con As New SqlClient.SqlConnection(_conString)
	'		Dim cmd As New SqlClient.SqlCommand()
	'		cmd.Connection = con
	'		cmd.CommandType = CommandType.Text

	'		cmd.CommandText = "select StudentTable.StudentId,StudentTable.FirstName,StudentTable.LastName,StudentTable.ProfilePictureUrl,StudentTable.Address,StudentTable.PhoneNumber,StudentTable.Email,StudentTable.Username,StudentTable.Freeze,
	'StudentCourseAssociativeTable.StudentCourseId,StudentCourseAssociativeTable.Subscribe,StudentCourseAssociativeTable.Pending
	'from StudentTable
	'Inner join StudentCourseAssociativeTable On StudentCourseAssociativeTable.StudentId = StudentTable.Studentid
	'where  StudentCourseAssociativeTable.courseId=@courseId;"
	'		cmd.Parameters.AddWithValue("@courseId", JobId)

	'		'Create DataAdapter
	'		Dim myDataAdapter As New SqlClient.SqlDataAdapter(cmd)
	'		'Create DataSet
	'		Dim myDataSet As New DataSet()
	'		Using (myDataAdapter)
	'			myDataAdapter.Fill(myDataSet)
	'		End Using
	'		myDataList.DataSource = myDataSet
	'		myDataList.DataBind()


	'	End Sub
	'	Private Sub LoginRequired(mySession)
	'		If Not IsNothing(mySession) Then
	'		Else Response.Redirect("~/LoginRequired.aspx")
	'		End If
	'	End Sub

	Private Function getCourseName(jobid)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		Dim cname As String = ""
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT Title FROM JobTable WHERE JobId=@JobId;"
		cmd.Parameters.AddWithValue("@JobId", jobid)
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		While reader.Read
			cname = reader("Title")
		End While
		reader.Close()
		con.Close()
		Return cname
	End Function



	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsNothing(Session("HOId")) Then
			JobId = Request.QueryString("id")
			Labelcoursename.Text = getCourseName(JobId)
			''''FillDataList(DataListTutorUnfreeze)
			If Not Page.IsPostBack Then
				Search()
				GetCategory()
			End If
		Else Response.Redirect("~/HouseOwner/HOLogin.aspx")
		End If

	End Sub

	Protected Sub GetCategory()
		ddlCategory.Items.Add(New ListItem("Rejected", "Rejected"))
		ddlCategory.Items.Add(New ListItem("Pending", "Pending"))
		ddlCategory.Items.Add(New ListItem("Accepted", "Accepted"))
		ddlCategory.Items.Insert(0, "Choose ...")
		ddlCategory.SelectedIndex = 0
	End Sub
	Protected Sub Search()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim param1 As String = ""
		Dim param2 As String = ""
		If txtSearch.Text.Trim() <> "" Then
			param1 = "and HouseKeeperTable.Username like '" & txtSearch.Text & "%' "
		Else
			param1 = ""
		End If
		If ddlCategory.SelectedValue = "Rejected" Then
			param2 = " and HKJobAssociativeTable.accepted=0 and HKJobAssociativeTable.Pending=0 and HKJobAssociativeTable.Applied=1 "
		ElseIf ddlCategory.SelectedValue = "Pending" Then
			param2 = " and HKJobAssociativeTable.Pending=1 and HKJobAssociativeTable.Applied=1 "
		ElseIf ddlCategory.SelectedValue = "Accepted" Then
			param2 = " and HKJobAssociativeTable.accepted=1 and  HKJobAssociativeTable.Pending=0 and HKJobAssociativeTable.Applied=1 "
		Else
			param2 = ""
		End If

		Dim sqlcom As String = "select 
HouseKeeperTable.HKId, HouseKeeperTable.FirstName, HouseKeeperTable.LastName, HouseKeeperTable.ProfilePictureUrl, HouseKeeperTable.Address, HouseKeeperTable.PhoneNumber, HouseKeeperTable.Email, HouseKeeperTable.Username, HouseKeeperTable.Freeze, 
HKJobAssociativeTable.HKJobId, HKJobAssociativeTable.Applied, HKJobAssociativeTable.accepted, HKJobAssociativeTable.Pending
from HouseKeeperTable
Inner join HKJobAssociativeTable On HKJobAssociativeTable.HKId = HouseKeeperTable.HKid
where  HKJobAssociativeTable.JobId=@JobId " & param1 & param2
		cmd.CommandText = sqlcom
		cmd.Parameters.AddWithValue("@JobId", JobId)
		Dim myDataAdapter As New SqlClient.SqlDataAdapter(cmd)
		Dim myDataSet As New DataSet()
		Using (myDataAdapter)
			myDataAdapter.Fill(myDataSet)
		End Using
		Repeater1.DataSource = myDataSet
		Repeater1.DataBind()
	End Sub

	Protected Sub txtSearch_TextChanged(sender As Object, e As EventArgs)
		Search()
	End Sub

	Protected Sub ddlCategory_SelectedIndexChanged(sender As Object, e As EventArgs)
		Search()
	End Sub

	Protected Sub ButtonOpenStudent_Click(sender As Object, e As EventArgs)
		Dim HKId As Integer = Convert.ToInt32(CType(sender, LinkButton).CommandArgument)
		Response.Redirect("~/HouseOwner/HOViewHKProfile.aspx?HKId=" & HKId & "&JobId=" & JobId)
	End Sub
End Class