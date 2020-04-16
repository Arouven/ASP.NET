<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Task10.aspx.vb" Inherits="LearnAspCode.Task10" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<div class="products">
			<asp:Label ID="Label1" runat="server" Text="Products" Style="text-align: left"></asp:Label>
			<br />
			<br />
			<asp:CheckBoxList ID="CheckBoxList1" SelectionMode="multiple" runat="server" Style="text-align: left">
				<asp:ListItem>Juice</asp:ListItem>
				<asp:ListItem>Soda</asp:ListItem>
				<asp:ListItem>Cola</asp:ListItem>
				<asp:ListItem>Beer</asp:ListItem>
				<asp:ListItem>Alcohol</asp:ListItem>
			</asp:CheckBoxList>
			<asp:Button ID="Button1" runat="server" Text="Add" />
		</div>
		<div class="shopping">
			<asp:Label ID="Label2" runat="server" Text="Shopping Cart" Style="text-align: right"></asp:Label>
			<br />
			<br />
			<asp:ListBox ID="ListBox1" runat="server" Style="text-align: left" SelectionMode="Multiple" Width="136px"></asp:ListBox>
			<br />
			<asp:Button ID="Button2" runat="server" Text="Remove" />
		</div>
	</form>
</body>
</html>
