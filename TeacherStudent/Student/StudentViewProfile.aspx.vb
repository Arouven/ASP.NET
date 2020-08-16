Public Class StudentViewProfile
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub

	Dim StudentId As Integer

	Private Sub showCourseDetails()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select * from StudentTable where StudentId=@StudentId;"
		cmd.Parameters.AddWithValue("@StudentId", StudentId)
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		If reader.HasRows Then
			While reader.Read
				HiddenFieldTutorId.Value = reader(0)
				LabelTutorFirstName.Text = reader(1)
				LabelTutorLastName.Text = reader(2)
				ImageTutorProfile.ImageUrl = "~/ProfilePictures/" & reader(3)
				LabelAddress.Text = reader(4)
				LabelDOB.Text = reader(5)
				LabelPhone.Text = reader(6)
				LabelEmail.Text = reader(7)
				LabelTutorUserName.Text = reader(8)
				LabelTutorName.Text = reader(8)
			End While
		End If
		reader.Close()
		con.Close()
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsNothing(Session("StudentId")) Then
			StudentId = Session("StudentId")
		Else Response.Redirect("~/Student/StudentLogin.aspx")
		End If
		If Not IsPostBack Then
			showCourseDetails()
		End If

	End Sub


	Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
		Response.Redirect("~/Student/StudentUpdatesprofile")
	End Sub


End Class