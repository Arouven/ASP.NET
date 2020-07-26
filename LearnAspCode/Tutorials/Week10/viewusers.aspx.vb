Imports System.Data.SqlClient

Public Class viewusers
	Inherits System.Web.UI.Page

	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If (Not IsNothing(Session("adminuname"))) Then
			Response.Redirect("~/Tutorials/Week5/login.aspx")
		End If

		Dim sqlCon As New SqlConnection(_conString)
		Dim cmd1 As New SqlCommand()
		cmd1.CommandType = CommandType.Text
		cmd1.CommandText = "SELECT * FROM tblUser;"
		cmd1.Connection = sqlCon
		Dim da1 As New SqlDataAdapter(cmd1)
		' Return DataSet
		Dim dstuser As New DataSet()
		da1.Fill(dstuser)
		dlstuser.DataSource = dstuser
		dlstuser.DataBind()
		Dim qs As Integer
		'To retrieve ID token from URL and convert to Integer
		qs = Convert.ToInt32(Request.QueryString("ID"))
		'Create another DataAdapter and bind results to the second DataList
		'add SELECT statement to search user details using above QueryString
		Dim cmd2 As New SqlCommand
		cmd2.CommandText = CommandType.Text
		cmd2.CommandText = "SELECT * FROM tblUser where User_id=" & qs & ";"
		cmd2.Connection = sqlCon
		Dim da2 As New SqlDataAdapter(cmd2)
		Dim dstuserdetails As New DataSet()
		da2.Fill(dstuserdetails)
		dlstuserdetails.DataSource = dstuserdetails
		dlstuserdetails.DataBind()
	End Sub

End Class