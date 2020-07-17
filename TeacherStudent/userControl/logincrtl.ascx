<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="logincrtl.ascx.vb" Inherits="LearnAspCode.logincrtl" %>

<asp:Label ID="lblUsername" runat="server"><span class="glyphicon glyphicon-user"></span> User Name</asp:Label>
<div class="div_texbox">
	<asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
	<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="admin" SetFocusOnError="true" ErrorMessage="*" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
</div>
<asp:Label ID="lblPassword" runat="server" Text="Password"><span class="glyphicon glyphicon-eye-open"></span> Password</asp:Label>
<div class="div_texbox">
	<asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
	<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="admin" SetFocusOnError="true" ErrorMessage="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
</div>
<asp:CheckBox ID="chkremem" runat="server" Text="Remember me" />