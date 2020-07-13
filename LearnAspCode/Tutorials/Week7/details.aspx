<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="details.aspx.vb" Inherits="LearnAspCode.details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Movie_Id" DataSourceID="SqlDataSource1">
		<Columns>
			<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
			<asp:BoundField DataField="Director" HeaderText="Director" SortExpression="Director" />
			<asp:CheckBoxField DataField="Status" HeaderText="Status" SortExpression="Status" />
			<asp:ImageField DataImageUrlFormatString="~/images/{0}" DataImageUrlField="Poster" HeaderText="Poster" SortExpression="poster" />
			<asp:TemplateField HeaderText="Moviename &amp; BoxOfficeTotal">
				<ItemTemplate>
					<asp:Label ID="lblname" runat="server" Text='<%# Eval("Moviename") %>' />
						<asp:Label ID="lblBoxOfficeTotals" runat="server" Text='<%# Eval("Boxofficetotals") %>' />
				</ItemTemplate>
			</asp:TemplateField>
		</Columns>
	</asp:GridView>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesCS %>" SelectCommand="SELECT [Moviename], [Description], [Boxofficetotals], [Director],[Poster], [Status], [Movie_Id] FROM [tblMovies] WHERE ([Movie_Id] = @Movie_Id)">
		<SelectParameters>
			<asp:QueryStringParameter Name="Movie_Id" QueryStringField="Movie_Id" Type="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>
</asp:Content>
