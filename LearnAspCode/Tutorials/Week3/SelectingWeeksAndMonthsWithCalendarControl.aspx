<%@ Page Title="Calendar SelectionMode" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="SelectingWeeksAndMonthsWithCalendarControl.aspx.vb" Inherits="LearnAspCode.SelectingWeeksAndMonthsWithCalendarControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<script runat="server">
		Sub btnSubmit_Click(sender As Object, e As EventArgs)
			bltResults.DataSource = Calendar1.SelectedDates
			bltResults.DataBind()
		End Sub
	</script>
	<div>
		<asp:Calendar ID="Calendar1" SelectionMode="DayWeekMonth" runat="server" />
		<br />
		<br />
		<asp:Button ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" runat="server" />
		<hr />
		<asp:BulletedList ID="bltResults" DataTextFormatString="{0:d}" runat="server" />
	</div>
</asp:Content>
