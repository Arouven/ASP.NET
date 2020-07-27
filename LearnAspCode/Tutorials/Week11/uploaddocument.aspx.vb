Imports System.Data.SqlClient
Imports System.IO
Public Class uploaddocument
	Inherits System.Web.UI.Page

	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("MoviesCS").ConnectionString
	End Sub
	Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
		'redirect user to login if session does not exist
		If (IsNothing(Session("username"))) Then
			Response.Redirect("~/Tutorials/Weeks5/login.aspx")
		End If
	End Sub

	Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
		'check if file upload contains a file
		If (upDoc.HasFile) Then
			'add the filename as an argument
			If (CheckFileType(upDoc.FileName)) Then
				'Add a folder bearing the Session name in the path below
				Dim customfolder As String = "~/files/" + Session("username") + "/docs/"
				Dim folderPath As String = Server.MapPath(customfolder)
				'create above directory by using
				'Directory.CreateDirectory() method
				Directory.CreateDirectory(folderPath)
				'Upload file in filesystem by concatenating the folderpath
				'with the filename
				upDoc.SaveAs(folderPath & upDoc.FileName)
				Dim con As New SqlConnection(_conString)
				Dim cmd As New SqlCommand()
				cmd.Connection = con
				cmd.CommandType = CommandType.Text
				'search database to see if the given filename already exist
				cmd.CommandText = " SELECT f_name FROM tbldocs WHERE f_name=@fn "
				cmd.Parameters.AddWithValue("@fn", txtfilename.Text)
				Dim reader As SqlDataReader
				con.Open()
				reader = cmd.ExecuteReader()
				If (reader.HasRows) Then
					lblmsg.Text = "Choose Another Filename"
					lblmsg.ForeColor = System.Drawing.Color.Red
				Else
					reader.Close()
					Dim ccmd As New SqlCommand()
					ccmd.Connection = con
					'Create another parameter to insert the User_Id Foreign key to
					'know which user uploaded the file
					ccmd.CommandType = CommandType.Text
					ccmd.CommandText = "INSERT INTO tbldocs (f_name, f_path, user_id) VALUES (@name, @fp, @uid)"
					ccmd.Parameters.AddWithValue("@name", txtfilename.Text)
					ccmd.Parameters.AddWithValue("@fp", customfolder + upDoc.FileName)
					ccmd.Parameters.AddWithValue("@uid", Session("userid"))
					'Create a parameter for the user_id using the
					'Session variable created in the login form
					ccmd.ExecuteNonQuery()
					con.Close()
					lblmsg.Text = "File has been successfully uploaded!"
				End If
			End If
		End If
	End Sub
	Function CheckFileType(ByVal fileName As String) As Boolean
		Dim ext As String = Path.GetExtension(fileName)
		Select Case ext.ToLower()
			Case ".doc"
				Return True
			Case ".docx"
				Return True
			Case ".pdf"
				Return True
			Case ".pptx"
				Return True
			Case Else
				Return False
		End Select
	End Function
End Class