Public Class DisablingViewState1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs)
		Label1.Text = (Int32.Parse(Label1.Text) + 1).ToString()
		Label2.Text = (Int32.Parse(Label2.Text) + 1).ToString()
	End Sub

End Class