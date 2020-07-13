Public Class task32
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub CVCheckThirdNumber_ServerValidate(source As Object, args As ServerValidateEventArgs)
        If (Integer.Parse(txtThirdNumber.Text) > Integer.Parse(txtFirstNumber.Text)) And (Integer.Parse(txtThirdNumber.Text) < Integer.Parse(txtSecondNumber.Text)) Then
            args.IsValid = True
        Else
            args.IsValid = False
        End If
    End Sub
End Class