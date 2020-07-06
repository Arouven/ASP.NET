Public Class DisplayingTabbedPageWithMultiViewControl
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub
	Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As MenuEventArgs)
		Dim index As Integer = Int32.Parse(e.Item.Value)
		MultiView1.ActiveViewIndex = index
	End Sub

End Class