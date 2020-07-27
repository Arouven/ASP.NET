<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="WebUserControlLogin.ascx.vb" Inherits="TeacherStudent.WebUserControlLogin" %>
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