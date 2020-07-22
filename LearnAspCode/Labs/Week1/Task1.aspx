
<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task1.aspx.vb" Inherits="LearnAspCode.Task1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Clear message in a Label control by clicking button “Clear Msg” (button click event).</h1>
	<br />
	<div>
		<asp:Button ID="Button1" runat="server" Text="Clear" />
		<br />
		<br />
		<div>
			<asp:Label ID="Label1" runat="server" Text="This Message is to be cleared."></asp:Label>
		</div>
	</div>
</asp:Content>


