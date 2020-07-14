Public Class task42
    Inherits System.Web.UI.Page

    Shared CurrentBid As Integer = 50
    Dim pg As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblCurrentBid.Text = "Current Bid: " & CurrentBid
    End Sub

    Protected Sub CVBidCheck_ServerValidate(source As Object, args As ServerValidateEventArgs)
        Dim bid = Integer.Parse(txtYourBid.Text)
        If bid > CurrentBid Then
            CurrentBid = bid
            args.IsValid = True
        Else
            args.IsValid = False
        End If
    End Sub

    Protected Sub btnSubmitBid_Click(sender As Object, e As EventArgs) Handles btnSubmitBid.Click
        If IsValid Then
            lblCurrentBid.Text = "Current Bid: " & CurrentBid
        End If
    End Sub
End Class