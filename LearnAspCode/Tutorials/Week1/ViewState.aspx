<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ViewState.aspx.vb" Inherits="LearnAspCode.ViewState1" %>

<!DOCTYPE html>

<script runat="server">
    Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs)
        lblCounter.Text = (Int32.Parse(lblCounter.Text) + 1).ToString()
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show View State</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            ASP.NET Control:
            <asp:TextBox ID="txtAspCont" runat="server"></asp:TextBox>
            <br />
            <br />
            HTML Control :
            <input id="txtHtmlCont" type="text" runat="server" />
            <br />
            <br />
            <asp:Button
                ID="btnAdd"
                Text="Add"
                OnClick="btnAdd_Click"
                runat="server" />
            <asp:Label
                ID="lblCounter"
                Text="0"
                runat="server" />
        </div>
    </form>
</body>
</html>
