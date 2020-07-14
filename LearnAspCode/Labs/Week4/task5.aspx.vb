Public Class task52
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        txtCreditCard.Text = Regex.Replace(txtCreditCard.Text, "[^0-9]", "")
    End Sub
End Class