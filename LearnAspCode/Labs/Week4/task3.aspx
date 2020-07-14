<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task3.aspx.vb" Inherits="LearnAspCode.task32" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:Label ID="lblFirstNumber" runat="server" Text="Enter First Number: "></asp:Label>
		<asp:TextBox ID="txtFirstNumber" runat="server"></asp:TextBox>
	</div>
	<br />
	<div>
		<asp:Label ID="lblSecondNumber" runat="server" Text="Enter Second Number: "></asp:Label>
		<asp:TextBox ID="txtSecondNumber" runat="server"></asp:TextBox>
	</div>
	<br />
	<div>
		<asp:Label ID="lblThirdNumber" runat="server" Text="Enter the number that falls within the two: "></asp:Label>
		<asp:TextBox ID="txtThirdNumber" runat="server"></asp:TextBox>
		<asp:CustomValidator ID="CVCheckThirdNumber" runat="server" ForeColor="Red" ErrorMessage="Num1 must be greater than Num2 or does not fall within range" OnServerValidate="CVCheckThirdNumber_ServerValidate" SetFocusOnError="True"></asp:CustomValidator>
	</div>
	<asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" />
</asp:Content>
