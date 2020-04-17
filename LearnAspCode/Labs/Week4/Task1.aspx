<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task1.aspx.vb" Inherits="LearnAspCode.Task14" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script src="https://www.google.com/recaptcha/api.js?render=SITE_KEY_HERE"></script>        
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<br />
	<br />
	<asp:Label ID="Label2" runat="server" Text="First Name: "></asp:Label>
	<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
	<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please enter first name" ForeColor="Red"></asp:RequiredFieldValidator>
	<br />

	<asp:Label ID="Label4" runat="server" Text="Last Name: "></asp:Label>
	<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
	<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please enter last name" ForeColor="Red"></asp:RequiredFieldValidator>
	<br />

	<asp:Label ID="Label5" runat="server" Text="User Name: "></asp:Label>
	<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
	<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="Please enter user name" ForeColor="Red"></asp:RequiredFieldValidator>
	<br />

	<asp:Label ID="Label6" runat="server" Text="email: "></asp:Label>
	<asp:TextBox ID="TextBox2" runat="server" TextMode="Email"></asp:TextBox>
	<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please enter email" ForeColor="Red"></asp:RequiredFieldValidator>
	<br />

	<asp:Label ID="Label1" runat="server" Text="Password: "></asp:Label>
	<asp:TextBox ID="password" runat="server"></asp:TextBox>
	<asp:RequiredFieldValidator ID="pass" runat="server" ControlToValidate="password" ErrorMessage="Please enter a password" ForeColor="Red"></asp:RequiredFieldValidator>
	<br />

	<asp:Label ID="Label3" runat="server" Text="Confirm Password: "></asp:Label>
	<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
	<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please confirm password" ForeColor="Red"></asp:RequiredFieldValidator>
	<asp:CompareValidator ID="CompareValidator1" runat="server"
		ControlToCompare="password" ControlToValidate="TextBox1" ErrorMessage="Password not match" ForeColor="Red">
	</asp:CompareValidator>
	<br />
	<script>
		grecaptcha.ready(function () {
			grecaptcha.execute('SITE_KEY_HERE', { action: 'homepage' }).then(function (token) {
				document.getElementById("g-recaptcha-response").value = token;
			});
		});
	</script>
	<asp:Button ID="Button1" runat="server" Text="Button" />
</asp:Content>
