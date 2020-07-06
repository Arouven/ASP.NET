
Imports System.IO
Public Class randomimage
	Inherits System.Web.UI.UserControl

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim imageToDisplay As String = GetRandomImage()
		imgRandom.ImageUrl = Path.Combine("~/images", imageToDisplay)
		lblRandom.Text = imageToDisplay
	End Sub
	Private Function GetRandomImage() As String
		Dim rnd As New Random()
		Dim images() As String = Directory.GetFiles(MapPath("~/images"), "*.jpg")
		Dim imageToDisplay As String = images(rnd.Next(images.Length))
		Return Path.GetFileName(imageToDisplay)
	End Function
End Class