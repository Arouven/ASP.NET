Public Class OpenDoc
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim filepath As String = Request.QueryString("filepath")
		Response.Redirect(filepath)
	End Sub

End Class