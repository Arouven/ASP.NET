Public Class Task5
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Protected Sub DropDownListPages_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownListPages.SelectedIndexChanged
		Dim toRedirect As String = DropDownListPages.SelectedValue
		Response.Redirect("~/" & toRedirect & ".aspx")
	End Sub
End Class