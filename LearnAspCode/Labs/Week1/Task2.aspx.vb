Public Class Task2
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If (DateTime.Now.Hour < 12) Then
			Label1.Text = "Good Morning"
			Label2.Text = Convert.ToString(DateTime.Now)
		ElseIf (DateTime.Now.Hour < 17) Then
			Label1.Text = "Good Afternoon"
			Label2.Text = Convert.ToString(DateTime.Now)
		Else
			Label1.Text = "Good Evening"
			Label2.Text = Convert.ToString(DateTime.Now)
		End If
		'Label1.Text = "Good Morning"
	End Sub

End Class