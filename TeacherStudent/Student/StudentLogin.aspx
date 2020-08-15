<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="StudentLogin.aspx.vb" Inherits="TeacherStudent.StudentLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
	<link rel="stylesheet" href="~/css/loginStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



	<div class="mystudent">
		<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/bg-1.jpg);">
			<div class="bradcumbContent">
				<h2>Student Login</h2>
			</div>
		</div>
		<div class="section-padding-100-0">
			<div class="form" style="margin: auto; width: 500px; border-radius: 3px; border: solid; padding: 10px;">
				<div class="form-group">
					<br />
					Student Login
				</div>
				<div class="form-group">
					<asp:TextBox ID="TextBoxUsernameStudentLog" runat="server" placeholder="Username" CssClass="tbInput"></asp:TextBox>
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxUsernameStudentLog" CssClass="text-danger" ValidationGroup="studentLoginGroup" ErrorMessage="The user name field is required." />
				</div>
				<div class="form-group">
					<asp:TextBox ID="TextBoxPasswordStudentLog" runat="server" TextMode="Password" placeholder="Password" CssClass="tbInput"></asp:TextBox><br />
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxPasswordStudentLog" CssClass="text-danger" ValidationGroup="studentLoginGroup" ErrorMessage="The password field is required." />
				</div>
				<asp:Button ID="ButtonStudentLogin" OnClick="ButtonStudentLogin_Click" ValidationGroup="studentLoginGroup" CssClass="logregBtn" runat="server" Text="login" />
				<div>
					<br />
					<asp:CheckBox runat="server" ValidationGroup="studentLoginGroup" ID="StudentRememberMe" Text="Remember me?" Checked="true" />
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
