<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="HOViewHKProfile.aspx.vb" Inherits="JP.HOViewHKProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
		.btnsize{width:200px;}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="form" style="width: 80%; ">
		<div class="row form-group">
			<div class="col-sm-10">
				<br />
				<h1>
					<asp:Label ID="LabelTitle" runat="server"></asp:Label>
				</h1>
			</div>
			<asp:Image ID="Image1" CssClass="pull-right" runat="server" Style="display: block; margin-left: auto; width: 100px; height: 100px; border-radius: 50%;" AlternateText="Profile Picture" />
		</div>

		<div class="text-center">
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

				<asp:LinkButton ID="LinkButtonBack" CssClass="btn btn-success btnsize" OnClick="LinkButtonBack_Click" runat="server">Back</asp:LinkButton>



				<asp:LinkButton ID="ButtonAccept" runat="server" OnClientClick="return confirm('Are you sure you want to accept?')" Text="Accept" class="btn btn-primary btnsize" OnClick="ButtonAccept_Click" />
				<asp:LinkButton ID="ButtonRejected" runat="server" OnClientClick="return confirm('Are you sure you want to reject?')" Text="Reject" class="btn btn-danger btnsize" OnClick="ButtonRejected_Click" />



			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>