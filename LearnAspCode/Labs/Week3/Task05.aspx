<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task05.aspx.vb" Inherits="LearnAspCode.Task51" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Add a Reset Button to clear the form in Task 4 above. The ImageButton control in Task 4 above must respond once the ENTER key on your keyboard is pressed.</h1>
	<br />
	<div>
		<div class="form-group">
			<asp:Label ID="Label1" runat="server" Text="Firstname" CssClass="col-sm-2"></asp:Label>
			<asp:TextBox ID="TextBox1" runat="server" CssClass="col-sm-10"></asp:TextBox>
		</div>
		<br />
		<br />
		<div class="form-group">
			<asp:Label ID="Label2" runat="server" Text="Surname"  CssClass="col-sm-2"></asp:Label>
			<asp:TextBox ID="TextBox2" onKeyDown="if (window.event.keyCode==13) {ImageButton1_Click}" runat="server"  CssClass="col-sm-10"></asp:TextBox>
		</div>
		<br />
		<br />
		<div class="form-group">
			<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/LabWeek3Pic1.png" height="30"  CssClass="col-sm-6"/>
			<asp:Button ID="Button1" runat="server" Text="Reset"  CssClass="col-sm-6"/>
		</div>
		<br />
		<hr />
		<br />
		<br />
		<div class="form-group">
			<asp:Label ID="result" runat="server" Text="Label"  CssClass="col-sm-12"></asp:Label>
		</div>
	</div>
</asp:Content>


