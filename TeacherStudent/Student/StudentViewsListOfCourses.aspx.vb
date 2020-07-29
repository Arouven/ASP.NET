Public Class StudentViewsListOfCourses
	Inherits System.Web.UI.Page


	Private ReadOnly conn As String = ConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ToString

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'If (Not IsNothing(Session("adminuname"))) Then
		'	Response.Redirect("~/Tutorials/Week5/login.aspx")
		'End If

		If Not IsPostBack Then
			BindCategoryData()
		End If
	End Sub
	Private Sub BindCategoryData()
		Dim sqlCon As New SqlClient.SqlConnection(conn)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.CommandType = CommandType.Text
		cmd.CommandText = "SELECT * FROM CourseTable;"
		cmd.Connection = sqlCon
		Dim da As New SqlClient.SqlDataAdapter(cmd)
		'Create a DataTable
		Dim dt As New DataTable
		Using (da)
			'Populate the DataTable
			da.Fill(dt)
		End Using
		'Set the DataTable as the DataSource
		gvCatNames.DataSource = dt
		gvCatNames.DataBind()
	End Sub
End Class








