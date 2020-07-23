Public Class CreatingAPersistentCookieToTrackTheNumberOfTimesYouHaveVisitedAPage
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		' Get current value of cookie
		Dim counter As Integer = 0
		If Not IsNothing(Request.Cookies("counter")) Then
			counter = Int32.Parse(Request.Cookies("counter").Value)
		End If
		' Increment counter
		counter = counter + 1
		' Add persistent cookie to browser
		Response.Cookies("counter").Value = counter.ToString()
		Response.Cookies("counter").Expires = DateTime.Now.AddYears(2)
		' Display value of counter cookie
		lblCounter.Text = counter.ToString()
	End Sub

End Class