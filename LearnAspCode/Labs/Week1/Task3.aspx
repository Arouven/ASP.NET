﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Task3.aspx.vb" Inherits="LearnAspCode.Task3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="I can be hidden and be shown again."></asp:Label>
        <div>
            <asp:Button ID="Button1" runat="server" Text="Show Label" />
            <asp:Button ID="Button2" runat="server" Text="Hide Label" />
        </div>
    </form>
</body>
</html>
