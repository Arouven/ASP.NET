<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="ListBoxDemo.aspx.vb" Inherits="LearnAspCode.ListBoxDemo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
		.floater {
			float: left;
			border: solid 1px black;
			padding: 5px;
			margin: 5px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div class="floater">
		<h3>ListBox: Filter by Categories:</h3>
		<asp:ListBox ID="ListBox1" runat="server" />
	</div>
</asp:Content>
