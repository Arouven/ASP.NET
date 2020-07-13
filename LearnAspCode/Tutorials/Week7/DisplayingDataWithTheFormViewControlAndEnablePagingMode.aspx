<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DisplayingDataWithTheFormViewControlAndEnablePagingMode.aspx.vb" Inherits="LearnAspCode.DisplayingDataWithTheFormViewControlAndEnablePagingMode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		#content {
			margin: auto;
			width: 400px;
			padding: 10px;
			background-color: lightgray;
			font: 24px Georgia,Serif;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div id="content">
		<asp:FormView ID="FormView1" CellPadding="50" CellSpacing="50"
			BorderStyle="Dotted" runat="server" DataSourceID="SqlDataSource1">
			<ItemTemplate>
				Movie name:
				<asp:Label ID="movienameLabel" runat="server" Text='<%# Eval("moviename") %>' />
				<br />
				Description:
				<asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
				<br />
				<asp:Image ID="Label1" runat="server" ImageUrl='<%# Eval("poster", "~/Images/{0}") %>' />
				<br />
				Box office totals:
				<asp:Label ID="boxofficetotalsLabel" runat="server" Text='<%# Eval("boxofficetotals", "{0:C}") %>' />
				<br />
			</ItemTemplate>
		</asp:FormView>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesCS %>" SelectCommand="SELECT [moviename], [description], [poster], [boxofficetotals] FROM [tblMovies]"></asp:SqlDataSource>
	</div>
</asp:Content>
