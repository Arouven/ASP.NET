<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Task6.aspx.vb" Inherits="LearnAspCode.Task61" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<asp:ImageMap ID="Shop" Width="600" Height="600" AlternateText="Shopping choices" ImageUrl="~/Images/LabWeek3Pic2.png" runat="Server">
			<%--<asp:CircleHotSpot NavigateUrl="javascript:OnAbort()" X="300" Y="300" Radius="270" HotSpotMode="PostBack" AlternateText="miss"></asp:CircleHotSpot>--%>

			<asp:CircleHotSpot NavigateUrl="javascript:OnAbort()" X="300" Y="300" Radius="7" HotSpotMode="PostBack" AlternateText="hit"></asp:CircleHotSpot>
		</asp:ImageMap>
		<p>
			<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
		</p>
	</form>
</body>
</html>
