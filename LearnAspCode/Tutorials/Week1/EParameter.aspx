<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EParameter.aspx.vb" Inherits="LearnAspCode.EParameter1" %>

<!DOCTYPE html>

<script runat="server">
    Sub btnhouse_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs)
        lblX.Text = e.X.ToString()
        lblY.Text = e.Y.ToString()
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show EventArgs</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ImageButton
                ID="btnhouse"
                ImageUrl="~/Images/house.jpg"
                OnClick="btnhouse_Click"
                runat="server" Height="400" Width="400" />
            <br />
            X Coordinate:
            <asp:Label
                ID="lblX"
                runat="server" />
            <br />
            Y Coordinate:
            <asp:Label
                ID="lblY"
                runat="server" />
        </div>
    </form>
</body>
</html>
