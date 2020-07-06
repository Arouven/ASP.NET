<%@ Page Title="Show HyperLink" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="AccessingRandomFilesWithTheHyperLinkControl.aspx.vb" Inherits="LearnAspCode.AccessingRandomFilesWithTheHyperLinkControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:HyperLink ID="lnkRandom" Text="Random Link" runat="server" />
	</div>
</asp:Content>
