<%@ Page Title="Show CustomValidator with JavaScript" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="ShowCustomValidatorWithJavaScript.aspx.vb" Inherits="LearnAspCode.ShowCustomValidatorWithJavaScript" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script type="text/javascript">
		function valComments_ClientValidate(source, args) {
			if (args.Value.length > 10)
				args.IsValid = false;
			else
				args.IsValid = true;
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	
	<div>
		<asp:Label ID="lblComments" Text="Comments:" AssociatedControlID="txtComments" runat="server" />
		<br />
		<asp:TextBox ID="txtComments" TextMode="MultiLine" Columns="30" Rows="5" runat="server" />
		<asp:CustomValidator ID="valComments" ControlToValidate="txtComments" Text="(Comments must be less than 10 characters)" OnServerValidate="valComments_ServerValidate" ClientValidationFunction="valComments_ClientValidate" runat="server" />
		<br />
		<br />
		<asp:Button ID="btnSubmit" Text="Submit" runat="server" />
	</div>
</asp:Content>
