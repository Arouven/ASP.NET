<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Task5.aspx.vb" Inherits="LearnAspCode.Task5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostback="True">
                <asp:ListItem>Image.jpg</asp:ListItem>
                <asp:ListItem>Anim.gif</asp:ListItem>
                <asp:ListItem>Video.mp4</asp:ListItem>
            </asp:DropDownList>
        </div>
    </form>
</body>
</html>
