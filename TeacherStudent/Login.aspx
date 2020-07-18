<%@ Page Title="Register / Login" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="Login.aspx.vb" Inherits="TeacherStudent.Login" %>

<asp:Content ID="head1" ContentPlaceHolderID="headPlaceHolder1" runat="server"></asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<br />
	<br />
	<br />







	<div class="form login-page">
		<div class="register-form">
			<h4>Register</h4>
			<br />
			<asp:TextBox ID="TextBoxUsernameReg" runat="server" placeholder="Username" CssClass="tbInput" />
			<asp:TextBox ID="TextBoxPasswordReg" runat="server" TextMode="Password" placeholder="Password" CssClass="tbInput" />
			<asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email" placeholder="Email adderss" CssClass="tbInput" />


			<asp:TextBox runat="server" placeholder="Email adderss" />



			<br />
			<asp:RadioButtonList ID="RadioButtonList2" runat="server" Style="text-align: left">
				<asp:ListItem Selected="True">Student</asp:ListItem>
				<asp:ListItem>Tutor</asp:ListItem>
				<asp:ListItem>Administrator</asp:ListItem>
			</asp:RadioButtonList>
			<br />

			<br />


			<asp:Button ID="ButtonRegister" CssClass="logreg" runat="server" Text="create" />

			<p class="message">Already registered? <a href="#">Sign In</a></p>
		</div>















		<div class="login-form">
			<h4>Login</h4>
			<br />
			<asp:TextBox ID="TextBoxUsernameLog" runat="server" placeholder="Username" CssClass="tbInput"></asp:TextBox>
			<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxUsernameLog" CssClass="text-danger" ErrorMessage="The user name field is required." />
			<asp:TextBox ID="TextBoxPasswordLog" runat="server" TextMode="Password" placeholder="Password" CssClass="tbInput"></asp:TextBox>
			<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxPasswordLog" CssClass="text-danger" ErrorMessage="The password field is required." />
			<br />
			<asp:RadioButtonList ID="RadioButtonList1" runat="server" Style="text-align: left">
				<asp:ListItem Selected="True">Student</asp:ListItem>
				<asp:ListItem>Tutor</asp:ListItem>
				<asp:ListItem>Administrator</asp:ListItem>
			</asp:RadioButtonList>
			<asp:Button ID="ButtonLogin" CssClass="logreg" runat="server" Text="login" />
			<br />
			<br />
			<div>
				<asp:CheckBox runat="server" ID="RememberMe" Text="Remember me?" />
			</div>
			<p class="message">Not registered? <a href="#">Create an account</a></p>
		</div>
		<br />
		<asp:Label ID="lblStatus" runat="server"></asp:Label>
	</div>
</asp:Content>
