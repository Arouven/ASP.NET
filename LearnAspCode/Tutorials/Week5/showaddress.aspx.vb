Public Class showaddress
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub


	Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
		ltlResults.Text = ucBillingAddr.Street
		ltlResults.Text = ucShippingAddr.Street
	End Sub
End Class