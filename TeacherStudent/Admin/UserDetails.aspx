<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="UserDetails.aspx.vb" Inherits="TeacherStudent.UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
	<style>
		label {
			font-weight: bold;
		}

		.btnsize {
			width: 160px !important;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div class="form" style="width: 80%; margin: auto;">
		<div class="row form-group">
			<div class="col-sm-10">
				<br />
				<h1>Register as
				<asp:Label ID="LabelTitle" runat="server"></asp:Label>
				</h1>
			</div>
			<asp:Image ID="Image1" CssClass="pull-right" runat="server" Style="display: block; margin-left: auto; width: 100px; height: 100px; border-radius: 50%;" AlternateText="Profile Picture" />
		</div>

		<div>
			<div class="row form-group">
				<div class="col-sm-10">
					<label class="col-sm-3 ">Username : </label>
					<asp:Label ID="LabelUserName" runat="server"></asp:Label>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-sm-10">
					<label class="col-sm-3">First Name : </label>
					<asp:Label ID="LabelFirstName" runat="server"></asp:Label>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-sm-10">
					<label class="col-sm-3 col-form-label">Last Name : </label>
					<asp:Label ID="LabelLastName" runat="server"></asp:Label>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-sm-10">
					<label class="col-sm-3 col-form-label">Address : </label>
					<asp:Label ID="LabelAddress" runat="server"></asp:Label>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-sm-10">
					<label class="col-sm-3 col-form-label">Birth Date : </label>
					<asp:Label ID="LabelBirthDate" runat="server"></asp:Label>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-sm-10">
					<label class="col-sm-3 col-form-label">Phone Number : </label>
					<asp:Label ID="LabelPhoneNumber" runat="server"></asp:Label>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-sm-10">
					<label class="col-sm-3 col-form-label">Email : </label>
					<asp:Label ID="LabelEmail" runat="server"></asp:Label>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-sm-10">
					<label class="col-sm-3 col-form-label">Freeze : </label>
					<asp:CheckBox ID="CheckBoxFreeze" Enabled="false" runat="server" />
				</div>
			</div>

			<div class="row form-group d-flex justify-content-around">
				<asp:LinkButton ID="LinkButtonBack" CssClass="btn btn-success btnsize" OnClick="LinkButtonBack_Click" runat="server" ValidationGroup="ValidationGroupUser">Back</asp:LinkButton>
				<asp:LinkButton ID="LinkButtonUpdate" CssClass="btn btn-primary btnsize" OnClick="LinkButtonUpdate_Click" OnClientClick="return confirm('Are you sure you want to update this user status?')" runat="server" ValidationGroup="ValidationGroupUser">Freeze/ Unfreeze</asp:LinkButton>
				<asp:LinkButton ID="LinkButtonDelete" CssClass="btn btn-danger btnsize" OnClick="LinkButtonDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this user?')" runat="server" ValidationGroup="ValidationGroupUser">Delete</asp:LinkButton>
				<asp:LinkButton ID="LinkButtonResetPassword" CssClass="btn btn-warning btnsize" OnClick="LinkButtonResetPassword_Click" runat="server" ValidationGroup="ValidationGroupUser">Reset Password</asp:LinkButton>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
