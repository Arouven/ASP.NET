Public Class StudentViewsListOfCourses
	Inherits System.Web.UI.Page
	Private StudentId As Integer
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsNothing(Session("StudentId")) Then
			StudentId = Session("StudentId")
			If Not IsPostBack Then
				BindCategoryData()
			End If
		Else Response.Redirect("~/Student/StudentLogin.aspx")

			HiddenFieldStudentId.Value = StudentId
		End If


	End Sub
	Private Sub BindCategoryData()
		Dim sqlCon As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "
SELECT TutorTable.UserName as username,
CourseTable.Courseid as courseid,CourseTable.CourseName as coursename,CourseTable.DateSchedule as dateschedule
FROM CourseTable
inner join TutorTable on CourseTable.TutorId= TutorTable.TutorId
"

		cmd.Connection = sqlCon
		Dim da As New SqlClient.SqlDataAdapter(cmd)
		'Create a DataTable
		Dim dt As New DataTable
		Using (da)
			'Populate the DataTable
			da.Fill(dt)
		End Using
		'Set the DataTable as the DataSource
		gvs.DataSource = dt
		gvs.DataBind()
		'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "stats", "mystatus();", True)
	End Sub
	Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
		If (gvs.Rows.Count > 0) Then
			gvs.UseAccessibleHeader = True
			gvs.HeaderRow.TableSection = TableRowSection.TableHeader
		End If
	End Sub
	Private Function DoesSubscribe(courseId)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT * FROM StudentCourseAssociativeTable WHERE Subscribe=1 and StudentId=@StudentId and CourseId=@CourseId "
		cmd.Parameters.AddWithValue("@StudentId", StudentId)
		cmd.Parameters.AddWithValue("@CourseId", courseId)
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		If (reader.HasRows) Then : Return True
		Else : Return False
		End If
		reader.Close()
		con.Close()
	End Function
	Private Function Tutormail(courseId As Integer) As String
		Dim con2 As New SqlClient.SqlConnection(_conString)
		Dim cmd2 As New SqlClient.SqlCommand()
		Dim mail As String = ""
		cmd2.Connection = con2
		cmd2.CommandType = CommandType.Text
		cmd2.CommandText = "SELECT TutorTable.Email FROM TutorTable inner join CourseTable on TutorTable.Tutorid=CourseTable.Tutorid WHERE CourseId=@CourseId "
		Dim cId As Integer = Convert.ToInt32(courseId)
		cmd2.Parameters.AddWithValue("@CourseId", cId)
		Dim reader As SqlClient.SqlDataReader
		con2.Open()
		reader = cmd2.ExecuteReader()
		While reader.Read
			mail = reader("Email").ToString
		End While

		reader.Close()
		con2.Close()
		Return mail
	End Function
	Private Function courseName(courseId)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		Dim cname As String = ""
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT coursename FROM courseTable WHERE CourseId=@CourseId "
		cmd.Parameters.AddWithValue("@CourseId", courseId)
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		While reader.Read
			cname = reader("coursename")
		End While

		reader.Close()
		con.Close()
		Return cname
	End Function
	Protected Sub btnSubscribe_Click(sender As Object, e As EventArgs)
		Dim btn As LinkButton = CType(sender, LinkButton)
		Dim courseid As Integer = btn.CommandArgument
		Dim cName As String = courseName(courseid)
		Dim tEMail As String = Tutormail(courseid).ToString
		If Not DoesSubscribe(courseid) Then
			Dim studentName As String = Session("StudentUsername")
			sendMail(ClassSendMail.email, ClassSendMail.pass, tEMail, studentName, cName, ClassSendMail.tutorViewStudentUrl)
			Dim con As New SqlClient.SqlConnection(_conString)
			Dim cmd As New SqlClient.SqlCommand()
			cmd.Connection = con
			con.Open()
			cmd.CommandType = CommandType.Text
			cmd.CommandText = "insert into StudentCourseAssociativeTable(StudentId,CourseId,Subscribe,Pending,Accepted) values (@StudentId,@CourseId,1,1,0);"
			cmd.Parameters.AddWithValue("@StudentId", StudentId)
			cmd.Parameters.AddWithValue("@CourseId", courseid)
			cmd.ExecuteNonQuery()
			con.Close()
			Response.Redirect(Request.RawUrl)
		End If


	End Sub
	Private Sub sendMail(sentFrom As String, senderMailPassword As String, sendTo As String, studentName As String, courseName As String, tutorViewStudentUrl As String)

		Dim msg As New Net.Mail.MailMessage()
		Dim sc As New Net.Mail.SmtpClient()
		Try
			msg.From = New Net.Mail.MailAddress(sentFrom)
			msg.To.Add(sendTo)
			msg.Subject = "New Student"
			msg.IsBodyHtml = True
			Dim msgBody As New StringBuilder()
			msgBody.Append("Dear Tutor, " + studentName + " Want to subscribe to your course: " + courseName)
			msgBody.Append("<a href='" + tutorViewStudentUrl + "'>Click here to view your Students.</a>")
			msg.Body = msgBody.ToString()
			sc.Host = "smtp.gmail.com"
			sc.Port = 587
			sc.UseDefaultCredentials = False
			sc.Credentials = New Net.NetworkCredential(sentFrom, senderMailPassword)
			sc.EnableSsl = True
			sc.Send(msg)
			Response.Write("Email Sent successfully")
		Catch ex As Exception
			Response.Write(ex.Message)
		End Try
	End Sub
	Protected Sub btnDescription_Click(sender As Object, e As EventArgs)
		Dim courseid As Integer = Convert.ToInt32(CType(sender, LinkButton).CommandArgument)
		Response.Redirect("~/Student/ViewCourseDetails.aspx?id=" & courseid)
	End Sub
End Class








