Public Class SelectingWeeksAndMonthsWithCalendarControl
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Sub btnSubmit_Click(sender As Object, e As EventArgs)
		bltResults.DataSource = Calendar1.SelectedDates
		bltResults.DataBind()
	End Sub

End Class