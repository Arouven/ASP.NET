Public Class Task6
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Protected Sub RadioButtonList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioButtonList1.TextChanged
		Label1.Text = "You selected: " + RadioButtonList1.SelectedItem.Text
	End Sub
End Class