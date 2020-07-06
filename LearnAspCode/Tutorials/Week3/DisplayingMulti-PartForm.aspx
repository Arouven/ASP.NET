<%@ Page Title="MultiView Form" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DisplayingMulti-PartForm.aspx.vb" Inherits="LearnAspCode.DisplayingMulti_PartForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

	<div>
		<asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
			<asp:View ID="View1" runat="server">
				<h1>Step 1</h1>
				<asp:Label ID="lblFirstName" Text="Enter Your First Name:" AssociatedControlID="txtFirstName" runat="server" />
				<br />
				<asp:TextBox ID="txtFirstName" runat="server" />
				<br />
				<br />
				<asp:Button ID="btnNext" Text="Next" CommandName="NextView" runat="server" />
			</asp:View>
			<asp:View ID="View2" runat="server">
				<h1>Step 2</h1>
				<asp:Label ID="Label1" Text="Enter Your Favorite Color:" AssociatedControlID="txtColor" runat="server" />
				<br />
				<asp:TextBox ID="txtColor" runat="server" />
				<br />
				<br />
				<asp:Button ID="Button1" Text="Next" CommandName="NextView" runat="server" />
			</asp:View>
			<asp:View ID="View3" runat="server" OnActivate="View3_Activate">
				<h1>Summary</h1>
				Your First Name:
						<asp:Label ID="lblFirstNameResult" runat="server" />
				<br />
				<br />
				Your Favorite Color:
						<asp:Label ID="lblColorResult" runat="server" />
			</asp:View>
		</asp:MultiView>
	</div>
</asp:Content>
