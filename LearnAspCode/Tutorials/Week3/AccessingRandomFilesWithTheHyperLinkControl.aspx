<%@ Page Title="Show HyperLink" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="AccessingRandomFilesWithTheHyperLinkControl.aspx.vb" Inherits="LearnAspCode.AccessingRandomFilesWithTheHyperLinkControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<script runat="server">
		Sub Page_Load()
			lnkRandom.NavigateUrl = GetRandomFile()
		End Sub
		Function GetRandomFile() As String
			Dim files As String() = Directory.GetFiles(MapPath(Request.ApplicationPath), "*.aspx")
			Dim rnd As New Random()
			Dim rndFile As String = files(rnd.Next(files.Length))
			Return Path.GetFileName(rndFile)
		End Function
	</script>
	<div>
		<asp:HyperLink ID="lnkRandom" Text="Random Link" runat="server" />
	</div>
</asp:Content>
