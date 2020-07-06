<%@ Page Title="Button OnClientClick" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DisplayingAClient-sideConfirmationDialogBox.aspx.vb" Inherits="LearnAspCode.DisplayingAClient_sideConfirmationDialogBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

	<div>
		<asp:Button ID="btnDelete" Text="Delete Website" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure?');" runat="server" />
		<br />
		<br />
		<asp:Label ID="lblResult" runat="server" />
	</div>
</asp:Content>
