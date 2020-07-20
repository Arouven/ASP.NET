<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="login.aspx.vb" Inherits="LearnAspCode.login1" %>

<%@ Register TagPrefix="user" TagName="logincontrol" src="~/Tutorials/Week5/logincrtl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div id="container">
		<div id="leftSide">
			<fieldset>
				<legend>Member Login</legend>
				<div class="form">
					<user:logincontrol id="userlogin" runat="server" />
					<br />
					<br />
					<asp:Button ID="btnLogin" OnClick="btnLogin_Click" runat="server" CssClass="btn btn-primary" Text="Log in" />
				</div>
			</fieldset>
			<fieldset>
				<asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
				<br />
				<asp:Button ID="btnRegister" runat="server" PostBackUrl="~/Tutorials/Week5/Register.aspx" Text="Don’t have an account yet? Join now" CausesValidation="false" CssClass="btn btn-warning" /><br />
			</fieldset>
		</div>
	</div>
</asp:Content>
