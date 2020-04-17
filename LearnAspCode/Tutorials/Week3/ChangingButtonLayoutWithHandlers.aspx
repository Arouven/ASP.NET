<%@ Page Title="Changing button layout with handlers" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="ChangingButtonLayoutWithHandlers.aspx.vb" Inherits="LearnAspCode.ChangingButtonLayoutWithHandlers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:Button ID="btnSubmit" Text="Submit" onmouseover="this.value='Click Here!'" onmouseout="this.value='Submit'" runat="server" />
	</div>
</asp:Content>
