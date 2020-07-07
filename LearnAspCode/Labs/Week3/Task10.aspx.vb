Public Class Task10
	Inherits System.Web.UI.Page

	'Private cb As New List(Of String)
	'Private lb As New List(Of String)

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Private Sub Button1_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
		For Each itm In CheckBoxList1.Items
			If itm.selected Then
				ListBox1.Items.Add(itm.value)
			End If
		Next
		For Each itm In ListBox1.Items
			CheckBoxList1.Items.Remove(itm)
		Next
		ListBox1.ClearSelection()
		CheckBoxList1.ClearSelection()
	End Sub

	Private Sub Button2_Click(sender As Object, e As EventArgs) Handles btnRemove.Click
		For Each itm In ListBox1.Items
			If itm.selected Then
				CheckBoxList1.Items.Add(itm.value)
			End If
		Next
		For Each itm In CheckBoxList1.Items
			ListBox1.Items.Remove(itm)
		Next
		ListBox1.ClearSelection()
		CheckBoxList1.ClearSelection()
	End Sub


End Class