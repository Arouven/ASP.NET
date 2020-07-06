Imports System.IO

Public Class SavingFilesToFileSystemToDisplayPhotoGallery
	Inherits System.Web.UI.Page


	Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs)
		If (upImage.HasFile) Then
			If (CheckFileType(upImage.FileName)) Then
				Dim filePath As String = "~/UploadImages/" & upImage.FileName
				upImage.SaveAs(MapPath(filePath))
			End If
		End If
	End Sub
	Function CheckFileType(ByVal fileName As String) As Boolean
		Dim ext As String = Path.GetExtension(fileName)
		Select Case ext.ToLower()
			Case ".gif"
				Return True
			Case ".png"
				Return True
			Case ".jpg"
				Return True
			Case ".jpeg"
				Return True
			Case Else
				Return False
		End Select
	End Function
	Sub Page_PreRender()
		Dim upFolder As String = MapPath("~/UploadImages/")
		Dim dir As New DirectoryInfo(upFolder)
		dlstImages.DataSource = dir.GetFiles()
		dlstImages.DataBind()
	End Sub
End Class