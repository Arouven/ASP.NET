<%@ Page Title="Show ValidationSummary" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DisplayingValidationSummary.aspx.vb" Inherits="LearnAspCode.DisplayingValidationSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:ValidationSummary ID="ValidationSummary1" runat="server" />
		<asp:Label ID="lblFirstName" Text="First Name:" AssociatedControlID="txtFirstName" runat="server" />
		<br />
		<asp:TextBox ID="txtFirstName" runat="server" />
		<asp:RequiredFieldValidator ID="reqFirstName" Text="(Required)" ErrorMessage="First Name is required" ControlToValidate="txtFirstName" runat="server" />
		<br />
		<br />
		<asp:Label ID="lblLastName" Text="Last Name:" AssociatedControlID="txtLastName" runat="server" />
		<br />
		<asp:TextBox ID="txtLastName" runat="server" />
		<asp:RequiredFieldValidator ID="reqLastName" Text="(Required)" ErrorMessage="Last Name is required" ControlToValidate="txtLastName" runat="server" />
		<br />
		<br />
		<asp:Button ID="btnSubmit" Text="Submit" runat="server" />
	</div>
</asp:Content>
