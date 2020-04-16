Public Class Task10
	Inherits System.Web.UI.Page

	Public itemsl As New List(Of ListItem)()

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		ListBox1.Visible = False
	End Sub

	Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
		For Each list In CheckBoxList1.Items
			If list.selected = True Then
				ListBox1.Items.Add(list)
				ListBox1.Visible = True
			End If
		Next
		For Each item In itemsl
			Console.WriteLine(item)
		Next
		CheckBoxList1.ClearSelection()
	End Sub

	Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
		For Each item As ListItem In ListBox1.Items
			If item.Selected Then
				itemsl.Add(item)
			End If
		Next
		For Each item As ListItem In itemsl
			ListBox1.Items.Remove(item)
		Next

		If ListBox1.Items.Count = 0 Then
			ListBox1.Visible = False
		Else
			ListBox1.Visible = True
		End If
	End Sub

End Class