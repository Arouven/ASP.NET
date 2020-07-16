<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DisablingViewState.aspx.vb" Inherits="LearnAspCode.DisablingViewState1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Disable View State</title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			Label 1:
            <asp:Label ID="Label1" EnableViewState="false" Text="0" runat="server" />
			<br />
			Label 2:
            <asp:Label ID="Label2" Text="0" runat="server" />
			<br />
			<br />
			<asp:Button ID="btnAdd" Text="Add one" OnClick="btnAdd_Click" runat="server" />
		</div>
	</form>
</body>
</html>
