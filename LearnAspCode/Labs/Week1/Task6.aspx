<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Task6.aspx.vb" Inherits="LearnAspCode.Task6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" TabIndex="1" ValidationGroup="vgGroup" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
				<asp:ListItem>VB.NET</asp:ListItem>
				<asp:ListItem>C#</asp:ListItem>
				<asp:ListItem>PHP</asp:ListItem>
				<asp:ListItem>NODE.JS</asp:ListItem>
			</asp:RadioButtonList>
		</div>
		<p>
			<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
		</p>
		<p>
			<asp:Button ID="Button1" runat="server" Text="Button" />
		</p>
	</form>
</body>
</html>
