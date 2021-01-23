Public Class HKViewProfile
  Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub

	Dim HKId As Integer

	Private Sub showCourseDetails()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "select * from HouseKeeperTable where HkId=@HKId;"
		cmd.Parameters.AddWithValue("@HKId", HKId)
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
	'	Private Sub getRating()
	'		Dim con As New SqlClient.SqlConnection(_conString)
	'		Dim cmd As New SqlClient.SqlCommand()
	'		cmd.CommandType = CommandType.Text
	'		cmd.Connection = con
	'		cmd.CommandText = "SELECT AVG(cast(NULLIF(HKJobAssociativeTable.Rating, 0) AS BIGINT)) AS Average1 
	'FROM   HKJobAssociativeTable
	'Where HKJobAssociativeTable.HKId = @HKId And HKJobAssociativeTable.Accepted = 1;"
	'		cmd.Parameters.AddWithValue("@HKId", HKId)
	'		con.Open()
	'		Dim count As Integer = Convert.ToInt32(cmd.ExecuteScalar)
	'		LabelRating.Text = count.ToString
	'		con.Close()
	'	End Sub
	Private Sub GetMaterialList()
		Dim con As New SqlClient.SqlConnection(_conString)
			Dim cmd As New SqlClient.SqlCommand()
			cmd.Connection = con
			con.Open()
			cmd.CommandType = CommandType.Text
			cmd.CommandText = "select * from certificationTable where HKid=@HKid;"
			cmd.Parameters.AddWithValue("@HKid", HKId)
			Dim sqlda As New SqlClient.SqlDataAdapter(cmd)
			Dim dt As New DataTable()
			sqlda.Fill(dt)
			con.Close()
			gvs.DataSource = dt
			gvs.DataBind()
  End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsNothing(Session("HKId")) Then
			HKId = Session("HKId")
			If Not IsPostBack Then
				showCourseDetails()
				GetMaterialList()
				'getRating()
			End If
		Else Response.Redirect("~/HouseKeeper/HKLogin.aspx")
		End If


	End Sub

	Protected Sub gvs_PreRender(sender As Object, e As EventArgs)
		If (gvs.Rows.Count > 0) Then
			gvs.UseAccessibleHeader = True
			gvs.HeaderRow.TableSection = TableRowSection.TableHeader
		End If
	End Sub









	Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
		Dim certId As Integer = Convert.ToInt32(CType(sender, LinkButton).CommandArgument)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandText = "delete from CertificationTable where CertificateId=@CertificateId;"
		cmd.Parameters.AddWithValue("@CertificateId", certId)
		con.Open()

		cmd.ExecuteNonQuery()

		GetMaterialList()
		con.Close()
	End Sub




	Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
		Response.Redirect("~/HouseKeeper/HKUpdateprofile")
	End Sub

	Protected Sub ButtonAddCert_Click(sender As Object, e As EventArgs)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandText = "insert into CertificationTable(HKid,certificatename) values (@HKid,@certificatename);"
		cmd.Parameters.AddWithValue("@HKid", HKId)
		cmd.Parameters.AddWithValue("@certificatename", TextBoxCert.Text)
		con.Open()

		cmd.ExecuteNonQuery()

		GetMaterialList()
		con.Close()
	End Sub
End Class