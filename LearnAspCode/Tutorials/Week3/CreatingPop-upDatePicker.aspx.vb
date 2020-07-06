Public Class CreatingPop_upDatePicker
	Inherits System.Web.UI.Page


	Sub calEventDate_SelectionChanged(ByVal sender As Object, ByVal e As EventArgs)
		txtEventDate.Text = calEventDate.SelectedDate.ToString("d")
	End Sub
	Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)
		lblResult.Text = "You picked: " & txtEventDate.Text
	End Sub
End Class