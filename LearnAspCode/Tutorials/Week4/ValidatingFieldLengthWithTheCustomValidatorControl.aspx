<%@ Page Title="Show CustomValidator" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="ValidatingFieldLengthWithTheCustomValidatorControl.aspx.vb" Inherits="LearnAspCode.ValidatingFieldLengthWithTheCustomValidatorControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<script runat="server">
		Protected Sub valComments_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
			If args.Value.Length > 10 Then
				args.IsValid = False
			Else
				args.IsValid = True
			End If
		End Sub
	</script>

	<div>
		<asp:Label ID="lblComments" Text="Comments:" AssociatedControlID="txtComments" runat="server" />
		<br />
		<asp:TextBox ID="txtComments" TextMode="MultiLine" Columns="30" Rows="5" runat="server" />
		<asp:CustomValidator ID="valComments" ControlToValidate="txtComments" Text="(Comments must be less than 10 characters)" OnServerValidate="valComments_ServerValidate" runat="server" />
		<br />
		<br />
		<asp:Button ID="btnSubmit" Text="Submit" runat="server" />
	</div>
</asp:Content>
