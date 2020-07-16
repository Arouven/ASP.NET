<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="RadioButtonList.aspx.vb" Inherits="LearnAspCode.RadioButtonList1" %>
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
		<h3>RadioButtonList: Filter by Categories:</h3>
		<asp:RadioButtonList ID="RadioButtonList1" runat="server" />
	</div>
</asp:Content>
