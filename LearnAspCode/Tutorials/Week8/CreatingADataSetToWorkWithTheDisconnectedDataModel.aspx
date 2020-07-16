<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="CreatingADataSetToWorkWithTheDisconnectedDataModel.aspx.vb" Inherits="LearnAspCode.CreatingADataSetToWorkWithTheDisconnectedDataModel" %>

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
		<h3>DetailsView</h3>
		<asp:DetailsView ID="DetailsView1" AllowPaging="true" OnPageIndexChanging="DetailsView1_PageIndexChanging" runat="server" />
	</div>
</asp:Content>
