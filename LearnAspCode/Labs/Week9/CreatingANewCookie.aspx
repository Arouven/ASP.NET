<%@ Page Title="Set Cookie" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="CreatingANewCookie.aspx.vb" Inherits="LearnAspCode.CreatingANewCookie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:Label ID="lblCookieValue" Text="Cookie Value:" AssociatedControlID="txtCookieValue" runat="server" />
		<asp:TextBox ID="txtCookieValue" runat="server" />
		<asp:Button ID="btnAdd" Text="Add Value" OnClick="btnAdd_Click" runat="server" />
	</div>
</asp:Content>
