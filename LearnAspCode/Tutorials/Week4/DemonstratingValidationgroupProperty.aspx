<%@ Page Title="Show Validation Groups" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DemonstratingValidationgroupProperty.aspx.vb" Inherits="LearnAspCode.DemonstratingValidationgroupProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		html {
			background-color: silver;
		}

		.column {
			float: left;
			width: 300px;
			margin-left: 10px;
			background-color: white;
			border: solid 1px black;
			padding: 10px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

	<div class="column">
		<fieldset>
			<legend>Login</legend>
			<p>Please log in to our Website.</p>
			<asp:Label ID="lblUserName" Text="User Name:" AssociatedControlID="txtUserName" runat="server" />
			<br />
			<asp:TextBox ID="txtUserName" runat="server" />
			<asp:RequiredFieldValidator ID="reqUserName" ControlToValidate="txtUserName" Text="(Required)" ValidationGroup="LoginGroup" runat="server" />
			<br />
			<br />
			<asp:Label ID="lblPassword" Text="Password:" AssociatedControlID="txtPassword" runat="server" />
			<br />
			<asp:TextBox ID="txtPassword" TextMode="Password" runat="server" />
			<asp:RequiredFieldValidator ID="reqPassword" ControlToValidate="txtPassword" Text="(Required)" ValidationGroup="LoginGroup" runat="server" />
			<br />
			<br />
			<asp:Button ID="btnLogin" Text="Login" ValidationGroup="LoginGroup" runat="server" OnClick="btnLogin_Click" />
		</fieldset>
		<asp:Label ID="lblLoginResult" runat="server" />
	</div>
	<div class="column">
		<fieldset>
			<legend>Register</legend>
			<p>If you do not have a User Name, please register at our Website.</p>
			<asp:Label ID="lblFirstName" Text="First Name:" AssociatedControlID="txtFirstName" runat="server" />
			<br />
			<asp:TextBox ID="txtFirstName" runat="server" />
			<asp:RequiredFieldValidator ID="reqFirstName" ControlToValidate="txtFirstName" Text="(Required)" ValidationGroup="RegisterGroup" runat="server" />
			<br />
			<br />
			<asp:Label ID="lblLastName" Text="Last Name:" AssociatedControlID="txtLastName" runat="server" />
			<br />
			<asp:TextBox ID="txtLastName" runat="server" />
			<asp:RequiredFieldValidator ID="reqLastName" ControlToValidate="txtLastName" Text="(Required)" ValidationGroup="RegisterGroup" runat="server" />
			<br />
			<br />
			<asp:Button ID="btnRegister" Text="Register" ValidationGroup="RegisterGroup" runat="server" OnClick="btnRegister_Click" />
		</fieldset>
		<asp:Label ID="lblRegisterResult" runat="server" />
	</div>
</asp:Content>
