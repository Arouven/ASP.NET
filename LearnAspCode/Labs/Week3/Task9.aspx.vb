Public Class Task9
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		TextBox1.Visible = False
		If RadioButtonList1.SelectedValue = Nothing Then
			Dim plangs() As String = {"Python", "Ruby on Rails", "Other Language"}
			For Each plang In plangs
				RadioButtonList1.Items.Add(plang)
			Next
		Else
		End If
	End Sub

	Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
		If RadioButtonList1.SelectedIndex = 2 Then
			TextBox1.Visible = True
		Else
			TextBox1.Visible = False
		End If
	End Sub

	Protected Sub RadioButtonList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioButtonList1.SelectedIndexChanged

	End Sub
End Class
