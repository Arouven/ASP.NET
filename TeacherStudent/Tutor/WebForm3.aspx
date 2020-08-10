<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm3.aspx.vb" Inherits="TeacherStudent.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
		Select Fruits<br />
		<asp:CheckBoxList ID="chkFruits" runat="server">
			<asp:ListItem Text="Mango" />
			<asp:ListItem Text="Apple" />
			<asp:ListItem Text="Banana" />
			<asp:ListItem Text="Pineapple" />
			<asp:ListItem Text="Guava" />
			<asp:ListItem Text="Grapes" />
			<asp:ListItem Text="Papaya" />
		</asp:CheckBoxList>
<Dado:RequiredFieldValidator runat="server" ControlToValidate="chkFruits" ErrorMessage="sssssssssssssss"/>
		<br />
		<br />
		<asp:Button ID="btnSubmit" Text="Submit" runat="server" /><br />
    </form>
</body>
</html>
