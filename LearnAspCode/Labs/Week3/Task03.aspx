<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Task03.aspx.vb" Inherits="LearnAspCode.Task31" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			Select the source:
			<ul>
				<li>
					<asp:RadioButton OnCheckedChanged="Radio_CheckedChanged" AutoPostBack="true" ID="rdlMagazine" Text="Magazine Article" GroupName="Source" runat="server" />
				</li>
				<li>
					<asp:RadioButton OnCheckedChanged="Radio_CheckedChanged" AutoPostBack="true" ID="rdlTelevision" Text="Television Program" GroupName="Source" runat="server" />
				</li>
				<li>
					<asp:RadioButton OnCheckedChanged="Radio_CheckedChanged" AutoPostBack="true" ID="rdlOther" Text="Other Source" GroupName="Source" runat="server" />
				</li>
			</ul>
			<asp:Label ID="lblResult" runat="server" />
		</div>
	</form>
</body>
</html>
