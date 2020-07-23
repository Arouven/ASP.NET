Public Class CreatingANewCookie
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub
	Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs)
		Response.Cookies("message").Value = txtCookieValue.Text
	End Sub
End Class