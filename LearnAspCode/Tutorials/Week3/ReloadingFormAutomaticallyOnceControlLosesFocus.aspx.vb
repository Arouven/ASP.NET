Public Class ReloadingFormAutomaticallyOnceControlLosesFocus
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Sub txtSearch_TextChanged(ByVal sender As Object, ByVal e As EventArgs)
		lblSearchResults.Text = "Search for: " & txtSearch.Text
	End Sub

End Class