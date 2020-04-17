<%@ Page Title="Calendar with JavaScript" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="CreatingPop-upDatePicker.aspx.vb" Inherits="LearnAspCode.CreatingPop_upDatePicker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script type="text/javascript">
		function displayCalendar() {
			var datePicker = document.getElementById('datePicker');
			datePicker.style.display = 'block';
		}
	</script>
	<style type="text/css">
		#datePicker {
			display: none;
			position: absolute;
			border: solid 2px black;
			background-color: white;
		}

		.content {
			width: 400px;
			background-color: white;
			margin: auto;
			padding: 10px;
		}

		html {
			background-color: silver;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<script runat="server">
		Sub calEventDate_SelectionChanged(ByVal sender As Object, ByVal e As EventArgs)
			txtEventDate.Text = calEventDate.SelectedDate.ToString("d")
		End Sub
		Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)
			lblResult.Text = "You picked: " & txtEventDate.Text
		End Sub
	</script>
	<div class="content">
		<asp:Label ID="lblEventDate" Text="Event Date:" AssociatedControlID="txtEventDate" runat="server" />
		<asp:TextBox ID="txtEventDate" runat="server" />
		<img src="Calendar.gif" onclick="displayCalendar()" />
		<div id="datePicker">
			<asp:Calendar ID="calEventDate" OnSelectionChanged="calEventDate_SelectionChanged" runat="server" />
		</div>
		<br />
		<asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
		<hr />
		<asp:Label ID="lblResult" runat="server" />
	</div>
</asp:Content>
