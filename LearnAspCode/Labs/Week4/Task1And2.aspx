<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task1And2.aspx.vb" Inherits="LearnAspCode.task16" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
	<script src="https://www.google.com/recaptcha/api.js?render=SITE_KEY_HERE"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<h1 style="text-align: center">Registration Form</h1>
	</div>
	<br />
	<div>
		<asp:TextBox ID="textBoxFirstName" CssClass="form-control" placeholder="First Name" runat="server"></asp:TextBox>
		<asp:RequiredFieldValidator ID="requiredFieldVallidatorFirstname" runat="server" SetFocusOnError="true" ErrorMessage="Please enter first name" ForeColor="Red" ControlToValidate="textBoxFirstName"></asp:RequiredFieldValidator>

		<asp:TextBox ID="textBoxSurName" CssClass="form-control" placeholder="Surname" runat="server"></asp:TextBox>
		<asp:RequiredFieldValidator ID="requiredFieldVallidatorSurname" runat="server" SetFocusOnError="true" ErrorMessage="Please enter last name" ForeColor="Red" ControlToValidate="textBoxSurName"></asp:RequiredFieldValidator>

		<asp:TextBox ID="textBoxUserName" CssClass="form-control" placeholder="Username" runat="server"></asp:TextBox>
		<asp:RequiredFieldValidator ID="requiredFieldVallidatorUsername" runat="server" SetFocusOnError="true" ErrorMessage="Please enter user name" ForeColor="Red" ControlToValidate="textBoxUserName"></asp:RequiredFieldValidator>

		<asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
		<asp:RequiredFieldValidator ID="RFVPassword" runat="server" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Password Required" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
		<asp:RegularExpressionValidator ID="REVPassword" runat="server" ForeColor="Red" ValidateEmptyText="true" ErrorMessage="Password must be between 5 and 10 characters" ControlToValidate="txtPassword" ValidationExpression="[0-9a-zA-Z]{5,10}" SetFocusOnError="True"></asp:RegularExpressionValidator>
		<asp:TextBox ID="txtConfirmPassword" CssClass="form-control" placeholder="Confirm Password" runat="server"></asp:TextBox>
		<asp:CompareValidator ID="CVConfirmPassword" runat="server" ForeColor="Red" ErrorMessage="Password not match" ControlToValidate="txtPassword" ValueToCompare="txtPassword" ControlToCompare="txtConfirmPassword" SetFocusOnError="True"></asp:CompareValidator>

		<asp:TextBox ID="textBoxEmail" CssClass="form-control" placeholder="Email" TextMode="Email" runat="server"></asp:TextBox>
		<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="textBoxEmail" ErrorMessage="Please enter email" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

		<asp:TextBox ID="textBoxPhoneNumber" CssClass="form-control" placeholder="Phone Number" TextMode="Phone" runat="server"></asp:TextBox>
		<asp:RegularExpressionValidator ID="REVPhonenumber" runat="server" ErrorMessage="Invalid Phone Number" ForeColor="Red" SetFocusOnError="True" ControlToValidate="textBoxPhoneNumber" ValidationExpression="\d{8}"></asp:RegularExpressionValidator>
		<br />

		<asp:TextBox ID="textBoxZipCode" CssClass="form-control" placeholder="Zip Code" TextMode="Number" runat="server"></asp:TextBox>
		<asp:RegularExpressionValidator ID="REVZipcode" runat="server" ForeColor="Red" ErrorMessage="5 digits" ControlToValidate="textBoxZipCode" ValidationExpression="[0-9a-zA-Z]{5}" SetFocusOnError="True"></asp:RegularExpressionValidator>
		<br />

		<asp:TextBox ID="textBoxDOB" CssClass="form-control" placeholder="Date of Birth" TextMode="Date" SetFocusOnError="True" runat="server"></asp:TextBox>
		<br />

		<asp:DropDownList CssClass="form-control" ID="ddCountry" runat="server">
			<asp:ListItem Selected="True">Choose Country</asp:ListItem>
			<asp:ListItem Value="1">Mauritius</asp:ListItem>
			<asp:ListItem Value="2">Rodrigues</asp:ListItem>
			<asp:ListItem Value="3">Reunion</asp:ListItem>
		</asp:DropDownList>
		<asp:CustomValidator ID="CVCountryDropDown" runat="server" ControlToValidate="ddCountry" OnServerValidate="CVCountryDropDown_ServerValidate" ForeColor="Red" ErrorMessage="Select a Country"></asp:CustomValidator>

		<br />
		<script>
			grecaptcha.ready(function () {
				grecaptcha.execute('SITE_KEY_HERE', { action: 'homepage' }).then(function (token) {
					document.getElementById("g-recaptcha-response").value = token;
				});
			});
		</script>
		<br />

		<asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Text="Submit" Style="float: right" />
		<asp:ValidationSummary HeaderText="Problems with the following field(s):" runat="server" ID="ValidationSummary1" ShowMessageBox="True" ShowSummary="False" />
	</div>
</asp:Content>
