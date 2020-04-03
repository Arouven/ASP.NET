Public Class IsPostBack1
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not Page.IsPostBack Then
			' Create collection of items
			Dim items As New ArrayList()
			items.Add("Apples")
			items.Add("Oranges")
			' Bind to DropDownList
			DropDownList1.DataSource = items
			DropDownList1.DataBind()
		End If
	End Sub

End Class