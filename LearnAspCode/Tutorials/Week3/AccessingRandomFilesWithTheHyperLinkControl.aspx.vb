
Imports System.IO
Public Class AccessingRandomFilesWithTheHyperLinkControl
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		lnkRandom.NavigateUrl = GetRandomFile()
	End Sub

	Function GetRandomFile() As String
		Dim files As String() = Directory.GetFiles(MapPath(Request.ApplicationPath), "*.aspx")
		Dim rnd As New Random()
		Dim rndFile As String = files(rnd.Next(files.Length))
		Return Path.GetFileName(rndFile)
	End Function

End Class