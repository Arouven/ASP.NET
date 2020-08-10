<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm2.aspx.vb" Inherits="TeacherStudent.WebForm2" %>

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
		<asp:CustomValidator ID="CustomValidator1" ErrorMessage="Please select at least one item."
			ForeColor="Red" ClientValidationFunction="ValidateCheckBoxList" runat="server" />
		<br />
		<br />
		<asp:Button ID="btnSubmit" Text="Submit" runat="server" /><br />
	</form>
</body>
<script type="text/javascript">
	function ValidateCheckBoxList(sender, args) {
		var checkBoxList = document.getElementById("<%=chkFruits.ClientID %>");
		var checkboxes = checkBoxList.getElementsByTagName("input[type:checkbox]");
		var isValid = false;
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				isValid = true;
				break;
			}
		}
		args.IsValid = isValid;
	}
</script>
</html>
