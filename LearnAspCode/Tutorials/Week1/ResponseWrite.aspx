<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ResponseWrite.aspx.vb" Inherits="LearnAspCode.ResponseWrite1" %>

<!DOCTYPE html>

<script runat="server">
    Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Write("you have wrote: " + TextBox1.Text)
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </div>
    </form>
</body>
</html>
