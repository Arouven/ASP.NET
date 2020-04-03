Public Class MarkUp1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        spanNow.InnerText = DateAndTime.Now.ToString("T")
    End Sub

End Class