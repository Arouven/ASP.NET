﻿Public Class Home
	Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub
	Private Function NumberInTable(tableName As String, tableContainFreeze As Boolean, freeze As Boolean)
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text
		Dim sqlFreeze As String = ""
		If tableContainFreeze Then
			If freeze Then : sqlFreeze = " where Freeze = 1"
			ElseIf Not freeze Then : sqlFreeze = " where Freeze = 0"
			End If
		ElseIf Not tableContainFreeze Then
			sqlFreeze = ""
		End If
		cmd.CommandText = "SELECT count(*) FROM " + tableName + sqlFreeze + ";"
		con.Open()
		Return cmd.ExecuteScalar()
		con.Close()
	End Function
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		LabelnoCourses.Text = NumberInTable("CourseTable", False, Nothing)
		LabelNoStudents.Text = NumberInTable("StudentTable", True, False) + NumberInTable("StudentTable", True, True)
		LabelNoTutors.Text = NumberInTable("TutorTable", True, False) + NumberInTable("TutorTable", True, True)
	End Sub

End Class