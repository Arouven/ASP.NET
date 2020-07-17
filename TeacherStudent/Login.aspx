<%@ Page Title="Register / Login" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="Login.aspx.vb" Inherits="TeacherStudent.Login" %>

<asp:Content ID="head1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
	<!-- login Stylesheet -->
	<link rel="stylesheet" href="css/loginStyle.css">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<br />
	<br />
	<br />
	<%--	<div class="row">
		<div class="col-md-8">
			<section id="loginForm">
				<div class="form-horizontal">
					<h4>Use a local account to log in.</h4>
					<hr />
					<asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
						<p class="text-danger">
							<asp:Literal runat="server" ID="FailureText" />
						</p>
					</asp:PlaceHolder>
					<div class="form-group">
						<asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">User name</asp:Label>
						<div class="col-md-10">
							<asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
							<asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="text-danger" ErrorMessage="The user name field is required." />
						</div>
					</div>
					<div class="form-group">
						<asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
						<div class="col-md-10">
							<asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
							<asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-offset-2 col-md-10">
							<div class="checkbox">
								<asp:CheckBox runat="server" ID="RememberMe" />
								<asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-offset-2 col-md-10">
							<asp:Button runat="server" Text="Log in" CssClass="logreg"  />
						</div>
					</div>
				</div>
				<p>
					<asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register</asp:HyperLink>
					if you don't have a local account.
				</p>
			</section>
		</div>
	</div>--%>






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
				<asp:ListItem>Administrator</asp:ListItem>
				<asp:ListItem>Tutor</asp:ListItem>
				<asp:ListItem>Student</asp:ListItem>
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
