<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Exercise7.aspx.vb" Inherits="LearnAspCode.Exercise7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="Category_Id" DataSourceID="SqlDataSource1">
		<EditItemTemplate>
			Category_Id:
			<asp:Label ID="Category_IdLabel1" runat="server" Text='<%# Eval("Category_Id") %>' />
			<br />
			Category_Name:
			<asp:TextBox ID="Category_NameTextBox" runat="server" Text='<%# Bind("Category_Name") %>' />
			<br />
			<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
			&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
		</EditItemTemplate>
		<InsertItemTemplate>
			Category_Name:
			<asp:TextBox ID="Category_NameTextBox" runat="server" Text='<%# Bind("Category_Name") %>' />
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
			<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
		</ItemTemplate>
	</asp:FormView>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesCS %>" InsertCommand="INSERT INTO tblCategory(Category_Name) VALUES (@category_name)" SelectCommand="SELECT tblCategory.* FROM tblCategory">
		<InsertParameters>
			<asp:Parameter Name="category_name" />
		</InsertParameters>
	</asp:SqlDataSource>
</asp:Content>
