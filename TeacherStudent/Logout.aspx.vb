Public Class Logout
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Session.Abandon()
		Session.Clear()
		Response.Redirect("Home")
	End Sub

End Class