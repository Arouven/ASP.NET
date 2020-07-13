<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="EditAndUpdateARecordWithTheFormViewControl.aspx.vb" Inherits="LearnAspCode.WebForm1" %>

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
			<ItemTemplate>
				Category_Id:
				<asp:Label ID="Category_IdLabel" runat="server" Text='<%# Eval("Category_Id") %>' />
				<br />
				<br />
				Category_Name:
				<asp:Label ID="Category_NameLabel" runat="server" Text='<%# Bind("Category_Name") %>' />
				<br />
				<br />
				<asp:LinkButton ID="EditButton" runat="server" CausesValidation="True" CommandName="Edit" Text="Edit Category" />
			</ItemTemplate>
		</asp:FormView>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesCS %>" SelectCommand="SELECT * FROM [tblCategory]" UpdateCommand="UPDATE tblCategory SET Category_Name = @category_name WHERE (Category_Id = @category_id)">
			<UpdateParameters>
				<asp:Parameter Name="category_name" />
				<asp:Parameter Name="category_id" />
			</UpdateParameters>
		</asp:SqlDataSource>
	</div>
</asp:Content>
