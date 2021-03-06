﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Exercise2.aspx.vb" Inherits="LearnAspCode.Exercise2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style>
		.noMatch {
			color: red;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="459px" AutoGenerateRows="False" DataKeyNames="Movie_Id" DataSourceID="SqlDataSource1" AllowPaging="True" EmptyDataText="<b>No Matching Record!</b>" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">


		<%--	<EmptyDataTemplate>
			<div class="noMatch">
				<h1>No Matching Results!</h1>
				<h2>Please select a different record…</h2>
			</div>
		</EmptyDataTemplate>--%>
		<AlternatingRowStyle BackColor="White" />
		<EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
		<Fields>

			<asp:BoundField DataField="Boxofficetotals" DataFormatString="{0:c} " HeaderText="Boxofficetotals" SortExpression="Boxofficetotals" />
			<asp:BoundField DataField="Poster" HeaderText="Poster" SortExpression="Poster" />
			<asp:CheckBoxField DataField="Status" HeaderText="Status" SortExpression="Status" />
			<asp:ImageField DataImageUrlFormatString="~/images/{0}" DataImageUrlField="Poster" HeaderText="Poster" SortExpression="poster" />
			<asp:HyperLinkField DataNavigateUrlFields="Movie_Id" Target="_blank" DataNavigateUrlFormatString="details.aspx?Movie_Id={0}" DataTextField="Moviename" HeaderText="View more details"  />
			<asp:CommandField ControlStyle-CssClass="btn btn-success" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" CausesValidation="false" ItemStyle-HorizontalAlign="Center">
				<ControlStyle CssClass="btn btn-success" ></ControlStyle>
			</asp:CommandField>
		</Fields>
		<%--<PagerSettings Mode="NextPreviousFirstLast" FirstPageText="[First Movie]" LastPageText="[Last Movie]" NextPageText="[Next Movie]" PreviousPageText="[Previous Movie]" />--%>
		<PagerSettings Mode="NextPreviousFirstLast" FirstPageImageUrl="../../images/Home.png" LastPageImageUrl="../../images/Last.png" NextPageImageUrl="../../images/Next.png" PreviousPageImageUrl="../../images/Previous.png" />
		<FooterStyle BackColor="#CCCC99" />
		<HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Center" />
		<RowStyle BackColor="#F7F7DE" />
	</asp:DetailsView>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesCS %>" SelectCommand="SELECT * FROM [tblMovies]"></asp:SqlDataSource>
</asp:Content>
