<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Task9.aspx.vb" Inherits="LearnAspCode.Task9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<div style="height: 564px">
			<asp:Panel ID="Panel1" runat="server" Height="264px" Width="514px">
				<asp:Label ID="Label1" runat="server" Text="Select your favourite programming language:"></asp:Label>
				<asp:RadioButtonList ID="RadioButtonList1" runat="server"></asp:RadioButtonList>
				<asp:Button ID="Button1" runat="server" OnClientClick="Button1_Click" Text="Button" autopostback="false" />
				<br />
				<br />
				<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
			</asp:Panel>
			<br />
			<br />
			<br />
		</div>
	</form>
</body>
</html>
