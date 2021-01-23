Public Class HOViewHKProfile
  Inherits System.Web.UI.Page

	Private HKId As Integer
	Private JobId As Integer

	Protected Sub ButtonAccept_Click(sender As Object, e As EventArgs)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "update HKJobAssociativeTable Set accepted=1,pending=0,Applied=1 where Jobid=@Jobid and HKid=@HKid ;" '
		cmd.Parameters.AddWithValue("@Jobid", JobId)
		cmd.Parameters.AddWithValue("@HKid", HKId)
		con.Open()
		cmd.ExecuteNonQuery()
		con.Close()
		sendStatusMail(ClassSendMail.email, ClassSendMail.pass, LabelEmail.Text, LabelUserName.Text, ClassSendMail.hkViewJob & "?id=" & JobId, True)
		Response.Redirect("~/HouseOwner/HOViewHKInJob?id=" & JobId)
	End Sub

	Protected Sub ButtonRejected_Click(sender As Object, e As EventArgs)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "update HKJobAssociativeTable Set accepted=0,pending=0,Applied=1 where Jobid=@Jobid and HKid=@HKid ;"
		cmd.Parameters.AddWithValue("@Jobid", JobId)
		cmd.Parameters.AddWithValue("@HKid", HKId)
		con.Open()
		cmd.ExecuteNonQuery()
		con.Close()
		sendStatusMail(ClassSendMail.email, ClassSendMail.pass, LabelEmail.Text, LabelUserName.Text, ClassSendMail.hkViewJob & "?id=" & JobId, False)
		Response.Redirect("~/HouseOwner/HOViewHKInJob?id=" & JobId)
	End Sub

	Private ReadOnly _conString As String

	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

		If Not IsNothing(Session("HOId")) Then
			HKId = Convert.ToInt32(Request.QueryString("HKId"))
			JobId = Convert.ToInt32(Request.QueryString("JobId"))
			Me.Title = "Viewing " & showDetails() & " Profile"
		Else Response.Redirect("~/HouseOwner/HOLogin.aspx")
		End If

	End Sub


	Private Function showDetails() As String
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT Freeze, HKid, ProfilePictureUrl, UserName, FirstName, LastName, Address, BirthDate, PhoneNumber, Email FROM HouseKeeperTable where HKId=@HKId;" '
		cmd.Parameters.AddWithValue("@HKId", HKId)
		'Create DataReader
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		Dim username = ""
		If reader.HasRows Then
			While reader.Read
				CheckBoxFreeze.Checked = Convert.ToBoolean(reader(0))
				Image1.ImageUrl = "~/ProfilePictures/" & reader(2)
				username = reader(3)
				LabelUserName.Text = username
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
		Return username
	End Function

	Protected Sub LinkButtonBack_Click(sender As Object, e As EventArgs)
		Response.Redirect("~/HouseOwner/HOViewHKInJob.aspx?id=" & JobId)
	End Sub

	Private Sub sendStatusMail(sentFrom As String, senderMailPassword As String, sendTo As String, username As String, clickHereUrl As String, Accepted As Boolean)
		Dim msg As New Net.Mail.MailMessage()
		Dim sc As New Net.Mail.SmtpClient()
		Dim m1 As String = ""
		If Accepted Then
			m1 = "Dear " + username + ", HouseOwner has accepted your application, thank you for staying on MoCoolMaid."
		Else
			m1 = "Dear " + username + ", Unfortunately HouseOwner has rejected your application, Good Luck for your other application(s)!, thank you for staying on MoCoolMaid."
		End If
		Try
			msg.From = New Net.Mail.MailAddress(sentFrom)
			msg.To.Add(sendTo)
			msg.Subject = "Status Changed!"
			msg.IsBodyHtml = True
			Dim msgBody As New StringBuilder()
			msgBody.Append(m1)
			msgBody.Append("<a href='" & clickHereUrl & "'>Click here to view job</a>")
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

End Class