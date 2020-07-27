<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Exercise06.aspx.vb" Inherits="LearnAspCode.Exercise06" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.column {
			float: left;
			margin: 20px;
		}

		.movies {
			border: 2px solid gray;
			width: 250px;
		}

			.movies td {
				padding: 10px;
				text-align: center;
			}

		a {
			color: red;
		}

		.movies td:hover {
			background-color: Gold;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div class="content">
		<div class="column">
			<!-- This DataList will be used to display list of categories -->
			<asp:DataList ID="dlstMovieCategories" DataKeyField="Category_Id" GridLines="Horizontal" CssClass="movies" runat="server">
				<HeaderTemplate>All Categories</HeaderTemplate>
				<ItemTemplate>
					<asp:LinkButton ID="lnkMovie" Text='<%#Eval("category_name") %>' PostBackUrl='<%#Eval("category_Id", "details.aspx?id={0}")%>' CommandName="Select" runat="server" />
				</ItemTemplate>
			</asp:DataList>
		</div>
	</div>
</asp:Content>
