<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Exercise02.aspx.vb" Inherits="LearnAspCode.Exercise02" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.content {
			width: 800px;
			border: solid 1px black;
			background-color: #424242;
			color: white;
		}

		.movies {
			width: 800px;
			border-collapse: collapse;
			text-align: justify;
			color: white;
		}

			.movies th, .movies td {
				padding: 22px;
				border-bottom: 1px solid #424242;
			}

		.item {
			background-color: #990055;
		}

		.alternating {
			background-color: #A9559D;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div class="content">
		<asp:Repeater ID="rptMovies" runat="server">
			<HeaderTemplate>
				<table class="movies">
					<tr>
						<th>Movie Title</th>
						<th>Description</th>
						<th>Box Office Totals</th>
					</tr>
			</HeaderTemplate>
			<ItemTemplate>
				<tr class="item">
					<td><%#Eval("Moviename") %></td>
					<td><%#Eval("Description") %></td>
					<td><%#Eval("BoxOfficeTotals","{0:c}") %></td>
				</tr>
			</ItemTemplate>
			<AlternatingItemTemplate>
				<tr class="alternating">
					<td><%#Eval("Moviename") %></td>
					<td><%#Eval("Description") %></td>
					<td><%#Eval("BoxOfficeTotals","{0:c}") %></td>
				</tr>
			</AlternatingItemTemplate>
			<FooterTemplate>
				</table>
			</FooterTemplate>
		</asp:Repeater>
	</div>
</asp:Content>
