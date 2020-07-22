<%@ Page Title="AdRotator XML" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DisplayingAdvertisementsFromXML.aspx.vb" Inherits="LearnAspCode.DisplayingAdvertisementsFromXML" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		html {
			background-color: silver;
		}

		.content {
			background-color: white;
			padding: 10px;
			border: solid 1px black;
			margin: auto;
			width: 400px;
			text-align: center;
		}

		.box {
			float: right;
			padding: 10px;
			border-left: solid 1px black;
		}

		.clear {
			clear: both;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div class="content">
		<asp:AdRotator ID="AdRotator1" AdvertisementFile="~/App_Data/AdList.xml" KeywordFilter="banner" CssClass="banner" runat="server" />
		<br />
		<div class="box">
			<asp:AdRotator ID="AdRotator2" AdvertisementFile="~/App_Data/AdList.xml" KeywordFilter="box" runat="server" />
			<br />
			<br />
			<asp:AdRotator ID="AdRotator3" AdvertisementFile="~/App_Data/AdList.xml" KeywordFilter="box" runat="server" />
		</div>
		<br />
		Here is the body text in the page.
		<br />
		Here is the body text in the page.
		<br />
		Here is the body text in the page.
		<br />
		Here is the body text in the page.
		<br class="clear" />
	</div>
</asp:Content>
