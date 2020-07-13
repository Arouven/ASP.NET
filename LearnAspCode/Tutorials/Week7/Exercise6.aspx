<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Exercise6.aspx.vb" Inherits="LearnAspCode.Exercise6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<asp:FormView ID="FormView1" runat="server" DataKeyNames="Category_Id" DataSourceID="SqlDataSource1" AllowPaging="True">
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
			<asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
		</ItemTemplate>
	</asp:FormView>


	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesCS %>" SelectCommand="SELECT tblCategory.* FROM tblCategory" UpdateCommand="UPDATE tblCategory SET Category_Name = @Category_Name WHERE (Category_Id = @Category_Id)">
		<UpdateParameters>
			<asp:Parameter Name="Category_Name" />
			<asp:Parameter Name="Category_Id" />
		</UpdateParameters>
	</asp:SqlDataSource>
</asp:Content>
