<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Exercise05.aspx.vb" Inherits="LearnAspCode.Exercise05" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.content {
			width: 900px;
			height: 400px;
			padding: 10px;
			border: solid 1px black;
			background-color: white;
		}

		a {
			color: blue;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div class="content">
		<!-- This repeater will be used to display list of categories -->
		<asp:Repeater ID="rptMovieCategories" runat="server">
			<ItemTemplate>
				<asp:HyperLink ID="lnkMenu" Text='<%#Eval("category_name")%>' NavigateUrl='<%#Eval("category_Id", "Exercise05.aspx?id={0}")%>' runat="server" />
			</ItemTemplate>
			<SeparatorTemplate>
				&nbsp;|&nbsp;
			</SeparatorTemplate>
		</asp:Repeater>
		<hr />
		<!-- This repeater will be used to display list of movies depending on which category is
selected from the above Repeater -->
		<asp:Repeater ID="rptMovies" runat="server">
			<HeaderTemplate>
				<ul>
			</HeaderTemplate>
			<ItemTemplate>
				<li><%#Eval("moviename")%></li>
			</ItemTemplate>
			<FooterTemplate>
				</ul>
			</FooterTemplate>
		</asp:Repeater>
	</div>
</asp:Content>
