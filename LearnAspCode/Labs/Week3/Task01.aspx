<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task01.aspx.vb" Inherits="LearnAspCode.Task01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1> To transfer text from one Textbox control to another, once the first Textbox loses focus.</h1>
	<br />
	<div>
		<div class="lostfocus">
			<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
		</div>
		<br />
		<div>
			<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
		</div>
	</div>
	<script>
		$(document).ready(function () {
			$(".lostfocus").focusout(function () {
				document.getElementById('<%= TextBox2.ClientID %>').value = document.getElementById('<%= TextBox1.ClientID %>').value;
			});
		});
	</script>
</asp:Content>

