Public Class CreatingAMultiValuedCookie
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub
	Sub btnSubmit_Click(ByVal s As Object, ByVal e As EventArgs)
		Response.Cookies("preferences")("firstName") = txtFirstName.Text
		Response.Cookies("preferences")("lastName") = txtLastName.Text
		Response.Cookies("preferences")("favoriteColor") = txtFavoriteColor.Text
		Response.Cookies("preferences").Expires = DateTime.MaxValue
	End Sub
End Class