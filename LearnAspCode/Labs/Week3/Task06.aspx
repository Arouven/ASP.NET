<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Task06.aspx.vb" Inherits="LearnAspCode.Task61" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<asp:ImageMap ID="shoot" Width="600" Height="600" ImageUrl="~/Images/LabWeek3Pic2.png" runat="Server" HotSpotMode="PostBack">
			<asp:CircleHotSpot NavigateUrl="javascript:OnAbort()" X="300" Y="300" Radius="7" PostBackValue="Hit"></asp:CircleHotSpot>

			<asp:CircleHotSpot NavigateUrl="javascript:OnAbort()" X="300" Y="300" Radius="270" PostBackValue="Miss"></asp:CircleHotSpot>
		</asp:ImageMap>
		<p>
			<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
		</p>
	</form>
</body>
</html>
