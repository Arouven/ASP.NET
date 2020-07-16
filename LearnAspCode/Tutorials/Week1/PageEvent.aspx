<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PageEvent.aspx.vb" Inherits="LearnAspCode.PageEvent1" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Show Page Events</title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<asp:Button ID="Button1" Text="Click Here" OnClick="Button1_Click" runat="server" />
			<br />
			<br />
			<asp:Label ID="Label1" runat="server" />
		</div>
	</form>
</body>
</html>
