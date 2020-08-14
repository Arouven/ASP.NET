<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="AdminLogin.aspx.vb" Inherits="TeacherStudent.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">

	<link rel="stylesheet" href="~/css/loginStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



	<div class="mystudent">
		<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/bg-1.jpg);">
			<div class="bradcumbContent">
				<h2>Admin Login</h2>
			</div>
		</div>
		<div class="section-padding-100-0">
			<div class="form" style="margin: auto; width: 500px; border-radius: 3px; border: solid; padding: 10px;">
				<div class="form-group">
					<br />
					Admin Login
				</div>
				<div class="form-group">
					<asp:TextBox ID="TextBoxUsernameAdminLog" runat="server" placeholder="Username" CssClass="tbInput"></asp:TextBox>
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxUsernameAdminLog" CssClass="text-danger" ValidationGroup="adminLoginGroup" ErrorMessage="The user name field is required." />
				</div>
				<div class="form-group">
					<asp:TextBox ID="TextBoxPasswordAdminLog" runat="server" TextMode="Password" placeholder="Password" CssClass="tbInput"></asp:TextBox><br />
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxPasswordAdminLog" CssClass="text-danger" ValidationGroup="adminLoginGroup" ErrorMessage="The password field is required." />
				</div>
				<asp:Button ID="ButtonAdminLogin" OnClick="ButtonAdminLogin_Click" ValidationGroup="adminLoginGroup" CssClass="logregBtn" runat="server" Text="login" />
				<div>
					<br />
					<asp:CheckBox runat="server" ID="AdminRememberMe" ValidationGroup="adminLoginGroup" Text="Remember me?" />
				</div>
				<div class="form-group">
					<p class="message">Not registered? <a runat="server" href="~/Registration.aspx">Create an account</a></p>
					<p class="message">Forgot <a href="#">Password?</a></p>
				</div>
			</div>
			<asp:Label ID="lblStatus" runat="server"></asp:Label>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
