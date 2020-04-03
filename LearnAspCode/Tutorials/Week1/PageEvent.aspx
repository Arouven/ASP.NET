<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PageEvent.aspx.vb" Inherits="LearnAspCode.PageEvent1" %>

<!DOCTYPE html>

<script runat="server">
	Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
		Label1.Text &= "<br />Button Click"
	End Sub
	Sub Page_PreRender()
		Label1.Text &= "<br />Page PreRender"
	End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show Page Events</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button
                ID="Button1"
                Text="Click Here"
                OnClick="Button1_Click"
                runat="server" />
            <br />
            <br />
            <asp:Label
                ID="Label1"
                runat="server" />
        </div>
    </form>
</body>
</html>
