<%@ Page Title="TextBox AutoPostBack" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="ReloadingFormAutomaticallyOnceControlLosesFocus.aspx.vb" Inherits="LearnAspCode.ReloadingFormAutomaticallyOnceControlLosesFocus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<script runat="server">
		Sub txtSearch_TextChanged(ByVal sender As Object, ByVal e As EventArgs)
			lblSearchResults.Text = "Search for: " & txtSearch.Text
		End Sub
	</script>
	<div>
		<asp:Label ID="lblSearch" Text="Search:" runat="server" />
		<asp:TextBox ID="txtSearch" AutoPostBack="true" OnTextChanged="txtSearch_TextChanged" runat="server" />
		<hr />
		<asp:Label ID="lblSearchResults" runat="server" />
	</div>
</asp:Content>
