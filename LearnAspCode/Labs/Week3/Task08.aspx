
<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task08.aspx.vb" Inherits="LearnAspCode.Task81" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Create the following list items declaratively to store three football clubs, namely: Chelsea, Arsenal and Liverpool.- Drop-down list, radiobuttonlist, checkboxlist, listbox</h1>
	<br />
	<div>
		Drop-down list:
		<asp:DropDownList ID="DropDownList1" runat="server" Style="text-align: left"></asp:DropDownList>
		<br />
		<br />
		radiobuttonlist:
		<asp:RadioButtonList ID="RadioButtonList1" runat="server" Style="text-align: left"></asp:RadioButtonList>
		<br />
		<br />
		checkboxlist:
		<asp:CheckBoxList ID="CheckBoxList1" runat="server" Style="text-align: left"></asp:CheckBoxList>
		<br />
		<br />
		listbox:
		<asp:ListBox ID="ListBox1" runat="server" Style="text-align: left"></asp:ListBox>
	</div>
</asp:Content>


