<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Exercise01.aspx.vb" Inherits="LearnAspCode.Exercise01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.content {
			width: 1100px;
			border: solid 1px black;
			background-color: #eeeeee;
			margin: auto;
		}

		.movies {
			margin: 20px 10px;
			padding: 10px;
			border: dashed 2px black;
			background-color: white;
			height: 400px;
		}

		.box1 {
			float: left;
			width: 800px;
			margin-right: 30px;
			text-align: justify;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div class="content">
		<asp:Repeater ID="rptMovies" runat="server">
			<ItemTemplate>
				<div class="movies">
					<div class="box1">
						<h1><%#Eval("moviename") %></h1>
						<b>Movie Description:</b> <%# Eval("Description") %>
						<br />
						<b>Box Office Totals:</b> <%# Eval("Boxofficetotals", "{0:c}") %>
					</div>
					<div>
						<asp:Image ID="imgposter" ImageUrl='<%# Eval("Poster", "~/images/{0}") %>' runat="server" />
						<asp:LinkButton ID="lnkmovdetails" runat="server" Text="View Details" CommandArgument='<%# Eval("Movie_id")%>' CommandName="btnAccess" CssClass="btn btn-info"></asp:LinkButton>
					</div>
				</div>
			</ItemTemplate>
		</asp:Repeater>
	</div>
</asp:Content>
