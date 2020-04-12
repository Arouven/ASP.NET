Public Class master1
	Inherits System.Web.UI.MasterPage
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If (Session("un") Is Nothing) Or (Session("un") = "Register / Login") Then
			LabelUsername.Text = "Register / Login"
		Else
			LabelUsername.Text = Session("un") & " | Logout"
			LabelUsername.
		End If
	End Sub



	'Session.Abandon()
	'           Session.Clear()
	'           Response.Redirect("Login.aspx")
End Class