Public Class Task81
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim teams() As String = {"Chelsea", "Arsenal", "Liverpool"}

		For Each team As String In teams
			DropDownList1.Items.Add(team)
			RadioButtonList1.Items.Add(team)
			CheckBoxList1.Items.Add(team)
			ListBox1.Items.Add(team)
		Next
	End Sub

End Class