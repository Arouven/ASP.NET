﻿Public Class HOViewProfile
  Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub

	Dim HOId As Integer

	Private Sub showCourseDetails()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select * from HouseOwnerTable where HOId=@HOId;"
		cmd.Parameters.AddWithValue("@HOId", HOId)
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
	'Private Sub GetMaterialList()
	'	Dim con As New SqlClient.SqlConnection(_conString)
	'	Dim cmd As New SqlClient.SqlCommand()
	'	cmd.Connection = con
	'	con.Open()
	'	cmd.CommandType = CommandType.Text
	'	cmd.CommandText = "select * from certificationTable where Tutorid=@Tutorid;"
	'	cmd.Parameters.AddWithValue("@Tutorid", TutorId)
	'	Dim sqlda As New SqlClient.SqlDataAdapter(cmd)
	'	Dim dt As New DataTable()
	'	sqlda.Fill(dt)
	'	con.Close()
	'	gvs.DataSource = dt
	'	gvs.DataBind()
	'End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Me.Title = Session("HOUsername")
		If Not IsNothing(Session("HOId")) Then
			HOId = Session("HOId")
			If Not IsPostBack Then
				showCourseDetails()
				'GetMaterialList()
			End If
		Else Response.Redirect("~/HouseOwner/HOLogin.aspx")
		End If


	End Sub

	'Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
	'	If (gvs.Rows.Count > 0) Then
	'		gvs.UseAccessibleHeader = True
	'		gvs.HeaderRow.TableSection = TableRowSection.TableHeader
	'	End If
	'End Sub









	'Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
	'	Dim certId As Integer = Convert.ToInt32(CType(sender, LinkButton).CommandArgument)
	'	Dim con As New SqlClient.SqlConnection(_conString)
	'	Dim cmd As New SqlClient.SqlCommand()
	'	cmd.Connection = con
	'	cmd.CommandText = "delete from CertificationTable where CertificationId=@CertificationId;"
	'	cmd.Parameters.AddWithValue("@CertificationId", certId)
	'	con.Open()

	'	cmd.ExecuteNonQuery()

	'	GetMaterialList()
	'	con.Close()
	'End Sub




	Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
		Response.Redirect("~/HouseOwner/HOUpdateprofile")
	End Sub

	'Protected Sub ButtonAddCert_Click(sender As Object, e As EventArgs)
	'	Dim con As New SqlClient.SqlConnection(_conString)
	'	Dim cmd As New SqlClient.SqlCommand()
	'	cmd.Connection = con
	'	cmd.CommandText = "insert into CertificationTable(Tutorid,certificationname) values (@Tutorid,@certificationname);"
	'	cmd.Parameters.AddWithValue("@Tutorid", TutorId)
	'	cmd.Parameters.AddWithValue("@certificationname", TextBoxCert.Text)
	'	con.Open()

	'	cmd.ExecuteNonQuery()

	'	GetMaterialList()
	'	con.Close()
	'End Sub
End Class