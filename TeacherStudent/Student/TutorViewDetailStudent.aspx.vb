Public Class TutorViewDetailStudent
	Inherits System.Web.UI.Page

	Private StudentId As Integer
	Private CourseId As Integer

	Protected Sub ButtonAccept_Click(sender As Object, e As EventArgs)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "update StudentCourseAssociativeTable Set accepted=1,pending=0,subscribe=1 where courseid=@courseid and studentid=@studentid ;" '
		cmd.Parameters.AddWithValue("@courseid", CourseId)
		cmd.Parameters.AddWithValue("@studentid", StudentId)
		con.Open()
		cmd.ExecuteNonQuery()
		con.Close()
		Response.Redirect("~/Tutor/TutorViewStudentInCourse?id=" & CourseId)
	End Sub

	Protected Sub ButtonRejected_Click(sender As Object, e As EventArgs)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "update StudentCourseAssociativeTable Set accepted=0,pending=0,subscribe=1 where courseid=@courseid and studentid=@studentid ;" '
		cmd.Parameters.AddWithValue("@courseid", CourseId)
		cmd.Parameters.AddWithValue("@studentid", StudentId)
		con.Open()
		cmd.ExecuteNonQuery()
		con.Close()
		Response.Redirect("~/Tutor/TutorViewStudentInCourse?id=" & CourseId)
	End Sub

	Private ReadOnly _conString As String

	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

		StudentId = Convert.ToInt32(Request.QueryString("StudentId"))
		CourseId = Convert.ToInt32(Request.QueryString("CourseId"))
		'LoginRequired()
		showDetails()
	End Sub



	Private Sub showDetails()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT Freeze, Studentid, ProfilePictureUrl, UserName, FirstName, LastName, Address, BirthDate, PhoneNumber, Email FROM studenttable where StudentId=@StudentId;" '
		cmd.Parameters.AddWithValue("@StudentId", StudentId)
		'Create DataReader
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		If reader.HasRows Then
			While reader.Read
				CheckBoxFreeze.Checked = Convert.ToBoolean(reader(0))
				Image1.ImageUrl = "~/ProfilePictures/" & reader(2)
				LabelUserName.Text = reader(3)
				LabelTitle.Text = reader(3)
				LabelFirstName.Text = reader(4)
				LabelLastName.Text = reader(5)
				LabelAddress.Text = reader(6)
				LabelBirthDate.Text = String.Format("{0:dd/MM/yyyy} (DD/MM/YYYY)", reader(7))
				LabelPhoneNumber.Text = reader(8)
				LabelEmail.Text = reader(9)
			End While
		End If
		reader.Close()
		con.Close()
	End Sub







End Class