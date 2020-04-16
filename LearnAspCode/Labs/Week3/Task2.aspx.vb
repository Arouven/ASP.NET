Public Class Task21
	Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If CheckBox1.Checked = True Then
            Label1.Text = "Checked(True)"
        Else
            Label1.Text = "Unchecked(False)"
        End If
    End Sub

    Sub checkchanged()
        Label1.Text = "Checked"
    End Sub

    Protected Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked = True Then
            Label1.Text = "Checked(True)"
        Else
            Label1.Text = "Unchecked(False)"
        End If
    End Sub

End Class