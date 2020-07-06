Public Class DisplayingAClient_sideConfirmationDialogBox
	Inherits System.Web.UI.Page

	Sub btnDelete_Click(sender As Object, e As EventArgs)
		lblResult.Text = "All pages deleted!"
	End Sub

End Class