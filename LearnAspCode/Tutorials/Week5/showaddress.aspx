<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="showaddress.aspx.vb" Inherits="LearnAspCode.showaddress" %>


<%@ Register TagPrefix="user" TagName="Address" Src="~/Tutorials/Week5/addressform.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		html {
			background-color: silver;
			font: 14px Georgia,Serif;
		}

		.content {
			background-color: white;
			width: 600px;
			margin: auto;
			padding: 20px;
		}

		.addressLabel {
			float: left;
			width: 100px;
			padding: 5px;
			text-align: right;
		}

		.addressField {
			float: left;
			padding: 5px;
		}

		.clear {
			clear: both;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<form id="form1" runat="server">
		<div class="content">
			<user:Address id="ucBillingAddr" runat="server" />
			<hr />
			<user:Address id="ucShippingAddr" runat="server" />
			<asp:Button
				ID="btnSubmit"
				Text="Submit Form"
				runat="server" />
			<hr />
			<asp:Literal
				ID="ltlResults"
				runat="server" />
		</div>
	</form>
</asp:Content>
