'Imports System
'Imports System.Web
'Imports System.Data
'Imports System.Data.SqlClient
'Imports System.Web.Configuration
'Imports System.Configuration
'Imports System.Text
'Imports System.IO
'Imports System.Security.Cryptography
'Imports System.Net.Mail
'Public Class updateprofile
'	Inherits System.Web.UI.Page

'	Private ReadOnly _conString As String
'	Public Sub New()
'		_conString = WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
'	End Sub
'	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
'		'checks whether the session variable has been created
'		'from the login page and if null redirect to login page
'		'else grant access to the page and display user profile
'		If ( ) Then
'			Response.Redirect("login.aspx")
'		Else
'			If (Not Page.IsPostBack) Then
'				Dim con As New SqlConnection(_conString)
'				Dim cmd As New SqlCommand()
'				cmd.Connection = con
'				cmd.CommandType = CommandType.Text
'				'To replace the txtusername.Text by the session variable
'				cmd.CommandText = "SELECT * FROM tbluser WHERE username='" + txtusername.Text + "'"
'				con.Open()
'				Dim dr As SqlDataReader
'				dr = cmd.ExecuteReader()
'				While (dr.Read())
'					'retrieve the values using the reader(“fieldname”) and
'					'store in corresponding Textboxes

'					txtFname.Text =
'txtLname.Text =
'txtEmail.Text =
'End While
'				dr.Close()
'				'create a dataadapter
'				'create a datatable
'				'populate the datatable
'				'bind the datatable to the repeater control
'				con.Close()
'			End If
'		End If
'	End Sub

'	Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
'		Dim updateSQL As String
'		'To replace the txtusername.text by the session variable
'		updateSQL = "UPDATE tblUser SET firstname=@fname, lastname=@lname, email=@email WHERE username='" + txtusername.Text + "'"
'		Dim con As New SqlConnection(_conString)
'		Dim cmd As New SqlCommand()
'		cmd.Connection = con
'		cmd.CommandText = updateSQL
'		' Add the parameters
'		cmd.Parameters.AddWithValue()
'		cmd.Parameters.AddWithValue()
'		cmd.Parameters.AddWithValue()
'		Dim updated As Integer = 0
'		'Add a “try – catch” block to handle any exceptions thrown during
'		'program execution and displays the error Message if any
'		con.Open()
'		updated = cmd.ExecuteNonQuery()
'		lblmsg.Text = updated.ToString() + " record updated."
'		lblmsg.Text = "Error updating. "
'		con.Close()
'	End Sub
'End Class