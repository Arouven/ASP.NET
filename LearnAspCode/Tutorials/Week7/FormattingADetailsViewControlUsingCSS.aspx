<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="FormattingADetailsViewControlUsingCSS.aspx.vb" Inherits="LearnAspCode.Exercise3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.movies td, .movies th {
			padding: 10px;
		}

		.movies {
			border: double 4px black;
		}

		.header {
			letter-spacing: 8px;
			font: bold 16px Arial,Sans-Serif;
			background-color: silver;
		}

		.fieldHeader {
			font-weight: bold;
		}

		.alternating {
			background-color: #eeeeee;
		}

		.command {
			background-color: silver;
		}

			.command a {
				color: black;
				background-color: #eeeeee;
				font: 14px Arials,Sans-Serif;
				text-decoration: none;
				padding: 3px;
				border: solid 1px black;
			}

				.command a:hover {
					background-color: yellow;
				}

		.pager td {
			padding: 2px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:DetailsView ID="dtlMovies" DataSourceID="srcMovies" AllowPaging="true" GridLines="None" HeaderText="Movies" CssClass="movies" HeaderStyle-CssClass="header" FieldHeaderStyle-CssClass="fieldHeader" AlternatingRowStyle-CssClass="alternating" CommandRowStyle-CssClass="command" PagerStyle-CssClass="pager" runat="server" />
		<asp:SqlDataSource ID="srcMovies" ConnectionString="<%$ ConnectionStrings:MoviesCS %>" SelectCommand="SELECT moviename, description,status FROM tblMovies" runat="server" />
	</div>
</asp:Content>
