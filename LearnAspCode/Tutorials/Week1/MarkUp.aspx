<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MarkUp.aspx.vb" Inherits="LearnAspCode.MarkUp1" %>

<!DOCTYPE html>

<script runat="server">
    Sub Page_Load()
        spanNow.InnerText = DateAndTime.Now.ToString("T")
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HTML Controls</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            At the tone, the time will be:
            <span id="spanNow" runat="server" />
        </div>
    </form>
</body>
</html>
