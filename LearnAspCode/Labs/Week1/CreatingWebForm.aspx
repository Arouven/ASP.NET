<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CreatingWebForm.aspx.vb" Inherits="LearnAspCode.CreatingWebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<div class="form-horizontal">
			<h4>Working with Server controls</h4>
			<br /><br />
			<hr />
			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">First name</asp:Label>
				<asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" />
			</div>
			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Surname</asp:Label>
				<asp:TextBox runat="server" ID="txtSurname" CssClass="form-control" />
			</div>
			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">User name</asp:Label>
				<asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" />
			</div>
			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Email</asp:Label>
				<asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" textmode = "Email"/>
			</div>
			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Mobile number</asp:Label>
				<asp:TextBox runat="server" ID="txtMobileNumber" CssClass="form-control" textmode = "Phone"/>
			</div>
			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">zip code</asp:Label>
				<asp:TextBox runat="server" ID="txtZipCode" CssClass="form-control" textmode = "Number" />
			</div><br /><br />






			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Password</asp:Label>
				<asp:TextBox runat="server" ID="txtPass" CssClass="form-control" textmode = "password" />
			</div>
			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Confirm Password</asp:Label>
				<asp:TextBox runat="server" ID="txtConfPass" CssClass="form-control" textmode = "password"/>
			</div><br /><br />





			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Date of Birth</asp:Label>
				<asp:TextBox runat="server" ID="txtDOB" CssClass="form-control" textmode = "DateTimeLocal"/>
			</div><br /><br />





			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Country</asp:Label>
				<asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control">
					<asp:ListItem>Mauritius</asp:ListItem>
					<asp:ListItem>Rodrigues</asp:ListItem>
					<asp:ListItem>Reunion</asp:ListItem>
				</asp:DropDownList>
			</div><br /><br />





			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Resident</asp:Label>
				<div class="col-md-8">
					<asp:RadioButton  AutoPostBack="true" ID="rbLocal" Text="Local" GroupName="Source" runat="server" />
					<asp:RadioButton   AutoPostBack="true" ID="rbForeign" Text="Foreign" GroupName="Source" runat="server" />
				</div>
			</div><br /><br />





			<div class="form-group">
				<div class="col-md-8">
					<asp:CheckBox ID="ckEmail" runat="server" AutoPostback="True" Text="To receive emails" />           
				</div>
			</div><br /><br />





			<hr />
			<div class="form-group">
				<div class="col-md-offset-2 col-md-8">
					<asp:Button runat="server" Text="Submit" CssClass="btn btn-block btn-primary" />
					<asp:Button runat="server" Text="Cancel" CssClass="btn btn-block btn-warning" />
				</div>
			</div>
		</div>
	</form>
</body>
</html>
