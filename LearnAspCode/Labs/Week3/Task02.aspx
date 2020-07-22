<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task02.aspx.vb" Inherits="LearnAspCode.Task02" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>To detect whether a checkbox is checked or unchecked. The program will have to print true or false accordingly and respond once a user checks the checkbox (refer to exercise 5 in your tutorial).</h1>
	<br />
	<div>
		<asp:CheckBox ID="CheckBox1" OnCheckedChanged="CheckBox1_CheckedChanged" runat="server" AutoPostBack="True" />
		<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
	</div>
</asp:Content>



