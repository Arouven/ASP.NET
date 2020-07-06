Public Class DisplayingMulti_PartForm
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Sub View3_Activate(ByVal sender As Object, ByVal e As EventArgs)
		lblFirstNameResult.Text = txtFirstName.Text
		lblColorResult.Text = txtColor.Text
	End Sub

End Class