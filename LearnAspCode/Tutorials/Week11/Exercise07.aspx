<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Exercise07.aspx.vb" Inherits="LearnAspCode.Exercise07" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.movies {
			font: 14px Arial,Sans-Serif;
		}

		.header {
			font-size: 18px;
			letter-spacing: 15px;
		}

		.item {
			padding: 10px;
			background-color: #eeeeee;
			border-bottom: Solid 1px blue;
		}

		.alternating {
			padding: 10px;
			background-color: LightBlue;
			border-bottom: Solid 1px blue;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<h1>Sort Movies</h1>
		<asp:RadioButton ID="radLow" GroupName="box" AutoPostBack="true"
			Text="Lowest BoxOfficeTotals" runat="server" />
		<asp:RadioButton ID="radHigh" GroupName="box" AutoPostBack="true"
			Text="Highest BoxOfficeTotals" runat="server" />
		<asp:DataList
			ID="dlstMovies"
			UseAccessibleHeader="true"
			CssClass="movies"
			HeaderStyle-CssClass="header"
			ItemStyle-CssClass="item"
			AlternatingItemStyle-CssClass="alternating"
			runat="server">
			<HeaderTemplate>
				Movies
			</HeaderTemplate>
			<ItemTemplate>
				<p><%#Eval("MovieName")%></p>
				<%# Eval("boxofficetotals","{0:c}")%>
			</ItemTemplate>
		</asp:DataList>
	</div>
</asp:Content>
