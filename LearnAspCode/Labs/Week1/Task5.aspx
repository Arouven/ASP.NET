
<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task5.aspx.vb" Inherits="LearnAspCode.Task5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Redirects a user to a new page once the user selects a file name from a Drop-Down-List control.</h1>
	<br />
	<div>
		<div class="row col-sm-12">
			<asp:DropDownList ID="DropDownListPages" runat="server" AutoPostBack="True" CssClass="form-control">
				<asp:ListItem Selected="True">Select page</asp:ListItem>
				<asp:ListItem>home</asp:ListItem>
				<asp:ListItem>courses</asp:ListItem>
				<asp:ListItem>Contact</asp:ListItem>
			</asp:DropDownList>
		</div>
	</div>
</asp:Content>
