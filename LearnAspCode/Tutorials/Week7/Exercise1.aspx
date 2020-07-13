<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Exercise1.aspx.vb" Inherits="LearnAspCode.Exercise1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>List of Movies:</h1>
	<asp:GridView ID="GridView1" runat="server" AllowPaging="True"
		AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
		<Columns>
			<asp:CommandField ShowSelectButton="True" />
			<asp:BoundField DataField="Movie_Id" HeaderText="Movie_Id" InsertVisible="False" ReadOnly="True" SortExpression="Movie_Id" />
			<asp:BoundField DataField="moviename" HeaderText="moviename" SortExpression="moviename" />
			<asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
			<asp:BoundField DataField="boxofficetotals" HeaderText="boxofficetotals" SortExpression="boxofficetotals" />
			<asp:ImageField DataImageUrlFormatString="~/images/{0}" DataImageUrlField="Poster" HeaderText="Poster" SortExpression="poster" />
			<asp:CheckBoxField DataField="status" HeaderText="status" SortExpression="status" />
			<asp:BoundField DataField="Category_Id" HeaderText="Category_Id" SortExpression="Category_Id" />
		</Columns>
	</asp:GridView>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:MoviesCS %>" SelectCommand="SELECT * FROM [tblMovies]"></asp:SqlDataSource>
</asp:Content>
