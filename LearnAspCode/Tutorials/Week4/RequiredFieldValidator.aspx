<%@ Page Title="Show RequiredFieldValidator" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="RequiredFieldValidator.aspx.vb" Inherits="LearnAspCode.RequiredFieldValidator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<asp:Label ID="lblFirstName" Text="First Name:" AssociatedControlID="txtFirstName" runat="server" />
	<br />
	<asp:TextBox ID="txtFirstName" runat="server" />
	<asp:RequiredFieldValidator ID="reqFirstName" ControlToValidate="txtFirstName" Text="(Required)" runat="server" />
	<br />
	<br />
	<asp:Label ID="lblLastName" Text="Last Name:" AssociatedControlID="txtLastName" runat="server" />
	<br />
	<asp:TextBox ID="txtLastName" runat="server" />
	<asp:RequiredFieldValidator ID="reqLastName" ControlToValidate="txtLastName" Text="(Required)" runat="server" />
	<asp:Button ID="btnSubmit" Text="Submit" runat="server" />
</asp:Content>
