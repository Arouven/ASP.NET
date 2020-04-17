<%@ Page Title="Format Label" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="FormattingLabel.aspx.vb" Inherits="LearnAspCode.FormattingLabel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		div {
			padding: 10px;
		}

		.labelStyle {
			color: red;
			background-color: yellow;
			border: Solid 2px Red;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:Label ID="lblFirst" Text="First Label" ForeColor="Red" BackColor="Yellow" BorderStyle="Solid" BorderWidth="2" BorderColor="red" runat="server" />
		<br />
		<br />
		<asp:Label ID="lblSecond" Text="Second Label" CssClass="labelStyle" runat="server" />
	</div>
</asp:Content>
