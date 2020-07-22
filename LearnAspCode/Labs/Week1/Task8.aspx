<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task8.aspx.vb" Inherits="LearnAspCode.Task8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Create a simple calculator user interface.</h1>
	<br />
	<div style="margin-left: auto; margin-right: auto;">
		<div class="row ">
			<div class="col-xs-12 col-sm-8 col-md-4">
				<asp:TextBox ID="TextBox1" runat="server" Style="text-align: right" CssClass="form-control "></asp:TextBox>
			</div>
		</div>
		<br />
		<br />
		<div class="row">
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button1" runat="server" Text="7" CssClass="btn btn-light form-control" />
			</div>
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button2" runat="server" Text="8" CssClass="btn btn-light form-control" />
			</div>
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button3" runat="server" Text="9" CssClass="btn btn-light form-control" />
			</div>
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button4" runat="server" Text="X" CssClass="btn btn-light form-control" />
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button5" runat="server" Text="4" CssClass="btn btn-light form-control" />
			</div>
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button6" runat="server" Text="5" CssClass="btn btn-light form-control" />
			</div>
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button7" runat="server" Text="6" CssClass="btn btn-light form-control" />
			</div>
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button8" runat="server" Text="/" CssClass="btn btn-light form-control" />
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button9" runat="server" Text="1" CssClass="btn btn-light form-control" />
			</div>
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button10" runat="server" Text="2" CssClass="btn btn-light form-control" />
			</div>
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button11" runat="server" Text="3" CssClass="btn btn-light form-control" />
			</div>
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button12" runat="server" Text="+" CssClass="btn btn-light form-control" />
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button13" runat="server" Text="0" CssClass="btn btn-light form-control" />
			</div>
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button14" runat="server" Text="." CssClass="btn btn-light form-control" />
			</div>
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button15" runat="server" Text="-" CssClass="btn btn-light form-control" />
			</div>
			<div class="col-xs-3 col-sm-2 col-md-1 ">
				<asp:Button ID="Button16" runat="server" Text="=" CssClass="btn btn-light form-control" />
			</div>
		</div>
	</div>
</asp:Content>
