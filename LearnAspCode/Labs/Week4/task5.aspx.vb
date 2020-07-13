Public Class task52
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSubmitCreditCard_Click(sender As Object, e As EventArgs)
        txtCreditCard.Text = Regex.Replace(txtCreditCard.Text, "[^0-9]", "")

    End Sub
End Class