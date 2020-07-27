<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="uploaddocument.aspx.vb" Inherits="LearnAspCode.uploaddocument" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h2>Enter a custom file name:</h2>
	<asp:TextBox ID="txtfilename" runat="server" />
	<br />
	<asp:FileUpload ID="upDoc" runat="server" />
	<br />
	<br />
	<asp:Button ID="btnAdd" OnClick="btnAdd_Click" Text="Upload Document" runat="server" />
	<asp:Label ID="lblmsg" runat="server" CssClass="text-success" />
</asp:Content>
