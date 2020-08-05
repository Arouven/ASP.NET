<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="TutorPostsEvent.aspx.vb" Inherits="TeacherStudent.TutorPostsEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
	<style>
		@font-face {
			font-family: 'Glyphicons Halflings';
			src: url('../fonts/glyphicons-halflings-regular.eot');
			src: url('../fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'), url('../fonts/glyphicons-halflings-regular.woff2') format('woff2'), url('../fonts/glyphicons-halflings-regular.woff') format('woff'), url('../fonts/glyphicons-halflings-regular.ttf') format('truetype'), url('../fonts/glyphicons-halflings-regular.svg#glyphicons_halflingsregular') format('svg');
		}

		.glyphicon {
			position: relative;
			top: 1px;
			display: inline-block;
			font-family: 'Glyphicons Halflings';
			font-style: normal;
			font-weight: normal;
			line-height: 1;
			-webkit-font-smoothing: antialiased;
			-moz-osx-font-smoothing: grayscale;
		}




		.glyphicon-plus:before {
			content: "\002b";
		}


		.myLable {
			font-weight: bold;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div class="form" style="width: 80%; margin: auto;">
		<div class="row form-group">
			<h1>Add New Event</h1>
			<asp:HiddenField ID="HiddenFieldDate" Value='<%# DateTime.Now.Date.ToLocalTime %>' runat="server" />
		</div>
		<div class="row form-group">
			<label for="inputEmail3" class="col-sm-3 col-form-label myLable">Event Name : </label>
			<div class="col-sm-9">
				<asp:TextBox ID="TextBoxEventName" CssClass="form-control" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxEventName" CssClass="text-danger" ValidationGroup="AddEventGroup" ErrorMessage="Field is required." />
			</div>
		</div>

		<div class="row form-group">
			<label class="col-sm-3 col-form-label myLable">Event Details : </label>
			<div class="col-sm-9">
				<asp:TextBox ID="TextBoxEventDetails" CssClass="form-control" runat="server" Style="height: 100px"></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxEventDetails" CssClass="text-danger" ValidationGroup="AddEventGroup" ErrorMessage="Field is required." />
			</div>
		</div>
		<div class="row form-group">
			<label class="col-sm-3 col-form-label myLable">Location : </label>
			<div class="col-sm-9">
				<asp:TextBox ID="TextBoxLocation" CssClass="form-control" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxLocation" CssClass="text-danger" ValidationGroup="AddEventGroup" ErrorMessage="Field is required." />
			</div>
		</div>
		<div class="row form-group">
			<label class="col-sm-3 col-form-label myLable">Date Schedule : </label>
			<div class="col-sm-9">
				<asp:TextBox ID="TextBoxDateSchedule" CssClass="form-control" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxDateSchedule" CssClass="text-danger" ValidationGroup="AddEventGroup" ErrorMessage="Field is required." />
			</div>
		</div>


	


		<div class="row form-group">
			<asp:LinkButton ID="LinkButtonAdd" CssClass="btn btn-success col-sm-4" OnClick="LinkButtonAdd_Click" runat="server"  ValidationGroup="AddEventGroup">Add Event</asp:LinkButton>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">

	<script>

</script>
</asp:Content>
