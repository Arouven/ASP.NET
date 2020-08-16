
Imports System.Linq
Imports System.Data

Public Class ViewTutors1
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Private Sub FillListView(myList As ListView)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT TutorTable.TutorId, TutorTable.UserName, TutorTable.ProfilePictureUrl, certificationTable.certificationname FROM TutorTable inner join CertificationTable on CertificationTable.TutorId=TutorTable.TutorId;"

		'Create DataAdapter
		Dim myDataAdapter As New SqlClient.SqlDataAdapter(cmd)
		'Create DataSet
		Dim myDataSet As New DataSet()
		Using (myDataAdapter)
			myDataAdapter.Fill(myDataSet)
		End Using
		myList.DataSource = myDataSet
		myList.DataBind()
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Label1.Text = DateTime.Now.ToString()
		FillListView(lvMovies)
		If (Not Page.IsPostBack) Then
			'LoadCategory()
			TextBox1_TextChanged(TextBox1, Nothing)
		End If

	End Sub

	Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs)
		'Dim CatIDs As String = ddlCategory.SelectedValue
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim sqlParam As String = ""
		Dim sqlParamCat As String = ""
		If (Not IsNothing(TextBox1.Text.Trim())) Then
			sqlParam = "UserName LIKE '%' + @UserName + '%'"
		End If

		cmd.CommandText = "select * From TutorTable where " + sqlParam
		con.Open()
		Dim rdr As SqlClient.SqlDataReader = cmd.ExecuteReader

	End Sub
	Protected Sub lvMovies_PagePropertiesChanging(sender As Object, e As PagePropertiesChangingEventArgs)
		TryCast(lvMovies.FindControl("DataPager1"), DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, False)
		TextBox1_TextChanged(TextBox1, Nothing)
		lblmsg.Text = ""
	End Sub

	Protected Sub ddlCategory_TextChanged(sender As Object, e As EventArgs)
		TextBox1_TextChanged(TextBox1, Nothing)
	End Sub
End Class