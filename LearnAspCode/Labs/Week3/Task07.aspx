﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Task07.aspx.vb" Inherits="LearnAspCode.Task71" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<p>
			<asp:Button ID="Button1" runat="server" Text="Generate Random Image" />
		</p>
		<div>
			<asp:Image ID="Image1" runat="server" />
		</div>		
	</form>
</body>
</html>