<%@ Page Title="Show RangeValidator" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="RangeValidator.aspx.vb" Inherits="LearnAspCode.RangeValidator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<asp:Label ID="lblAge" Text="Age:" AssociatedControlID="txtAge" runat="server" />
	<asp:TextBox ID="txtAge" runat="server" />
	<asp:RangeValidator ID="reqAge" ControlToValidate="txtAge" Text="(Invalid Age)" MinimumValue="5" MaximumValue="100" Type="Integer" runat="server" />
	<br />
	<br />
	<asp:Button ID="btnSubmit" Text="Submit" runat="server" />
</asp:Content>
