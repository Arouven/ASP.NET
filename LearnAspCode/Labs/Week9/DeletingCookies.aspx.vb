Public Class DeletingCookies
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub
	Sub btnDelete_Click(ByVal sender As Object, ByVal e As EventArgs)
		Response.Cookies(txtCookieName.Text).Expires = DateTime.Now.AddDays(-1)
	End Sub
End Class