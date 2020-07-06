<%@ Page Title="Show Fixed Value" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="ComparingFormFieldAgainstFixedValue.aspx.vb" Inherits="LearnAspCode.ComparingFormFieldAgainstFixedValue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Show Fixed Value</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

	<div>
		<asp:Label
			ID="lblDate"
			Text="Date:"
			AssociatedControlID="txtDate"
			runat="server" />
		<asp:TextBox
			ID="txtDate"
			runat="server" />
		<asp:CompareValidator
			ID="cmpDate"
			Text="(Date must be greater than now)"
			ControlToValidate="txtDate"
			Type="Date"
			Operator="GreaterThan"
			runat="server" />
		<br />
		<br />
		<asp:Button
			ID="btnSubmit"
			Text="Submit"
			runat="server" />
	</div>
</asp:Content>

