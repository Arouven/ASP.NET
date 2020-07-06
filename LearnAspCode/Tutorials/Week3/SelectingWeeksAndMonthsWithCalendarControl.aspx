<%@ Page Title="Calendar SelectionMode" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="SelectingWeeksAndMonthsWithCalendarControl.aspx.vb" Inherits="LearnAspCode.SelectingWeeksAndMonthsWithCalendarControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

	<div>
		<asp:Calendar ID="Calendar1" SelectionMode="DayWeekMonth" runat="server" />
		<br />
		<br />
		<asp:Button ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" runat="server" />
		<hr />
		<asp:BulletedList ID="bltResults" DataTextFormatString="{0:d}" runat="server" />
	</div>
</asp:Content>
