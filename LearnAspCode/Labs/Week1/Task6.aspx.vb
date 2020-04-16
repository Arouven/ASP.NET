Public Class Task6
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Protected Sub RadioButtonList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioButtonList1.TextChanged
		If RadioButtonList1.SelectedIndex > -1 Then
			Label1.Text = RadioButtonList1.SelectedItem.Text
		End If
	End Sub
End Class