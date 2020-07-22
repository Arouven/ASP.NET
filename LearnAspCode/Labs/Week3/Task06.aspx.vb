Public Class Task61
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Protected Sub shoot_Click(sender As Object, e As ImageMapEventArgs) Handles shoot.Click
		If e.PostBackValue.ToString().Contains("Miss") Then : Label1.ForeColor = Drawing.Color.Red
		Else : Label1.ForeColor = Drawing.Color.Green
		End If
		Label1.Text = e.PostBackValue.ToString()
	End Sub
End Class