<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Task04.aspx.vb" Inherits="LearnAspCode.Task41" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<p style="height: 22px; width: 70px">
			<asp:Label ID="Label1" runat="server" Text="Firstname"></asp:Label>
			<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
		</p>
		<p style="width: 71px">
			<asp:Label ID="Label2" runat="server" Text="Surname"></asp:Label>
			<asp:TextBox ID="TextBox2" runat="server" Height="16px" Style="margin-bottom: 4px"></asp:TextBox>
		</p>
			<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/LabWeek3Pic1.png" />
		<p>
			<asp:Label ID="result" runat="server" Text="Label"></asp:Label>
		</p>
	</form>
</body>
</html>
