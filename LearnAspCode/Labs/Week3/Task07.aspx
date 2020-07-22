<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task07.aspx.vb" Inherits="LearnAspCode.Task71" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style>
		.responsive {
			width: 100%;
			height: auto;
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>To display random images in an Image control. Try with the Switch statement.</h1>
	<br />
	<div>
		<div>
			<asp:Button ID="Button1" runat="server" Text="Generate Random Image" CssClass="form-control" />
		</div>
		<br />
		<br />
		<div class="text-center">
			<asp:Image ID="Image1" runat="server" CssClass="responsive" />
		</div>
	</div>
</asp:Content>


