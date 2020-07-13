<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="InsertNewRecordWithTheFormViewControl.aspx.vb" Inherits="LearnAspCode.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		#content {
			margin-left: 20px;
			width: 500px;
			padding: 10px;
			background-color: lightgray;
			font: 24px Georgia,Serif;
		}

		a {
			color: blue;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div id="content">
		<asp:FormView ID="FormView1" runat="server" CellPadding="50" AllowPaging="true" DataKeyNames="Category_Id" DataSourceID="SqlDataSource1">
			<InsertItemTemplate>
				Category_Name:
				<asp:TextBox ID="Category_NameTextBox" runat="server" Text='<%# Bind("Category_Name") %>' />
				<br />
				<br />
				<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</InsertItemTemplate>
			<ItemTemplate>
				Category_Id:
				<asp:Label ID="Category_IdLabel" runat="server" Text='<%# Eval("Category_Id") %>' />
				<br />
				Category_Name:
				<asp:Label ID="Category_NameLabel" runat="server" Text='<%# Bind("Category_Name") %>' />
				<br />
				<br />
				<asp:LinkButton ID="NewButton" runat="server"
					CausesValidation="True" CommandName="New" Text="New Catgeory" />
			</ItemTemplate>
		</asp:FormView>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesCS %>" InsertCommand="INSERT INTO tblCategory(Category_Name) VALUES (@category_name)" SelectCommand="SELECT * FROM [tblCategory]">
			<InsertParameters>
				<asp:Parameter Name="category_name" />
			</InsertParameters>
		</asp:SqlDataSource>
	</div>
</asp:Content>
