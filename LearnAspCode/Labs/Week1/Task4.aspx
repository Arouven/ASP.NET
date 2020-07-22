

<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task4.aspx.vb" Inherits="LearnAspCode.Task4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Transfer text from one Textbox to another (button click event).</h1>
	<br />
	<div>
		<div class="row">
			<div class="col-sm-6">
				<asp:TextBox ID="TextBox1" runat="server" Text="Transfer me" CssClass="form-control"></asp:TextBox>
			</div>
			<div class="col-sm-6">
				<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
			</div>
		</div>
		<br />
		<br />
		<div class="row">
			<asp:Button ID="Button1" runat="server" Text="Transfer" CssClass="btn btn-success form-control" />
		</div>
	</div>
</asp:Content>
