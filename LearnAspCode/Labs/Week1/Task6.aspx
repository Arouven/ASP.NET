<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task6.aspx.vb" Inherits="LearnAspCode.Task6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Detects which item has been checked from a set of Radio Buttons and displays message in a label control.</h1>
	<br />
	<div>
		<div class="row col-sm-12">
			<asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" TabIndex="1" ValidationGroup="vgGroup" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" >
				<asp:ListItem Selected="True" Enabled="false">Select something</asp:ListItem>
				<asp:ListItem >VB.NET</asp:ListItem>
				<asp:ListItem>C#</asp:ListItem>
				<asp:ListItem>PHP</asp:ListItem>
				<asp:ListItem>NODE.JS</asp:ListItem>
			</asp:RadioButtonList>
		</div>
		<br />
		<div class="row">
			<div class="col-sm-12">
				<asp:Button ID="Button1" runat="server" Text="Button" CssClass="btn btn-success form-control" />
			</div>
					</div>
		<br />
		<div class="row">
			<div class="col-sm-12">
				<asp:Label ID="Label1" runat="server" Text="" Font-Bold="true" Font-Size="X-Large" ForeColor="YellowGreen"></asp:Label>
			</div>
		</div>
	</div>
</asp:Content>
