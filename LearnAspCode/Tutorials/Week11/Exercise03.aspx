<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Exercise03.aspx.vb" Inherits="LearnAspCode.Exercise03" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<h1><asp:Label ID="lblcount" runat="server"></asp:Label></h1>
		<asp:DataList ID="dlstMovies" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" GridLines="Both" RepeatLayout="Flow">
			<ItemTemplate>
				<div class="card bg-warning text-white h-100" style="width: 200px; float: left; margin: 10px;">
					<asp:Image runat="server" ImageUrl='<%# Eval("poster", "~/images/{0}")%>' ID="Image1" CssClass="card-img-top" AlternateText="Card image" Width="190px" Height="200px" />
					<div class="card-body">
						<h6 class="card-title"><%# Eval("moviename")%></h6>
						<p class="card-text">
							by
							<asp:HyperLink CssClass="btn btn-primary stretched-link" runat="server" NavigateUrl='<%#Eval("movie_id", "~/details.aspx?id={0}")%>'><%# Eval("director").ToString() %></asp:HyperLink>
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
