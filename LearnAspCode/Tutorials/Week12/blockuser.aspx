<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="blockuser.aspx.vb" Inherits="LearnAspCode.blockuser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style>
		#gvs {
			width: 100%;
		}

		th {
			background: #494e5d;
			color: white;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h2>Search and block active users:</h2>
		</div>
	</div>
	<asp:GridView ID="gvs" CssClass="table table-striped table-bordered"
		runat="server" AutoGenerateColumns="false" OnPreRender="gvs_PreRender" ClientIDMode="Static">
		<Columns>
			<asp:BoundField DataField="firstname" HeaderText="First Name" />
			<asp:BoundField DataField="lastname" HeaderText="Last Name" />
			<asp:BoundField DataField="username" HeaderText="Username" />
			<asp:TemplateField HeaderText="Action">
				<ItemTemplate>
					<%-- Assign the User_Id to the link button --%>
					<asp:LinkButton ID="lnkblock" CssClass="btn btn-warning" OnClick="lnkblock_Click"
						runat="server" CommandArgument='<%# Eval("User_Id") %>'>Block</asp:LinkButton>
				</ItemTemplate>
			</asp:TemplateField>
		</Columns>
	</asp:GridView>
</asp:Content>
