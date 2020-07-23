<%@ Page Title="Set Persistent Cookie" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="CreatingAPersistentCookieToTrackTheNumberOfTimesYouHaveVisitedAPage.aspx.vb" Inherits="LearnAspCode.CreatingAPersistentCookieToTrackTheNumberOfTimesYouHaveVisitedAPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		You have visited this page
		<asp:Label ID="lblCounter" runat="server" />
		times!
	</div>
</asp:Content>
