<%@ Page Title="Show LinkButton" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="UsingTheLinkButtonControlToSubmitAForm.aspx.vb" Inherits="LearnAspCode.UsingTheLinkButtonControlToSubmitAForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

	<div>
		<asp:Label ID="lblFirstName" Text="First Name:" AssociatedControlID="txtFirstName" runat="server" />
		<br />
		<asp:TextBox ID="txtFirstName" runat="server" />
		<br />
		<br />
		<asp:Label ID="lblLastName" Text="Last Name:" AssociatedControlID="txtLastName" runat="server" />
		<br />
		<asp:TextBox ID="txtLastName" runat="server" />
		<br />
		<br />
		<asp:LinkButton ID="lnkSubmit" Text="Submit" OnClick="lnkSubmit_Click" runat="server" />
		<br />
		<br />
		<asp:Label ID="lblResults" runat="server" />
	</div>
</asp:Content>
