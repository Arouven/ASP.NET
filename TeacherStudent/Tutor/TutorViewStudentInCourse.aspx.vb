Public Class TutorViewStudentInCourse
	Inherits System.Web.UI.Page
	Private courseid As Integer
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub







	Private Sub FillDataList(myDataList As DataList)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text

		cmd.CommandText = "select StudentTable.StudentId,StudentTable.FirstName,StudentTable.LastName,StudentTable.ProfilePictureUrl,StudentTable.Address,StudentTable.PhoneNumber,StudentTable.Email,StudentTable.Username,StudentTable.Freeze,
StudentCourseAssociativeTable.StudentCourseId,StudentCourseAssociativeTable.Subscribe,StudentCourseAssociativeTable.Pending
from StudentTable
Inner join StudentCourseAssociativeTable On StudentCourseAssociativeTable.StudentId = StudentTable.Studentid
where  StudentCourseAssociativeTable.courseId=@courseId;"
		cmd.Parameters.AddWithValue("@courseId", courseid)

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
	Private Sub LoginRequired(mySession)
		If Not IsNothing(mySession) Then
		Else Response.Redirect("~/LoginRequired.aspx")
		End If
	End Sub





	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		courseid = Request.QueryString("id")
		'FillDataList(DataListTutorUnfreeze)
		If Not Page.IsPostBack Then
			Search()
			GetCategory()
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
			param1 = "and StudentTable.Username like '" & txtSearch.Text & "%' "
		Else
			param1 = ""
		End If


		If ddlCategory.SelectedValue = "Rejected" Then
			param2 = "and StudentCourseAssociativeTable.accepted=0 and StudentCourseAssociativeTable.Pending=0 and StudentCourseAssociativeTable.Subscribe=1 "
		ElseIf ddlCategory.SelectedValue = "Pending" Then
			param2 = "and StudentCourseAssociativeTable.Pending=1 and StudentCourseAssociativeTable.subscribe=1 "
		ElseIf ddlCategory.SelectedValue = "Accepted" Then
			param2 = "and StudentCourseAssociativeTable.accepted=1 and  StudentCourseAssociativeTable.Pending=0 and StudentCourseAssociativeTable.Subscribe=1 "
		Else
			param2 = ""
		End If

		Dim sqlcom As String = "select StudentTable.StudentId,StudentTable.FirstName,StudentTable.LastName,StudentTable.ProfilePictureUrl,StudentTable.Address,StudentTable.PhoneNumber,StudentTable.Email,StudentTable.Username,StudentTable.Freeze,
StudentCourseAssociativeTable.StudentCourseId,StudentCourseAssociativeTable.Subscribe,StudentCourseAssociativeTable.accepted,StudentCourseAssociativeTable.Pending
from StudentTable
Inner join StudentCourseAssociativeTable On StudentCourseAssociativeTable.StudentId = StudentTable.Studentid
where  StudentCourseAssociativeTable.courseId=@courseId " & param1 & param2




		cmd.CommandText = sqlcom
		cmd.Parameters.AddWithValue("@courseId", courseid)

		'Create DataAdapter
		Dim myDataAdapter As New SqlClient.SqlDataAdapter(cmd)
		'Create DataSet
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
		Dim StudentId As Integer = Convert.ToInt32(CType(sender, LinkButton).CommandArgument)
		Response.Redirect("~/Tutor/TutorViewDetailStudent.aspx?StudentId=" & StudentId & "&CourseId=" & courseid)
	End Sub
End Class