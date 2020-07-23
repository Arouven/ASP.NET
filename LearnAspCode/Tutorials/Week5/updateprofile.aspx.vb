Imports System
Imports System.Web
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Configuration
Imports System.Text
Imports System.IO
Imports System.Security.Cryptography
Imports System.Net.Mail
Public Class updateprofile
	Inherits System.Web.UI.Page

	Private ReadOnly _conString As String
	Public Sub New()
		_conString = WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'checks whether the session variable has been created
		'from the login page and if null redirect to login page
		'else grant access to the page and display user profile
		If IsNothing(Session("username")) Then
			Response.Redirect("login.aspx")
		Else
			If (Not Page.IsPostBack) Then
				Dim con As New SqlConnection(_conString)
				Dim cmd As New SqlCommand()
				cmd.Connection = con
				cmd.CommandType = CommandType.Text
				'To replace the txtusername.Text by the session variable
				cmd.CommandText = "SELECT * FROM tbluser WHERE username='" + Session("username") + "';"
				con.Open()
				Dim dr As SqlDataReader
				dr = cmd.ExecuteReader()
				While (dr.Read())
					'retrieve the values using the reader(“fieldname”) and
					'store in corresponding Textboxes
					txtFname.Text = dr("firstname")
					txtLname.Text = dr("lastname")
					txtEmail.Text = dr("email")
				End While
				dr.Close()
				'create a dataadapter
				Dim da As New SqlDataAdapter(cmd)
				'create a datatable
				Dim dt As New DataTable()
				'populate the datatable
				da.Fill(dt)
				'bind the datatable to the repeater control
				rptimg.DataSource = dt
				rptimg.DataBind()
				con.Close()
			End If
		End If
	End Sub

	Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
		Dim updateSQL As String
		'To replace the txtusername.text by the session variable
		updateSQL = "UPDATE tblUser SET firstname=@fname, lastname=@lname, email=@email WHERE username='" + Session("username") + "';"
		Dim con As New SqlConnection(_conString)
		Dim cmd As New SqlCommand()
		cmd.Connection = con
		cmd.CommandText = updateSQL
		' Add the parameters
		cmd.Parameters.AddWithValue("@fname", txtFname.Text)
		cmd.Parameters.AddWithValue("@lname", txtLname.Text)
		cmd.Parameters.AddWithValue("@email", txtEmail.Text)
		Dim updated As Integer = 0
		'Add a “try – catch” block to handle any exceptions thrown during
		'program execution and displays the error Message if any
		Try
			con.Open()
			updated = cmd.ExecuteNonQuery()
			lblmsg.Text = updated.ToString() + " record updated."
		Catch ex As Exception
			lblmsg.Text = "Error updating. " & ex.Message
		End Try
		con.Close()
	End Sub
End Class