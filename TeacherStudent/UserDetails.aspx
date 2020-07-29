<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="UserDetails.aspx.vb" Inherits="TeacherStudent.UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div style="width: 80%; margin: auto;">
		<div class="col-sm-10">
			<h1>Register as
				<asp:Label ID="LabelTitle" runat="server"></asp:Label>
			</h1>
		</div>
		<asp:DataList ID="DataListUserDetails" runat="server">
			<ItemTemplate>
				<div class="row">
					<div class="col-sm-2 text-right">
						<asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProfilePictureUrl", "~/ProfilePictures/{0}")%>' Style="width: 50px; height: 50px; border-radius: 50%;" />
					</div>
					<div class="col-sm-10 text-left">
						<label class="col-sm-2 col-form-label">UserName</label>
						<asp:Label ID="LabelUserName" Text='<%# Eval("UserName")%>' runat="server"></asp:Label>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-2 col-form-label">FirstName</label>
					<div class="col-sm-10">
						<asp:Label ID="LabelFirstName" Text='<%# Eval("FirstName")%>' runat="server"></asp:Label>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-2 col-form-label">LastName</label>
					<div class="col-sm-10">
						<asp:Label ID="LabelLastName" Text='<%# Eval("LastName")%>' runat="server"></asp:Label>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-2 col-form-label">Address</label>
					<div class="col-sm-10">
						<asp:Label ID="LabelAddress" Text='<%# Eval("Address")%>' runat="server"></asp:Label>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-2 col-form-label">BirthDate</label>
					<div class="col-sm-10">
						<asp:Label ID="LabelBirthDate" Text='<%# Eval("BirthDate", "{0:dd/MM/yyyy}")%>' runat="server"></asp:Label>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-2 col-form-label">PhoneNumber</label>
					<div class="col-sm-10">
						<asp:Label ID="LabelPhoneNumber" Text='<%# Eval("PhoneNumber")%>' runat="server"></asp:Label>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-2 col-form-label">Email</label>
					<div class="col-sm-10">
						<asp:Label ID="LabelEmail" Text='<%# Eval("Email")%>' runat="server"></asp:Label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">Freeze</div>
					<div class="col-sm-10">
						<div class="form-check">
							<asp:CheckBox ID="CheckBoxFreeze" Enabled="false" Checked='<%# Eval("Freeze")%>' runat="server" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<asp:LinkButton ID="LinkButtonUpdate" CssClass="btn btn-primary" OnClick="LinkButtonUpdate_Click" runat="server" ValidationGroup="ValidationGroupUser">Freeze/ Unfreeze</asp:LinkButton>
					</div>
					<div class="col-sm-4">
						<asp:LinkButton ID="LinkButtonDelete" CssClass="btn btn-danger" OnClick="LinkButtonDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this user?')" runat="server" ValidationGroup="ValidationGroupUser">Delete</asp:LinkButton>
					</div>
					<div class="col-sm-4">
						<asp:LinkButton ID="LinkButtonResetPassword" CssClass="btn btn-warning" OnClick="LinkButtonResetPassword_Click" runat="server" ValidationGroup="ValidationGroupUser">Reset Password</asp:LinkButton>
					</div>
				</div>
			</ItemTemplate>
		</asp:DataList>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
