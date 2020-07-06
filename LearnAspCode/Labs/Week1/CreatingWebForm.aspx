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
			<hr />
			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">First name</asp:Label>
				<div class="col-md-8">
					<asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" />
				</div>
			</div>
			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Surname</asp:Label>
				<div class="col-md-8">
					<asp:TextBox runat="server" ID="txtSurname" CssClass="form-control" />
				</div>
			</div>
			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">User name</asp:Label>
				<div class="col-md-8">
					<asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" />
				</div>
			</div>
			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Email</asp:Label>
				<div class="col-md-8">
					<asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
				</div>
			</div>
			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Mobile number</asp:Label>
				<div class="col-md-8">
					<asp:TextBox runat="server" ID="txtMobileNumber" CssClass="form-control" />
				</div>
			</div>
			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">zip code</asp:Label>
				<div class="col-md-8">
					<asp:TextBox runat="server" ID="txtZipCode" CssClass="form-control" />
				</div>
			</div>





			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Password</asp:Label>
				<div class="col-md-8">
					<asp:TextBox runat="server" ID="txtPass" CssClass="form-control" />
				</div>
			</div>
			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Confirm Password</asp:Label>
				<div class="col-md-8">
					<asp:TextBox runat="server" ID="txtConfPass" CssClass="form-control" />
				</div>
			</div>





			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Date of Birth</asp:Label>
				<div class="col-md-8">
					<asp:TextBox runat="server" ID="txtDOB" CssClass="form-control" />
				</div>
			</div>





			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Country</asp:Label>
				<div class="col-md-8">
					<asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control">
						<asp:ListItem>Mauritius</asp:ListItem>
						<asp:ListItem>Rodrigues</asp:ListItem>
						<asp:ListItem>Reunion</asp:ListItem>
					</asp:DropDownList>
				</div>
			</div>





			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">Local resident or foreign</asp:Label>
				<div class="col-md-8">
					<asp:RadioButton ID="rbLocal" runat="server" CssClass="form-control" />
					<asp:RadioButton ID="rbForeign" runat="server" CssClass="form-control" />
				</div>
			</div>





			<div class="form-group">
				<asp:Label runat="server" CssClass="col-md-2 control-label">To receive emails</asp:Label>
				<div class="col-md-8">
					<asp:CheckBox ID="ckEmail" runat="server" />
				</div>
			</div>





			<hr />
			<div class="form-group">
				<div class="col-md-offset-2 col-md-8">
					<asp:Button runat="server" Text="Submit" CssClass="btn btn-block btn-primary" />
					<asp:Button runat="server" Text="Cancel" CssClass="btn btn-block btn-warning" />
				</div>
				<div class="col-md-offset-2 col-md-8">
				</div>
			</div>
		</div>
	</form>
</body>
</html>
