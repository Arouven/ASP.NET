

<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task2.aspx.vb" Inherits="LearnAspCode.Task2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Display message Good morning or Good afternoon in a label control once the page loads (page event)</h1>
	<br />
	<div>
		<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
		<br />
		<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
	</div>
</asp:Content>
