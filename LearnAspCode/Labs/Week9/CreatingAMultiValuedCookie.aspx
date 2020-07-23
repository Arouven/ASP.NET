<%@ Page Title="Set Cookie Values" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="CreatingAMultiValuedCookie.aspx.vb" Inherits="LearnAspCode.CreatingAMultiValuedCookie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:Label ID="lblFirstName" Text="First Name:" AssociatedControlID="txtFirstName" runat="server" />
		<br />
		<asp:TextBox ID="txtFirstName" runat="server" />
		<br />
		<br />
		<asp:Label ID="lblLastName" Text="Last Name:" AssociatedControlID="txtFirstName" runat="server" />
		<br />
		<asp:TextBox ID="txtLastName" runat="server" />
		<br />
		<br />
		<asp:Label ID="lblFavoriteColor" Text="Favorite Color:" AssociatedControlID="txtFavoriteColor" runat="server" />
		<br />
		<asp:TextBox ID="txtFavoriteColor" runat="server" />
		<br />
		<br />
		<asp:Button ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" runat="server" />
	</div>
</asp:Content>
