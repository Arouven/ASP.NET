Public Class Task31
	Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Radio_CheckedChanged(sender As Object, ByVal e As EventArgs)
        lblResult.Text = sender.text
    End Sub
End Class