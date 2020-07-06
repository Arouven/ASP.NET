<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="showrndquotation.aspx.vb" Inherits="LearnAspCode.showrndquotation" %>

<%@ Register TagPrefix="user" TagName="Randomquote" Src="~/Tutorials/Week5/rndquotation.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style>
		.quote {
			width: 200px;
			padding: 20px;
			border: Dotted 2px orange;
			background-color: #eeeeee;
			font: 16px Georgia,Serif;
		}
	</style>
	<title>Show Random Quotation</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<form id="form1" runat="server">
		<div>
			<%= DateTime.Now %>
			<br />
			<user:Radomquote id="rndquote" runat="server"></user:Radomquote>
			<asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>

		</div>
	</form>
</asp:Content>
