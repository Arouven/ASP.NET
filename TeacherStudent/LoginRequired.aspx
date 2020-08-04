<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="LoginRequired.aspx.vb" Inherits="TeacherStudent.LoginRequired" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
	<style>
		.AccessDenied {
			padding:10px;
			width: 350px;
			background-color: lightgrey;
			margin: auto;
			border-style: solid;
			border-color:red;
		}
		.AccessDenied h2{
			color:maroon;
			text-align:center;
		}
		.AccessDenied h6{
			text-align:justify;
		}
		.AccessDenied a{
			color:#4CAF50;
			display:block;
			text-align:right !important;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="AccessDenied">
		<h2>Access Denied!</h2>
		<h6>The url you are trying to access requires login.</h6>
		<a  rel="modal:open" id="modopen" data-toggle="modal" href="#modLogin">Click here to Login</a>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
