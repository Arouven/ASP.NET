<%@ Page Title="Validation Image" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DisplayingImageForValidationError.aspx.vb" Inherits="LearnAspCode.DisplayingImageForValidationError" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:Label ID="lblFirstName" Text="First Name" AssociatedControlID="txtFirstName" runat="server" />
		<br />
		<asp:TextBox ID="txtFirstName" runat="server" />
		<asp:RequiredFieldValidator ID="reqFirstName" ControlToValidate="txtFirstName" Text="<img src='Error.gif' alt='First name is required.' />" runat="server" />
		<br />
		<br />
		<asp:Button ID="btnSubmit" Text="Submit" runat="server" />
	</div>
</asp:Content>
