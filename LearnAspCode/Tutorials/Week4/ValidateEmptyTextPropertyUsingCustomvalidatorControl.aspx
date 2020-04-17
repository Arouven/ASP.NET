<%@ Page Title="Show Validate Empty Text" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="ValidateEmptyTextPropertyUsingCustomvalidatorControl.aspx.vb" Inherits="LearnAspCode.ValidateEmptyTextPropertyUsingCustomvalidatorControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<script runat="server">
		Sub valProductCode_ServerValidate(ByVal source As Object, ByVal args As ServerValidateEventArgs)
			If args.Value.Length = 4 Then
				args.IsValid = True
			Else
				args.IsValid = False
			End If
		End Sub
	</script>
	<div>
		<asp:Label ID="lblProductCode" Text="Product Code:" AssociatedControlID="txtProductCode" runat="server" />
		<br />
		<asp:TextBox ID="txtProductCode" runat="server" />
		<asp:CustomValidator ID="valProductCode" ControlToValidate="txtProductCode" Text="(Invalid product code)" ValidateEmptyText="true" OnServerValidate="valProductCode_ServerValidate" runat="server" />
		<br />
		<br />
		<asp:Button ID="btnSubmit" Text="Submit" runat="server" />
	</div>
</asp:Content>
