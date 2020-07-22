Public Class Task7
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim currenthour As Integer = DateTime.Now.Hour
		If currenthour >= 0 And currenthour <= 12 Then
			HyperLink1.Text = "Visit Morning Session"
		ElseIf currenthour > 12 And currenthour <= 23 Then
			HyperLink1.Text = "Visit Afternoon Session"
		End If
	End Sub
End Class