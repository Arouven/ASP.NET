<%@ Page Title="Panel Grouping Text" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="SettingTheGroupingTextPropertyInAPanelControl.aspx.vb" Inherits="LearnAspCode.SettingTheGroupingTextPropertyInAPanelControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:Panel ID="pnlContact" GroupingText="Contact Information" runat="server">
			<asp:Label ID="lblFirstName" Text="First Name:" AssociatedControlID="txtFirstName" runat="server" />
			<br />
			<asp:TextBox ID="txtFirstName" AutoCompleteType="FirstName" runat="server" />
			<br />
			<br />
			<asp:Label ID="lblLastname" Text="Last Name:" AssociatedControlID="txtLastName" runat="server" />
			<br />
			<asp:TextBox ID="txtLastName" AutoCompleteType="LastName" runat="server" />
			<br />
			<br />
			<asp:Button ID="btnSubmit" Text="Submit" runat="server" />
		</asp:Panel>
	</div>
</asp:Content>
