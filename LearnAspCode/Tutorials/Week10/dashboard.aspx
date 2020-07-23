<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="dashboard.aspx.vb" Inherits="LearnAspCode.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<asp:Label ID="lblMsg" runat="server" Text=" " CssClass="text-success"></asp:Label>
		<hr />
		<asp:HyperLink ID="HyperLink1" NavigateUrl="~/Tutorials/Week10/viewusers.aspx" runat="server">View Users</asp:HyperLink>
		<h4>Add, Update, Delete Records using a GridView</h4>
		<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
		<table>
			<tr>
				<td>
					<asp:Label ID="lblcatid" runat="server" Text="Category ID"></asp:Label>
				</td>
				<td>
					<asp:TextBox ID="txtCategoryId" runat="server" CssClass="form-control" Enabled="false" />
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblcname" runat="server" Text="Category Name"></asp:Label>
				</td>
				<td>
					<asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control"></asp:TextBox>
					<asp:RequiredFieldValidator ID="rfvCategoryName" runat="server" Text="*" ControlToValidate="txtCategoryName" ForeColor="Red" ValidationGroup="vgAdd" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<asp:Button ID="btnInsert" onclick="btnInsert_Click"  runat="server" Text="Insert" ValidationGroup="vgAdd" CssClass="btn btn-primary" />
					<asp:Button ID="btnUpdate" onclick="btnUpdate_Click" runat="server" Text="Update" ValidationGroup="vgAdd" CssClass="btn btn-primary" />
					<asp:Button ID="btnDelete" onclick="btnDelete_Click" runat="server" CssClass="btn btn-primary" OnClientClick="return confirm('Are you sure you want to delete this record?')" Text="Delete" ValidationGroup="vgAdd" />
					<asp:Button ID="btnCancel" OnClick="btnCancel_Click" runat="server" Text="Cancel" CausesValidation="false" CssClass="btn btn-primary" />
				</td>
			</tr>
		</table>
		<br />
		<!-- set the primary for the category table as the DataKeynames-->
		<asp:GridView ID="gvCatNames" DataKeyNames="Category_Id" OnSelectedIndexChanged="gvCatNames_SelectedIndexChanged" AutoGenerateColumns="false" Width="500" runat="server">
			<HeaderStyle BackColor="#9a9a9a" ForeColor="White" Font-Bold="true" Height="30" />
			<AlternatingRowStyle BackColor="#f5f5f5" />
			<Columns>
				<asp:TemplateField>
					<ItemTemplate>
						<asp:LinkButton ID="lbtnSelect" runat="server" CommandName="Select" Text="Select" />
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Category Name">
					<ItemTemplate>
						<!-- display the category name -->
						<asp:Label ID="lblCatName" Text='<%#Eval("Category_Name")%>' runat="server" />
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
	</div>
</asp:Content>
