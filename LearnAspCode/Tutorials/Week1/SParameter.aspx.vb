Public Class SParameter1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'Button2.Text = "0"
		'SButton1.Text = "0"
	End Sub
	Sub Button_Click(ByVal sender As Object, ByVal e As EventArgs)
		Dim btn As Button = CType(sender, Button)
		btn.Text = (Int32.Parse(btn.Text) + 1).ToString()
	End Sub

End Class