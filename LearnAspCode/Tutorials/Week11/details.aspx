<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="details.aspx.vb" Inherits="LearnAspCode.details1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div class="column">
		<!-- This DataList will be used to display list of movies depending on which category is
selected from the previous page -->
		<asp:DataList ID="dlstMovieDetails" runat="server">
			<ItemTemplate>
				<div class="card bg-warning text-white h-100" style="width: 300px; float: left; margin: 30px;">
					<asp:Image runat="server" ImageUrl='<%# Eval("poster", "~/images/{0}")%>' ID="Image1" CssClass="card-img-top" Width="190px" Height="200px" />
					<div class="card-body h">
						<h2 class="card-title"><%# Eval("moviename")%></h2>
						<p class="card-text">
							Movie Description:
							<%#Eval("Description") %>
						</p>
						<p class="card-text">
							<span><strong>Box Office Totals:<br />
							</strong></span><%# Eval("boxofficetotals","{0:c}")%>
						</p>
					</div>
				</div>
			</ItemTemplate>
		</asp:DataList>
	</div>
</asp:Content>
