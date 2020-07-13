<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Exercise2.aspx.vb" Inherits="LearnAspCode.Exercise2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<asp:DetailsView ID="DetailsView1" EmptyDataText="no record found" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Movie_Id" DataSourceID="SqlDataSource1" AllowPaging="true">
		<Fields>
			
			<asp:BoundField DataField="Boxofficetotals" DataFormatString="{0:c} " HeaderText="Boxofficetotals" SortExpression="Boxofficetotals" />
			<asp:BoundField DataField="Poster" HeaderText="Poster" SortExpression="Poster" />
			<asp:CheckBoxField DataField="Status" HeaderText="Status" SortExpression="Status" />
			<asp:ImageField DataImageUrlFormatString="~/images/{0}" DataImageUrlField="Poster" HeaderText="Poster" SortExpression="poster" />
			<asp:HyperLinkField DataNavigateUrlFields="Movie_Id" Target="_blank" DataNavigateUrlFormatString="details.aspx?Movie_Id={0}" DataTextField="Moviename" />
		<asp:CommandField controlStyle-CssClass="btn btn-success" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" >
<ControlStyle CssClass="btn btn-success"></ControlStyle>
			</asp:CommandField>
		</Fields>
			<%--<PagerSettings Mode="NextPreviousFirstLast" FirstPageText="[First Movie]" LastPageText="[Last Movie]" NextPageText="[Next Movie]" PreviousPageText="[Previous Movie]" />--%>
			<PagerSettings Mode="NextPreviousFirstLast" FirstPageImageUrl="../../images/Home.png" LastPageImageUrl="../../images/Last.png" NextPageImageUrl="../../images/Next.png" PreviousPageImageurl="../../images/Previous.png" />
	</asp:DetailsView>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesCS %>" SelectCommand="SELECT * FROM [tblMovies]"></asp:SqlDataSource>
</asp:Content>
