<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="WebForm3.aspx.vb" Inherits="LearnAspCode.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>List of Movies:</h1>




	<asp:GridView ID="GridView1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" runat="server">
		<Columns>
			<asp:BoundField DataField="moviename" HeaderText="Name" SortExpression="moviename" />
			<asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
			<asp:BoundField DataField="boxofficetotals" HeaderText="Money" SortExpression="boxofficetotals" />
			<asp:HyperLinkField DataNavigateUrlFields="Movie_Id" Target="_blank" DataNavigateUrlFormatString="details.aspx?Movie_Id={0}" DataTextField="Moviename" HeaderText="View more details" />
		</Columns>
	</asp:GridView>


</asp:Content>
