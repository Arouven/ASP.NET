<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="showdeclarative.aspx.vb" Inherits="LearnAspCode.showdeclarative" %>

<%@ Register TagPrefix="user" TagName="PropertyRandomImage"
	Src="~/tutorials/week5/proprndimg.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Show Declarative</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<form id="form1" runat="server">
		<div>
			<user:PropertyRandomImage
				ID="PropertyRandomImage1"
				ImageFolderPath="~/Images2"
				Runat="server" />
		</div>
	</form>
</asp:Content>
