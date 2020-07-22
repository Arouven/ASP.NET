<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task11.aspx.vb" Inherits="LearnAspCode.Task111" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Write a program that displays a Calendar control with the following settings: Most days in blue, Weekends in green, Current date in yellow, Selected date in orange</h1>
	<br />
	<div>
		<asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
	</div>
</asp:Content>


