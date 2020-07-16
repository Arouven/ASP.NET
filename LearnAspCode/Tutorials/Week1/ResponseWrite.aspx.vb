Public Class ResponseWrite1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Button1.Text = "Button"
    End Sub

    Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Write("you have wrote: " + TextBox1.Text)
    End Sub
End Class