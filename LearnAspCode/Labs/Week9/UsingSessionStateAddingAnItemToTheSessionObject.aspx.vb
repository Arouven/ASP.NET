Public Class UsingSessionStateAddingAnItemToTheSessionObject
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Session("message") = "Hello World!"
	End Sub

End Class