Public Class UpdateCourse
	Inherits System.Web.UI.Page

	Private ReadOnly _conString As String

	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	'Private Sub showDetails(userTitle As Label)
	'	Dim con As New SqlClient.SqlConnection(_conString)
	'	Dim cmd As New SqlClient.SqlCommand()
	'	cmd.Connection = con
	'	cmd.CommandType = CommandType.Text
	'	Dim requestId As Integer = Convert.ToInt32(Request.QueryString("id")) 'courseid

	'	cmd.CommandText = "SELECT Freeze, " & tableId & ", ProfilePictureUrl, UserName, FirstName, LastName, Address, BirthDate, PhoneNumber, Email FROM " & tableName & " where " & tableId & "=@requestId;" '
	'	cmd.Parameters.AddWithValue("@requestId", requestId)
	'	'Create DataReader
	'	Dim reader As SqlClient.SqlDataReader
	'	con.Open()
	'	reader = cmd.ExecuteReader()
	'	If reader.HasRows Then
	'		While reader.Read
	'			CheckBoxFreeze.Checked = Convert.ToBoolean(reader(0))
	'			If Convert.ToBoolean(reader(0)) Then : LinkButtonUpdate.Text = "Unfreeze"
	'			Else : LinkButtonUpdate.Text = "Freeze"
	'			End If
	'			Image1.ImageUrl = "~/ProfilePictures/" & reader(2)
	'			LabelUserName.Text = reader(3)
	'			LabelFirstName.Text = reader(4)
	'			LabelLastName.Text = reader(5)
	'			LabelAddress.Text = reader(6)
	'			LabelBirthDate.Text = String.Format("{0:dd/MM/yyyy} (DD/MM/YYYY)", reader(7))
	'			LabelPhoneNumber.Text = reader(8)
	'			LabelEmail.Text = reader(9)
	'		End While
	'	End If
	'	reader.Close()
	'	con.Close()
	'End Sub

	Private Sub LoginRequired(mySession)
		If Not IsNothing(mySession) Then 'there is something
		Else : Response.Redirect("~/LoginRequired")
		End If
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'LoginRequired(mySession)
	End Sub

End Class