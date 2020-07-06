
Imports System.IO
Public Class proprndimg
	Inherits System.Web.UI.UserControl
	Private _imageFolderPath As String = "~/Images"
	Public Property ImageFolderPath() As String
		Get
			Return _imageFolderPath
		End Get
		Set(ByVal Value As String)
			_imageFolderPath = Value
		End Set
	End Property

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim imageToDisplay As String = GetRandomImage()
		imgRandom.ImageUrl = Path.Combine(_imageFolderPath, imageToDisplay)
		lblRandom.Text = imageToDisplay
	End Sub
	Private Function GetRandomImage() As String
		Dim rnd As New Random()
		Dim images() As String = Directory.GetFiles(MapPath(_imageFolderPath), "*.jpg")
		Dim imageToDisplay As String = images(rnd.Next(images.Length))
		Return Path.GetFileName(imageToDisplay)
	End Function
End Class