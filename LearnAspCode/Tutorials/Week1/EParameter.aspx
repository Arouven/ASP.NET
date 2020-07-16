<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EParameter.aspx.vb" Inherits="LearnAspCode.EParameter1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Show EventArgs</title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<asp:ImageButton ID="btnhouse" OnClick="btnhouse_Click" runat="server"/>
			<br />
			X Coordinate:
            <asp:Label ID="lblX" runat="server" />
			<br />
			Y Coordinate:
            <asp:Label ID="lblY" runat="server" />
		</div>
	</form>
</body>
</html>
