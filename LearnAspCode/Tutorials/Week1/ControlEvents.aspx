<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ControlEvents.aspx.vb" Inherits="LearnAspCode.ControlEvents1" %>

<!DOCTYPE html>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Show Button Click</title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<asp:Button ID="btnSubmit" Text="Click Here" OnClick="btnSubmit_Click" runat="server" />
			<br />
			<br />
			<asp:Label ID="Label1" runat="server" />
		</div>
	</form>
</body>
</html>
