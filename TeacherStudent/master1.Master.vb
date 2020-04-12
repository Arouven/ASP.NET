Public Class master1
	Inherits System.Web.UI.MasterPage
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If (Session("un") Is Nothing) Or (Session("un") = "Register / Login") Then
			LabelUsername.Text = "Register / Login"
			logout.HRef = "Login"
		Else
			LabelUsername.Text = Session("un") & " | Logout"
			logout.HRef = "Logout"
		End If
	End Sub
End Class