<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Exercise08.aspx.vb" Inherits="LearnAspCode.Exercise08" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.movies td {
			padding: 10px;
			text-align: right;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:DataList ID="dlstMovies" GridLines="Horizontal" UseAccessibleHeader="true" OnItemDataBound="dlstMovies_ItemDataBound" CssClass="movies" runat="server">
			<HeaderTemplate>
				Movie Box Office Totals
			</HeaderTemplate>
			<ItemTemplate>
				<%#Eval("Moviename") %>:
				<%#Eval("BoxOfficeTotals","{0:c}") %>
			</ItemTemplate>
			<FooterTemplate>
				<b>Total:</b>
				<asp:Label ID="lblTotal" runat="server" />
			</FooterTemplate>
		</asp:DataList>
	</div>
</asp:Content>
