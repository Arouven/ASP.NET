Public Class WebForm1
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(sender As Object, e As EventArgs)
		'ddl0.Items.Insert(0, New ListItem("Select a material type", -1))
		'ddl0.Items.Add("item 1", 1)
		'ddl0.Items.Add(New ListItem("item 2", 2))
		'ddl0.Items.Add(New ListItem("item 3", 3))
		'ddl0.Items.Add(New ListItem("item 4", 4))
		'ddl0.Items.Add(New ListItem("item 5", 5))
		'ddl0.SelectedIndex = 0
	End Sub

	Protected Sub BtnUpload_Click(ByVal sender As Object, ByVal e As EventArgs)
		'Dim myVal As New List(Of String)
		'Dim counter As Integer = Convert.ToInt32(SendA.Value)
		'For i As Integer = 0 To counter
		'	Dim toSearch As String = "ddl" & i
		'	Dim val As Integer = Convert.ToInt32(Request.Form(toSearch))
		'	If val > 0 Then
		'		myVal.Add(i.ToString)
		'	End If
		'Next
		'For i As Integer = 0 To Request.Files.Count - 1
		'	Dim PostedFile As HttpPostedFile = Request.Files(i)
		'	If PostedFile.ContentLength > 0 Then
		'		Dim toSearch As String = "ddl" & myVal(i)
		'		Dim val As String = Request.Form(toSearch)
		'		Label1.Text += val & ", "
		'		Dim FileName As String = IO.Path.GetFileName(PostedFile.FileName)
		'		PostedFile.SaveAs(Server.MapPath("Files\") + FileName)
		'		Label2.Text += FileName & ", "
		'	End If
		'Next
		'Label3.Text = counter
	End Sub


End Class




'For i As Integer = 0 To Request.Files.Count - 1
'Dim PostedFile As HttpPostedFile = Request.Files(i)
'If PostedFile.ContentLength > 0 Then
'Dim FileName As String = IO.Path.GetFileName(PostedFile.FileName)
'PostedFile.SaveAs(Server.MapPath("Files\") + FileName)
'End If
'Next