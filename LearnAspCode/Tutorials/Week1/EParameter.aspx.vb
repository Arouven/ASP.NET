Public Class EParameter1
    Inherits System.Web.UI.Page

	Protected Sub btnhouse_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs)
		lblX.Text = e.X.ToString()
		lblY.Text = e.Y.ToString()
	End Sub

	Private Sub form1_Load(sender As Object, e As EventArgs) Handles form1.Load
		btnhouse.ImageUrl = "~/Images/house.jpg"
		btnhouse.Height = "400"
		btnhouse.Width = "400"
	End Sub
End Class