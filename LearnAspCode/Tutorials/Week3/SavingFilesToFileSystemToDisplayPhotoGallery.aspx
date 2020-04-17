<%@ Page Title="FileUpload File" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="SavingFilesToFileSystemToDisplayPhotoGallery.aspx.vb" Inherits="LearnAspCode.SavingFilesToFileSystemToDisplayPhotoGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<script runat="server">
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
	</script>
	<div>
		<asp:Label ID="lblImageFile" Text="Image File:" AssociatedControlID="upImage" runat="server" />
		<asp:FileUpload ID="upImage" runat="server" />
		<br />
		<br />
		<asp:Button ID="btnAdd" Text="Add Image" OnClick="btnAdd_Click" runat="server" />
		<hr />
		<asp:DataList ID="dlstImages" RepeatColumns="3" runat="server">
			<ItemTemplate>
				<asp:Image ID="Image1" ImageUrl='<%# Eval("Name", "~/UploadImages/{0}") %>' Style="width: 200px" runat="server" />
				<br />
				<%# Eval("Name") %>
			</ItemTemplate>
		</asp:DataList>
	</div>
</asp:Content>
