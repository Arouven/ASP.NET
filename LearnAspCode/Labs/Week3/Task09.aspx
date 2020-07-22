<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task09.aspx.vb" Inherits="LearnAspCode.Task9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Hides or displays controls with the Panel control as follows: To display a Panel control containing a TextBox only if the user chooses the “Other Language” option.</h1>
	<br />
	<div>
		<asp:Label ID="Label1" runat="server" Text="Select your favourite programming language:"></asp:Label>
		<asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
			<asp:ListItem Selected="True">Python</asp:ListItem>
			<asp:ListItem>Ruby on Rails</asp:ListItem>
			<asp:ListItem>Other Language</asp:ListItem>
		</asp:RadioButtonList>
		<asp:Button ID="Button1" runat="server" Text="Submit" />
		<br />
		<br />
		<asp:Panel ID="Panel1" runat="server" Visible="false">
			<asp:TextBox ID="TextBox1" runat="server" Placeholder="Other Language"></asp:TextBox>
		</asp:Panel>
	</div>
</asp:Content>


