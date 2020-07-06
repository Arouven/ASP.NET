Public Class VerifyingStateOfACheckBoxControl
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)
		lblResult.Text = chkNewsletter.Checked.ToString()
	End Sub

End Class