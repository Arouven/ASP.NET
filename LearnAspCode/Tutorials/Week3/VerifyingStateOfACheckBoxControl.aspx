<%@ Page Title="Show CheckBox" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="VerifyingStateOfACheckBoxControl.aspx.vb" Inherits="LearnAspCode.VerifyingStateOfACheckBoxControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<script runat="server">
		Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)
			lblResult.Text = chkNewsletter.Checked.ToString()
		End Sub
	</script>
	<div>
		<asp:CheckBox ID="chkNewsletter" Text="Receive Newsletter?" runat="server" />
		<br />
		<asp:Button ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" runat="server" />
		<hr />
		<asp:Label ID="lblResult" runat="server" />
	</div>
</asp:Content>
