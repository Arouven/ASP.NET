Public Class ControlEvents1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)
        Label1.Text = "Thanks!"
    End Sub

End Class