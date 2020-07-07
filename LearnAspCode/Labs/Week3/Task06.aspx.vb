Public Class Task61
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Protected Sub shoot_Click(sender As Object, e As ImageMapEventArgs) Handles shoot.Click
		Label1.Text = e.PostBackValue.ToString()
	End Sub
End Class