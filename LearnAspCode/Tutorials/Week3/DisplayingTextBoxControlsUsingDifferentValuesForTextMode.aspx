<%@ Page Title="Show TextBox" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DisplayingTextBoxControlsUsingDifferentValuesForTextMode.aspx.vb" Inherits="LearnAspCode.DisplayingTextBoxControlsUsingDifferentValuesForTextMode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:TextBox ID="txtUserName" TextMode="SingleLine" runat="server" />
		<br />
		<br />
		<asp:TextBox ID="txtPassword" TextMode="Password" runat="server" />
		<br />
		<br />
		<asp:TextBox ID="txtComments" TextMode="MultiLine" runat="server" />
	</div>
</asp:Content>
