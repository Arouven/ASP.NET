

<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task3.aspx.vb" Inherits="LearnAspCode.Task3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Hide/show message in a Label control by clicking button “Show Label” or “Hide Label” (button click event)</h1>
	<br />
	<div>
		<div class="row">
			<div class="col-sm-6">
				<asp:Button ID="Button1" runat="server" Text="Show Label" CssClass="btn btn-success form-control" />
			</div>
			<div class="col-sm-6">
				<asp:Button ID="Button2" runat="server" Text="Hide Label" CssClass="btn btn-warning form-control" />
			</div>
		</div>
		<br />
		<br />
		<div class="row col-sm-6">
			<asp:Label ID="Label1" runat="server" Text="I can be hidden and be shown again." Font-Bold="true" Font-Size="X-Large" ></asp:Label>
		</div>
	</div>
</asp:Content>
