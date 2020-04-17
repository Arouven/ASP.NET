<%@ Page Title="Button OnClientClick" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DisplayingAClient-sideConfirmationDialogBox.aspx.vb" Inherits="LearnAspCode.DisplayingAClient_sideConfirmationDialogBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<script runat="server">
		Sub btnDelete_Click(sender As Object, e As EventArgs)
			lblResult.Text = "All pages deleted!"
		End Sub
	</script>
	<div>
		<asp:Button ID="btnDelete" Text="Delete Website" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure?');" runat="server" />
		<br />
		<br />
		<asp:Label ID="lblResult" runat="server" />
	</div>
</asp:Content>
