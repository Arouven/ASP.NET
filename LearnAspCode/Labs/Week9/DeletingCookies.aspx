<%@ Page Title="Delete Cookie" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DeletingCookies.aspx.vb" Inherits="LearnAspCode.DeletingCookies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:Label ID="lblCookieName" Text="Cookie Name:" AssociatedControlID="txtCookieName" runat="server" />
		<asp:TextBox ID="txtCookieName" runat="server" />
		<asp:Button ID="btnDelete" Text="Delete Cookie" OnClick="btnDelete_Click" runat="server" />
	</div>
</asp:Content>
