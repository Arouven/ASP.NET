Public Class Task5
	Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        If DropDownList1.SelectedItem.Text = "Anim.gif" Then
            Response.Redirect("https://i.stack.imgur.com/y3Hm3.gif")

        ElseIf DropDownList1.SelectedItem.Text = "Video.mp4" Then
            Response.Redirect("http://www.youtube.com")

        ElseIf DropDownList1.SelectedItem.Text = "Image.jpg" Then
            Response.Redirect("https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/VB.NET_Logo.svg/1200px-VB.NET_Logo.svg.png")
        End If
    End Sub

End Class