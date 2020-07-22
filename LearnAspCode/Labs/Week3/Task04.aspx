<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task04.aspx.vb" Inherits="LearnAspCode.Task41" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Create a form with First name and Surname fields. Display the details entered in the form once you submit using an ImageButton control. Add a label to display the results.</h1>
	<br />
	<div>
		<div>
			<asp:Label ID="Label1" runat="server" Text="Firstname"></asp:Label>
			<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
		</div>
		<br />
		<div>
			<asp:Label ID="Label2" runat="server" Text="Surname"></asp:Label>
			<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
		</div>
		<br />
		<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/LabWeek3Pic1.png" />
		<br />
		<hr />
		<br />
		<br />
		<div>
			<asp:Label ID="result" runat="server" Text="Label"></asp:Label>
		</div>
	</div>
</asp:Content>


