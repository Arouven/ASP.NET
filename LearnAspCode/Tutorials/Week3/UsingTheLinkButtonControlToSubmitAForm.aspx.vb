Public Class UsingTheLinkButtonControlToSubmitAForm
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Sub lnkSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)
		lblResults.Text = "First Name: " & txtFirstName.Text
		lblResults.Text &= "<br />Last Name: " & txtLastName.Text
	End Sub

End Class