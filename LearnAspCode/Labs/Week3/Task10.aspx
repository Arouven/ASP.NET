<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task10.aspx.vb" Inherits="LearnAspCode.Task10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Write a program that allows you to choose products from a CheckBoxList Control and add them to a Shopping Cart list box. The program should also allow you to remove item(s) from the Shopping Cart.</h1>
	<br />
	<div>
		<div class="row" style="margin-left: auto; margin-right: auto; text-align: center;">
			<div class="col-sm-6">
				<asp:Label ID="Label1" runat="server" Text="Products" Font-Bold="true" Font-Italic="true" Font-Underline="true" Font-Size="X-Large" ></asp:Label>
			</div>
			<div class="col-sm-6">
				<asp:Label ID="Label2" runat="server" Text="Shopping Cart" Font-Bold="true" Font-Italic="true" Font-Underline="true" Font-Size="X-Large" ></asp:Label>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-sm-6">
				<asp:CheckBoxList ID="CheckBoxList1" SelectionMode="multiple" runat="server" Style="text-align: left">
					<asp:ListItem> Juice</asp:ListItem>
					<asp:ListItem> Cola</asp:ListItem>
					<asp:ListItem> Pepsi</asp:ListItem>
					<asp:ListItem> Larak</asp:ListItem>
				</asp:CheckBoxList>
			</div>
			<div class="col-sm-6">
				<asp:ListBox ID="ListBox1" runat="server" Style="text-align: left" SelectionMode="Multiple" CssClass="form-control"></asp:ListBox>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-sm-6">
				<asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-info form-control" />
			</div>
			<div class="col-sm-6">
				<asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn btn-danger form-control" />
			</div>
		</div>
	</div>
</asp:Content>


