<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Task2.aspx.vb" Inherits="LearnAspCode.Task21" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:CheckBox ID="CheckBox1" OnCheckedChanged="CheckBox1_CheckedChanged" runat="server" AutoPostback="True"/>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
