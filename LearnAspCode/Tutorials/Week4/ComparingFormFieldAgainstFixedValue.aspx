<%@ Page Title="Show Fixed Value" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="ComparingFormFieldAgainstFixedValue.aspx.vb" Inherits="LearnAspCode.ComparingFormFieldAgainstFixedValue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<script runat="server">
		Sub Page_Load()
			cmpDate.ValueToCompare = DateTime.Now.ToString("d")
		End Sub
	</script>
	<div>
		<asp:Label ID="Label1" Text="Date:" AssociatedControlID="txtDate" runat="server" />
		<asp:TextBox ID="TextBox1" runat="server" />
		<asp:CompareValidator ID="CompareValidator1" Text="(Date must be greater than now)" ControlToValidate="txtDate" Type="Date" Operator="GreaterThan" runat="server" />
		<br />
		<br />
		<asp:Button ID="Button1" Text="Submit" runat="server" />
	</div>
</asp:Content>

