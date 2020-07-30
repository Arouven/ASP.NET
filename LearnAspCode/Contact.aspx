<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Contact.aspx.vb" Inherits="LearnAspCode.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h2><%: Title %></h2>
	<p>Your contact page.</p>

	<address>
		One Microsoft Way<br />
		Redmond, WA 98052-6399<br />
		<abbr title="Phone">P:</abbr>
		425.555.0100
	</address>

	<address>
		<strong>Support:</strong><a href="mailto:Support@example.com">Support@example.com</a><br />
		<strong>Marketing:</strong><a href="mailto:Marketing@example.com">Marketing@example.com</a>
	</address>
</asp:Content>
