<%@ Page Title="Show LinkButton" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="UsingTheLinkButtonControlToSubmitAForm.aspx.vb" Inherits="LearnAspCode.UsingTheLinkButtonControlToSubmitAForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<script runat="server">
		Sub lnkSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)
			lblResults.Text = "First Name: " & txtFirstName.Text
			lblResults.Text &= "<br />Last Name: " & txtLastName.Text
		End Sub
	</script>
	<div>
		<asp:Label ID="lblFirstName" Text="First Name:" AssociatedControlID="txtFirstName" runat="server" />
		<br />
		<asp:TextBox ID="txtFirstName" runat="server" />
		<br />
		<br />
		<asp:Label ID="lblLastName" Text="Last Name:" AssociatedControlID="txtLastName" runat="server" />
		<br />
		<asp:TextBox ID="txtLastName" runat="server" />
		<br />
		<br />
		<asp:LinkButton ID="lnkSubmit" Text="Submit" OnClick="lnkSubmit_Click" runat="server" />
		<br />
		<br />
		<asp:Label ID="lblResults" runat="server" />
	</div>
</asp:Content>
