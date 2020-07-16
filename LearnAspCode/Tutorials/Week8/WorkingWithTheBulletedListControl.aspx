<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="WorkingWithTheBulletedListControl.aspx.vb" Inherits="LearnAspCode.WorkingWithTheBulletedListControl" %>

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
		<h3>List of Movies and Box Office Totals, Category name</h3>
		<asp:BulletedList ID="list1" runat="server" />
	</div>
</asp:Content>
