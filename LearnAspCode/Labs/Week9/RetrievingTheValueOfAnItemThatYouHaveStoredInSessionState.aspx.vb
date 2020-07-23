Public Class RetrievingTheValueOfAnItemThatYouHaveStoredInSessionState
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		lblMessage.Text = Session("message").ToString()
	End Sub

End Class