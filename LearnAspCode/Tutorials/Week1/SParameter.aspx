<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SParameter.aspx.vb" Inherits="LearnAspCode.SParameter1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Button Counters</title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			First Counter:
            <asp:Button ID="Button1" Text="0" OnClick="Button_Click" runat="server" />
			<br />
			<br />
			Second Counter:
            <asp:Button ID="Button2" Text="0" OnClick="Button_Click" runat="server" />
		</div>
	</form>
</body>
</html>
