Public Class task32
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub CVCheckThirdNumber_ServerValidate(source As Object, args As ServerValidateEventArgs)
        Dim no1 As Integer = Integer.Parse(txtFirstNumber.Text)
        Dim no2 As Integer = Integer.Parse(txtSecondNumber.Text)
        Dim no3 As Integer = Integer.Parse(txtThirdNumber.Text)

        If no1 < no2 Then
            If ((no3 >= no1) And (no3 <= no2)) Then
                args.IsValid = True
            End If
        Else
            args.IsValid = False
        End If
    End Sub
End Class