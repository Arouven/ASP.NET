Public Class task42
    Inherits System.Web.UI.Page
    Private CurrentBid As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim rnd As New Random
        CurrentBid = rnd.Next(5000, 67000)

        If Not IsPostBack Then

            lblCurrentBid.Text = "Current Bid: " & CurrentBid
        End If



    End Sub

    Protected Sub CVBidCheck_ServerValidate(source As Object, args As ServerValidateEventArgs)
        If Integer.Parse(txtYourBid.Text) < CurrentBid Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If
    End Sub
End Class