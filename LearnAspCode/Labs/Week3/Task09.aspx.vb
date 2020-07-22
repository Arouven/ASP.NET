Public Class Task9
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If RadioButtonList1.SelectedIndex = 2 Then
			Panel1.Visible = True
		Else
			Panel1.Visible = False
		End If
	End Sub
End Class
