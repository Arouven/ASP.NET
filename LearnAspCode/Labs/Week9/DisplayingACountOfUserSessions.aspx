<%@ Page Title="Show Session Count" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DisplayingACountOfUserSessions.aspx.vb" Inherits="LearnAspCode.DisplayingACountOfUserSessions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		Total Application Sessions:
		<asp:Label ID="lblSessionCount" runat="server" />
	</div>
</asp:Content>
