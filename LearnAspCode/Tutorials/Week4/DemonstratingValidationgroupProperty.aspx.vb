Public Class DemonstratingValidationgroupProperty
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub
	Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As EventArgs)
		If Page.IsValid() Then
			lblLoginResult.Text = "Log in successful!"
		End If
	End Sub
	Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As EventArgs)
		If Page.IsValid() Then
			lblRegisterResult.Text = "Registration successful!"
		End If
	End Sub

End Class