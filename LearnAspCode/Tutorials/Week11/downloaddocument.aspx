<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="downloaddocument.aspx.vb" Inherits="LearnAspCode.downloaddocument" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		html {
			background-color: silver;
		}

		.content {
			width: 600px;
			border: solid 1px black;
			background-color: #eeeeee;
		}

		.doc {
			margin: 20px 10px;
			padding: 10px;
			border: dashed 2px black;
			background-color: white;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Download document: </h1>
	<div class="content">
		<asp:Repeater ID="rptdoc" runat="server">
			<ItemTemplate>
				<div class="doc">
					<%-- add a hyperlink control with databinding
expression to display the file name in the Text Property and
and the path in the Navigateurl property
Add a label control to display the name of the user who has
uploaded the file --%>
				</div>
			</ItemTemplate>
		</asp:Repeater>
	</div>
</asp:Content>
