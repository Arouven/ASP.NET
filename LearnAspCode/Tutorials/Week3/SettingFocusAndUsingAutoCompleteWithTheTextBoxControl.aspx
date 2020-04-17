<%@ Page Title="Show AutoComplete" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="SettingFocusAndUsingAutoCompleteWithTheTextBoxControl.aspx.vb" Inherits="LearnAspCode.SettingFocusAndUsingAutoCompleteWithTheTextBoxControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<script runat="server">
		Sub Page_Load()
			txtFirstName.Focus()
		End Sub
	</script>
	<div>
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
	</div>
</asp:Content>
