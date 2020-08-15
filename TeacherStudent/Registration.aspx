<%@ Page Title="Registration" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="Registration.aspx.vb" Inherits="TeacherStudent.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
	<style>
		label.error, span.error {
			color: red;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/gallery1.jpg);">
		<div class="bradcumbContent">
			<h2>Register</h2>
		</div>
	</div>
	<asp:HiddenField ID="HiddenFieldCourseId" runat="server" />
	<asp:HiddenField ID="HiddenFieldTutorId" runat="server" />
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
						<asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" /></asp:Label>
					<%--<asp:TextBox ID="textBox1" CssClass="form-control" placeholder="Date of Birth" TextMode="Date" SetFocusOnError="True" runat="server"></asp:TextBox>--%>
				</div>
				<div class="form-group">
					<asp:CheckBox runat="server" ID="CheckBoxRegister" Text="Remember me?" Checked="true" />
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
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">

	<script src='<%= ResolveClientUrl("~/js/jquery/validate/jquery.validate.js") %>'></script>

	<script src='<%= ResolveClientUrl("~/js/jquery/validate/additional-methods.js") %>'></script>
	<script>

		var validator = $('#myform').validate({
		});


		$(`#<%=TextBoxConfirmReg.ClientID%>`).rules('add', {
			equalTo: $(`#<%=TextBoxPasswordReg.ClientID%>`),
			messages: {
				equalTo: "Password Not Match"
			}
		});
		$.validator.addMethod('filesize', function (value, element, param) {
			return this.optional(element) || (element.files[0].size <= param * 1000000)
		}, 'File size must be less than {0} MB');
		$(`#<%=FileUpload1.ClientID%>`).rules('add', {
			required: true,
			extension: "jpg|jpeg|png",
			filesize: 3,
			messages: {
				required: "Insert a file..."
			}
		});


		$(`#<%=TextBoxUsernameReg.ClientID%>`).focus(function () {
			var firstName = $(`#<%=TextBoxFirstnameReg.ClientID%>`).val();
			var lastName = $(`#<%=TextBoxLastnameReg.ClientID%>`).val();
			if (firstName && lastName && !this.value) {
				this.value = firstName + " " + lastName;
			}
		});
		$(document).ready(function () {
			$(`#<%=TextBoxUsernameReg.ClientID%>`).keyup(function () {
				var userName = $(this).val();
				$('#existMessage').text('');
				if (userName.length >= 1) {
					$.ajax({
						url: 'WebServiceUserNameExist.asmx/UserNameExists',
						method: 'post',
						data: { userName: userName },
						dataType: 'json',
						success: function (data) {
							var divElement = $('#existMessage');
							if (data.UserNameInUse1) {
								divElement.text(userName + ' already in use');
								divElement.css('color', 'red');
								$(`#<%=ButtonRegister.ClientID%>`).attr("disabled", true);
							}
							else {
								divElement.text(userName + ' available')
								divElement.css('color', 'green');
								$(`#<%=ButtonRegister.ClientID%>`).attr("disabled", false);
							}
						},
						error: function (err) {
							alert(err);
						}
					});
				}
			});
		});


	</script>
</asp:Content>
