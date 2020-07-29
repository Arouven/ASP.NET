<%@ Page Title="Registration" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="Registration.aspx.vb" Inherits="TeacherStudent.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
	<style>
		.register-page {
			width: 360px;
			padding: 8% 0 0;
			margin: auto;
		}



			.form .logreg {
				font-family: "Roboto", sans-serif;
				text-transform: uppercase;
				outline: 0;
				background: #4CAF50;
				width: 100%;
				border: 0;
				padding: 15px;
				color: #FFFFFF;
				font-size: 14px;
				cursor: pointer;
			}

				.form .logreg:hover, .form .logreg:active, .form .logreg:focus {
					background: #43A047;
				}

			.form .message {
				margin: 15px 0 0;
				color: #b3b3b3;
				font-size: 12px;
			}

				.form .message a {
					color: #4CAF50;
					text-decoration: none;
				}


		.container {
			position: relative;
			z-index: 1;
			max-width: 300px;
			margin: 0 auto;
		}

			.container:before, .container:after {
				content: "";
				display: block;
				clear: both;
			}

			.container .info {
				margin: 50px auto;
				text-align: center;
			}

				.container .info h1 {
					margin: 0 0 15px;
					padding: 0;
					font-size: 36px;
					font-weight: 300;
					color: #1a1a1a;
				}

				.container .info span {
					color: #4d4d4d;
					font-size: 12px;
				}

					.container .info span a {
						color: #000000;
						text-decoration: none;
					}

					.container .info span .fa {
						color: #EF3B3A;
					}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="register-page">
		<div class="form register-form">
			<h4>Register</h4>
			<br />
			<div class="form-group">
				<asp:TextBox ID="TextBoxFirstnameReg" runat="server" placeholder="Firstname" CssClass="tbInput" />
				<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxFirstnameReg" CssClass="text-danger" ValidationGroup="registerGroup" ErrorMessage="The first name field is required." />
			</div>
			<div class="form-group">
				<asp:TextBox ID="TextBoxLastnameReg" runat="server" placeholder="Lastname" CssClass="tbInput" />
				<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxLastnameReg" CssClass="text-danger" ValidationGroup="registerGroup" ErrorMessage="The last name field is required." />
			</div>
			<div class="form-group">
				<asp:TextBox ID="TextBoxUsernameReg" runat="server" placeholder="Username" CssClass="tbInput" />
				<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxUsernameReg" CssClass="text-danger" ValidationGroup="registerGroup" ErrorMessage="The user name field is required." />
				<br />
				<asp:RegularExpressionValidator ID="RegularExpressionValidatorUsername" ControlToValidate="TextBoxUsernameReg" ValidationExpression="^[a-zA-Z]{5,}$" runat="server" CssClass="text-danger" ValidationGroup="registerGroup" ErrorMessage="Username must be minimum 5 characters"></asp:RegularExpressionValidator>
			</div>
			<div class="form-group">
				<asp:TextBox ID="TextBoxPasswordReg" runat="server" TextMode="Password" placeholder="Password" CssClass="tbInput" />
				<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxPasswordReg" CssClass="text-danger" ValidationGroup="registerGroup" ErrorMessage="The password field is required." />
				<asp:RegularExpressionValidator ID="REVPassword" runat="server" CssClass="text-danger" ValidateEmptyText="true" ErrorMessage="Password Not Strong Enougth" ControlToValidate="TextBoxPasswordReg" ValidationGroup="registerGroup" ValidationExpression="^(?=.*\d{2})(?=.*[a-zA-Z]{2}).{6,}$" SetFocusOnError="True"></asp:RegularExpressionValidator>
			</div>
			<div class="form-group">
				<asp:TextBox ID="TextBoxConfirmReg" runat="server" TextMode="Password" placeholder="Confirm Password" CssClass="tbInput" />
				<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxConfirmReg" CssClass="text-danger" ValidationGroup="registerGroup" ErrorMessage="The password not match." />
				<asp:CompareValidator ID="CVConfirmPassword" runat="server" ForeColor="Red" ValidationGroup="registerGroup" ErrorMessage="Password not match" ControlToValidate="TextBoxPasswordReg" ValueToCompare="TextBoxPasswordReg" ControlToCompare="TextBoxConfirmReg" SetFocusOnError="True"></asp:CompareValidator>
			</div>
			<div class="form-group">
				<asp:TextBox ID="TextBoxAddress" runat="server" placeholder="Adderss" CssClass="tbInput" />
				<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxAddress" CssClass="text-danger" ValidationGroup="registerGroup" ErrorMessage="Address field is required." />
			</div>
			<div class="form-group">
				<asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email" placeholder="Email adderss" CssClass="tbInput" />
				<asp:RequiredFieldValidator ID="RFVEmail" runat="server" ValidationGroup="registerGroup" ControlToValidate="TextBoxEmail" ErrorMessage="Please enter email" CssClass="text-danger" SetFocusOnError="True"></asp:RequiredFieldValidator>
			</div>
			<div class="form-group">
				<asp:TextBox ID="textBoxPhoneNumber" CssClass="tbInput" placeholder="Phone Number" TextMode="Phone" runat="server"></asp:TextBox>
				<asp:RegularExpressionValidator ID="REVPhonenumber" runat="server" ValidationGroup="registerGroup" ErrorMessage="Invalid Phone Number" CssClass="text-danger" SetFocusOnError="True" ControlToValidate="textBoxPhoneNumber" ValidationExpression="\d{8}"></asp:RegularExpressionValidator>
			</div>
			<div class="form-group">
				<asp:TextBox ID="textBoxDOB" CssClass="tbInput" placeholder="Date of Birth" TextMode="Date" SetFocusOnError="True" runat="server"></asp:TextBox>
			</div>
			<div class="form-group">
				<asp:Label ID="Label1" runat="server" Text="Upload picture">
					<asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" /></asp:Label>
				<%--<asp:TextBox ID="textBox1" CssClass="form-control" placeholder="Date of Birth" TextMode="Date" SetFocusOnError="True" runat="server"></asp:TextBox>--%>
			</div>
			<div>
				<asp:CheckBox runat="server" ID="CheckBoxRegister" Text="Remember me?" />
			</div>
			<div class="form-group">
			</div>
			<div class="form-group">
				<asp:RadioButtonList ID="RadioButtonListRegister" runat="server" Style="text-align: left">
					<asp:ListItem Selected="True">Student</asp:ListItem>
					<asp:ListItem>Tutor</asp:ListItem>
				</asp:RadioButtonList>
			</div>
			<asp:Button ID="ButtonRegister" ValidationGroup="registerGroup" CssClass="logregBtn" runat="server" Text="Register" OnClick="ButtonRegister_Click" />
			<div class="form-group">
				<p class="message">Already registered? <a class="openLoginForm" href="#">Sign In</a></p>
			</div>
		</div>
		<asp:Label ID="lblStatus" runat="server"></asp:Label>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
