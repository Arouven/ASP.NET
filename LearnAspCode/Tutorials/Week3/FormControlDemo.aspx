<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="FormControlDemo.aspx.vb" Inherits="LearnAspCode.FormControlDemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div class="form-horizontal">
		<h4>Working with Server controls</h4>
		<hr />
		<div class="form-group">
			<asp:Label runat="server" CssClass="col-md-2 control-label">Product name</asp:Label>
			<div class="col-md-8">
				<asp:TextBox runat="server" ID="txtProdName" CssClass="form-control" />
			</div>
		</div>
		<div class="form-group">
			<asp:Label runat="server" CssClass="col-md-2 control-label">Description</asp:Label>
			<div class="col-md-8">
				<asp:TextBox runat="server" ID="txtProdDesc" TextMode="Multiline" CssClass="form-control" />
			</div>
		</div>
		<div class="form-group">
			<div class="offset-md-2 col-md-8">
				<asp:Button runat="server" Text="Add Product" CssClass="btn btn-block btn-primary" />
			</div>
		</div>
	</div>
</asp:Content>
