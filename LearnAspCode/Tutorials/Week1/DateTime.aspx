<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DateTime.aspx.vb" Inherits="LearnAspCode.DateTime1" %>

<!DOCTYPE html>

<script runat="server">
    Sub Page_Load()
        lblServerTime.Text = DateAndTime.Now.ToString()
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>First Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Visual Studio running mode! The current date and time is:
                <asp:Label
                    ID="lblServerTime"
                    Text="ServerTime"
                    runat="server" />
        </div>
    </form>
</body>
</html>


