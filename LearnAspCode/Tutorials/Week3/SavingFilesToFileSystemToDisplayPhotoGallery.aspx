<%@ Page Title="FileUpload File" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="SavingFilesToFileSystemToDisplayPhotoGallery.aspx.vb" Inherits="LearnAspCode.SavingFilesToFileSystemToDisplayPhotoGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
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
