
<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task7.aspx.vb" Inherits="LearnAspCode.Task7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Display hyperlink with either text ”Visit Morning Session” or “Visit Afternoon Session” based on the time of the day.</h1>
	<br />
	<div class="text-center">
		<br />
		<br />
		<asp:HyperLink ID="HyperLink1" runat="server" Font-Size="X-Large" Font-Bold="true" Font-Italic="true" NavigateUrl="~/home.aspx">HyperLink</asp:HyperLink>
	</div>
</asp:Content>
