<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="viewusers.aspx.vb" Inherits="LearnAspCode.viewusers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style>
		.content {
			margin: auto;
			width: 800px;
			background-color: white;
		}

		.column {
			float: left;
			padding: 20px;
		}

		.column2 {
			clear: left;
			padding: 20px;
		}

		.test td {
			padding: 10px;
		}

		a {
			padding: 10px;
			color: red;
		}

			a:hover {
				background-color: gold;
			}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div class="content">
		<div class="column">
			<!--
Add the imageurl field and set path to images folder: ~/images/{0}
Add the user_id field and set redirect path to viewusers.aspx?ID={0}
-->
			<asp:DataList ID="dlstuser" RepeatColumns="8" RepeatDirection="Horizontal" runat="server">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("imageurl", "~/images/{0}") %>' PostBackUrl='<%# Eval("user_id", "viewusers.aspx?ID={0}")%>' />
					<br />
				</ItemTemplate>
			</asp:DataList>
		</div>
		<div class="column2">
			<asp:DataList ID="dlstuserdetails" runat="server">
				<ItemTemplate>
					<h1><%#Eval("Email")%></h1>
					Name:
					<asp:Label ID="firstname" runat="server" Text='<%# Eval("firstname")%>'></asp:Label>
					<asp:Label ID="lastname" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
					<br />
					Street:
					<%#Eval("Street")%>
					<br />
					Country:
					<%#Eval("Country")%>
				</ItemTemplate>
			</asp:DataList>
		</div>
	</div>
</asp:Content>
