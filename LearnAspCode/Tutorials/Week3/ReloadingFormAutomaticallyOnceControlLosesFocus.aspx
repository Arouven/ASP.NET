﻿<%@ Page Title="TextBox AutoPostBack" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="ReloadingFormAutomaticallyOnceControlLosesFocus.aspx.vb" Inherits="LearnAspCode.ReloadingFormAutomaticallyOnceControlLosesFocus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	
	<div>
		<asp:Label ID="lblSearch" Text="Search:" runat="server" />
		<asp:TextBox ID="txtSearch" AutoPostBack="true" OnTextChanged="txtSearch_TextChanged" runat="server" />
		<hr />
		<asp:Label ID="lblSearchResults" runat="server" />
	</div>
</asp:Content>