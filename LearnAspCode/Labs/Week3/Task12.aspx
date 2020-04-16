<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Task12.aspx.vb" Inherits="LearnAspCode.Task12" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<asp:Label ID="Label1" runat="server" Text="Flight Registration System"></asp:Label><br />
		<br />
		<asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
			<asp:View ID="View1" runat="server">
				<asp:Label ID="Label2" runat="server" Text="Step 1"></asp:Label>
				<br />
				<br />
				<asp:Label ID="Label3" runat="server" Text="Number of Adults"></asp:Label>
				<br />
				<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
				<br />
				<br />
				<asp:Label ID="Label4" runat="server" Text="Number Of Childs"></asp:Label>
				<br />
				<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
				<br />
				<br />
				<asp:Button ID="Button1" runat="server" Text="Next" />
			</asp:View>

			<asp:View ID="View2" runat="server">
				<asp:Label ID="Label5" runat="server" Text="Step 2"></asp:Label>
				<br />
				<br />
				<asp:Label ID="Label6" runat="server" Text="Date of Departure"></asp:Label>
				<br />
				<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
				<br />
				<br />
				<asp:Label ID="Label7" runat="server" Text="Date of Return"></asp:Label>
				<br />
				<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
				<br />
				<br />
				<asp:Button ID="Button2" runat="server" Text="Next" />
			</asp:View>

			<asp:View ID="View3" runat="server">
				<asp:Label ID="Label8" runat="server" Text="Label"></asp:Label><br />
				<br />
				<asp:Label ID="Label9" runat="server" Text="Label"></asp:Label><br />
				<br />
				<asp:Label ID="Label10" runat="server" Text="Label"></asp:Label><br />
				<br />
				<asp:Label ID="Label11" runat="server" Text="Label"></asp:Label><br />
				<br />
			</asp:View>
		</asp:MultiView>
	</form>
</body>
</html>
