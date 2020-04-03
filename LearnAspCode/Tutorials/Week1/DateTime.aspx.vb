Public Class DateTime1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblServerTime.Text = DateAndTime.Now.ToString()
    End Sub

End Class