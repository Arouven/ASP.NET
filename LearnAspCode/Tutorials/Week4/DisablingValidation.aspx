<%@ Page Title="Show Disable Validation" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DisablingValidation.aspx.vb" Inherits="LearnAspCode.DisablingValidation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<script runat="server">
		Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
			Response.Redirect("Default.aspx")
		End Sub
	</script>
	<div>
		<asp:Label ID="lblFirstName" Text="First Name:" AssociatedControlID="txtFirstName" runat="server" />
		<asp:TextBox ID="txtFirstName" runat="server" />
		<asp:RequiredFieldValidator ID="reqFirstName" ControlToValidate="txtFirstName" Text="(Required)" runat="server" />
		<br />
		<br />
		<asp:Button ID="btnSubmit" Text="Submit" runat="server" />
		<asp:Button ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" runat="server" />
	</div>
</asp:Content>
