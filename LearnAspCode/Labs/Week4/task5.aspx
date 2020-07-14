<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task5.aspx.vb" Inherits="LearnAspCode.task52" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:Label ID="Label1" runat="server" Text="Credit card"></asp:Label>
		<asp:TextBox ID="txtCreditCard" runat="server"></asp:TextBox>
		<asp:RequiredFieldValidator ID="RFVCreditCard" ForeColor="Red" ControlToValidate="txtCreditCard" runat="server" ErrorMessage="*required"></asp:RequiredFieldValidator>
		<asp:RegularExpressionValidator ID="REVCreditCard" ForeColor="Red" ControlToValidate="txtCreditCard" runat="server" ErrorMessage="*Must be 16 digits" ValidationExpression="[0-9]{16}"></asp:RegularExpressionValidator>
	</div>
	<asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" />
</asp:Content>
