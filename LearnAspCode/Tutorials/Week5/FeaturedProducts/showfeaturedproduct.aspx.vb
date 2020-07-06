
Imports System.IO
Public Class showfeaturedproduct
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim featuredProductPath As String = GetRandomProductPath()
		Dim featuredProduct As Control = Page.LoadControl(featuredProductPath)
		PlaceHolder1.Controls.Add(featuredProduct)
	End Sub
	Const randomFolder As String = "~/Tutorials/Week5/FeaturedProducts"

	Private Function GetRandomProductPath() As String
		Dim rnd As New Random()
		Dim files() As String = Directory.GetFiles(MapPath(randomFolder), "*.ascx")
		Dim featuredProductPath As String = Path.GetFileName(files(rnd.Next(files.Length)))
		Return Path.Combine(randomFolder, featuredProductPath)
	End Function
End Class