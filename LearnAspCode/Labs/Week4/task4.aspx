<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task4.aspx.vb" Inherits="LearnAspCode.task42" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:Label ID="lblCurrentBid" runat="server" Text=""></asp:Label>
		<br />
		<asp:TextBox ID="txtYourBid" runat="server"></asp:TextBox>
		<asp:CustomValidator ID="CVBidCheck" runat="server" ErrorMessage="*You bid too less" ForeColor="Red" OnServerValidate="CVBidCheck_ServerValidate" ></asp:CustomValidator>
	</div>
	<br />
	<asp:Button ID="btnSubmitBid" runat="server" Text="Submit Bid" />
</asp:Content>
