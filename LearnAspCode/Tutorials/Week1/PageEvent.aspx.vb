Public Class PageEvent1
    Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Label1.Text = "Page Load"
	End Sub

	Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
		Label1.Text &= "<br />Button Click"
	End Sub
	Sub Page_PreRender()
		Label1.Text &= "<br />Page PreRender"
	End Sub
End Class