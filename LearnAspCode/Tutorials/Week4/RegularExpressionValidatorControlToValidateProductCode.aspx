<%@ Page Title="Show RegularExpressionValidator" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="RegularExpressionValidatorControlToValidateProductCode.aspx.vb" Inherits="LearnAspCode.RegularExpressionValidatorControlToValidateProductCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:Label ID="lblProduct" Text="Product code:" AssociatedControlID="txtProduct" runat="server" />
		<asp:TextBox ID="txtProduct" runat="server" />
		<asp:RegularExpressionValidator ID="regproduct" ControlToValidate="txtProduct" Text="(Invalid Product code)" ValidationExpression="”\d{3}" runat="server" />
		<br />
		<br />
		<asp:Button ID="btnSubmit" Text="Submit" runat="server" />
	</div>
</asp:Content>
