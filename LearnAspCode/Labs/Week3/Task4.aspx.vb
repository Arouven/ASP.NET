Public Class Task41
	Inherits System.Web.UI.Page

    Public Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        result.Text = ""
    End Sub

    Private Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
        result.Text = "Firstname: " & TextBox1.Text & "<br> Surname: " & TextBox2.Text
        TextBox1.Text = ""
        TextBox2.Text = ""
    End Sub

End Class