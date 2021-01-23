<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="HKUpdateProfile.aspx.vb" Inherits="JP.HKUpdateProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
		@font-face {
			font-family: "Glyphicons Halflings";
			src: url("../fonts/glyphicons-halflings-regular.eot");
			src: url("../fonts/glyphicons-halflings-regular.eot?#iefix") format("embedded-opentype"), url("../fonts/glyphicons-halflings-regular.woff2") format("woff2"), url("../fonts/glyphicons-halflings-regular.woff") format("woff"), url("../fonts/glyphicons-halflings-regular.ttf") format("truetype"), url("../fonts/glyphicons-halflings-regular.svg#glyphicons_halflingsregular") format("svg");
		}

		.glyphicon {
			position: relative;
			top: 1px;
			display: inline-block;
			font-family: "Glyphicons Halflings";
			font-style: normal;
			font-weight: 400;
			line-height: 1;
			-webkit-font-smoothing: antialiased;
			-moz-osx-font-smoothing: grayscale;
		}

		.glyphicon-trash:before {
			content: "\e020";
		}



		.tbldiv {
			margin: auto;
			width: 100%;
		}

		th {
			background: #4CAF50;
			color: White;
		}

		label {
			font-weight: bold;
		}


			label.error, span.error {
				color: red;
			}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="breadcumb-area bg-img">
		<div class="bradcumbContent">
			<h2 style="text-align:center">Update Profile</h2>
			<asp:Image ID="ImageTutorProfile" CssClass="pull-right" runat="server" Style="display: block; margin-left: auto; width: 100px; height: 100px; border-radius: 50%;" AlternateText="Profile Picture" />
		</div>
	</div>
	<asp:HiddenField ID="HiddenFieldCourseId" runat="server" />
	<asp:HiddenField ID="HiddenFieldTutorId" runat="server" />
	<br />
	<br />
	<br />
	<div class="section-padding-100-0">
		<div class="register-page" style="margin: auto; width: 80%;">
			<div class="form register-form">
				<br />
				<div class="form-group">
					<asp:TextBox ID="TextBoxFirstnameReg" runat="server" placeholder="Firstname" CssClass="tbInput" required minlength="2" />
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxFirstnameReg" CssClass="text-danger" ValidationGroup="registerGroup" ErrorMessage="The first name field is required." />
				</div>
				<div class="form-group">
					<asp:TextBox ID="TextBoxLastnameReg" runat="server" placeholder="Lastname" CssClass="tbInput" required minlength="2" />
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxLastnameReg" CssClass="text-danger" ValidationGroup="registerGroup" ErrorMessage="The last name field is required." />
				</div>
				<div class="form-group">
					<asp:TextBox ID="TextBoxUsernameReg" runat="server" placeholder="Username" CssClass="tbInput" required minlength="5" />
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxUsernameReg" CssClass="text-danger" ValidationGroup="registerGroup" ErrorMessage="The user name field is required." />
					<div id="existMessage"></div>
					<asp:RegularExpressionValidator ID="RegularExpressionValidatorUsername" ControlToValidate="TextBoxUsernameReg" ValidationExpression="^[a-zA-Z]{5,}$" runat="server" CssClass="text-danger" ValidationGroup="registerGroup" ErrorMessage="Username must be minimum 5 characters"></asp:RegularExpressionValidator>
				</div>
				<div class="form-group">
					<asp:TextBox ID="TextBoxPasswordReg" runat="server" TextMode="Password" placeholder="Password" CssClass="tbInput" required />
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxPasswordReg" CssClass="text-danger" ValidationGroup="registerGroup" ErrorMessage="The password field is required." />
					<asp:RegularExpressionValidator ID="REVPassword" runat="server" CssClass="text-danger" ValidateEmptyText="true" ErrorMessage="Password Not Strong Enougth" ControlToValidate="TextBoxPasswordReg" ValidationGroup="registerGroup" ValidationExpression="^(?=.*\d{2})(?=.*[a-zA-Z]{2}).{6,}$" SetFocusOnError="True"></asp:RegularExpressionValidator>
				</div>
				<div class="form-group">
					<asp:TextBox ID="TextBoxConfirmReg" runat="server" TextMode="Password" placeholder="Confirm Password" CssClass="tbInput" required />
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxConfirmReg" CssClass="text-danger" ValidationGroup="registerGroup" ErrorMessage="The password not match." />
					<asp:CompareValidator ID="CVConfirmPassword" runat="server" ForeColor="Red" ValidationGroup="registerGroup" ErrorMessage="Password not match" ControlToValidate="TextBoxPasswordReg" ValueToCompare="TextBoxPasswordReg" ControlToCompare="TextBoxConfirmReg" SetFocusOnError="True"></asp:CompareValidator>
				</div>
				<div class="form-group">
					<asp:TextBox ID="TextBoxAddress" runat="server" placeholder="Adderss" CssClass="tbInput" required />
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxAddress" CssClass="text-danger" ValidationGroup="registerGroup" ErrorMessage="Address field is required." />
				</div>
				<div class="form-group">
					<asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email" placeholder="Email adderss" CssClass="tbInput" required />
					<asp:RequiredFieldValidator ID="RFVEmail" runat="server" ValidationGroup="registerGroup" ControlToValidate="TextBoxEmail" ErrorMessage="Please enter email" CssClass="text-danger" SetFocusOnError="True"></asp:RequiredFieldValidator>
				</div>
				<div class="form-group">
					<asp:TextBox ID="textBoxPhoneNumber" CssClass="tbInput" placeholder="Phone Number" TextMode="Phone" runat="server" required></asp:TextBox>
					<asp:RegularExpressionValidator ID="REVPhonenumber" runat="server" ValidationGroup="registerGroup" ErrorMessage="Invalid Phone Number" CssClass="text-danger" SetFocusOnError="True" ControlToValidate="textBoxPhoneNumber" ValidationExpression="\d{8}"></asp:RegularExpressionValidator>
				</div>
				<div class="form-group">
					<asp:TextBox ID="textBoxDOB" CssClass="tbInput" placeholder="Date of Birth" TextMode="Date" SetFocusOnError="True" runat="server" required></asp:TextBox>
				</div>
				<div class="form-group">
					<asp:Label ID="Label1" runat="server" Text="Upload picture">
						<asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />if there is nothing your old picture will be talken</asp:Label>
					<%--<asp:TextBox ID="textBox1" CssClass="form-control" placeholder="Date of Birth" TextMode="Date" SetFocusOnError="True" runat="server"></asp:TextBox>--%>
				</div>



				<asp:Button ID="ButtonRegister" ValidationGroup="registerGroup" CssClass="logregBtn" runat="server" Text="Update" OnClick="ButtonRegister_Click" />

			</div>
			<asp:Label ID="lblStatus" runat="server"></asp:Label>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
