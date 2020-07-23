Public Class DisplayingACountOfUserSessions
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		lblSessionCount.Text = Application("TotalOnlineUsers").ToString()
	End Sub

End Class