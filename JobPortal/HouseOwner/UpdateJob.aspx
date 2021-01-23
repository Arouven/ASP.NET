<%@ Page Title="Update Job" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="UpdateJob.aspx.vb" Inherits="JP.UpdateJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

	<style>
		@font-face {
			font-family: "Glyphicons Halflings";
			src: url("../fonts/glyphicons-halflings-regular.eot");
			src: url("../fonts/glyphicons-halflings-regular.eot?#iefix") format("embedded-opentype"), url("../fonts/glyphicons-halflings-regular.woff2") format("woff2"), url("../fonts/glyphicons-halflings-regular.woff") format("woff"), url("../fonts/glyphicons-halflings-regular.ttf") format("truetype"), url("../fonts/glyphicons-halflings-regular.svg#glyphicons_halflingsregular") format("svg");
		}

		.glyphicon {
			position: relative;
			top: 1px;
			display: inline-block;
			font-family: "Glyphicons Halflings";
			font-style: normal;
			font-weight: 400;
			line-height: 1;
			-webkit-font-smoothing: antialiased;
			-moz-osx-font-smoothing: grayscale;
		}

		.glyphicon-wrench:before {
			content: "\e136";
		}

		.glyphicon-upload:before {
			content: "\e027";
		}

		.glyphicon-trash:before {
			content: "\e020";
		}

		.glyphicon-download:before {
			content: "\e026";
		}

		.glyphicon-edit:before {
			content: "\e065";
		}

		.glyphicon-plus:before {
			content: "\002b";
		}

		.glyphicon-eye-open:before {
			content: "\e105";
		}

		.tbldiv {
			margin: auto;
			width: 100%;
		}

		th {
			background: #4CAF50;
			color: White;
		}

		label {
			font-weight: bold;
		}

		.btnsize {
			width: 160px !important;
		}



		.goGreen h4 {
			text-align: center;
			color: #4CAF50;
		}

		.modal-dialog {
			max-width: 80% !important;
			margin: auto;
		}

		.modal-dialog-center {
			margin-top: 5%;
		}

		label.error, span.error {
			color: red;
		}

		.glyphicon-minus:before {
			content: "\2212";
		}
	</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="breadcumb-area bg-img">
		<div class="bradcumbContent">
			<h2 style="text-align:center;">Update job</h2>
		</div>
	</div>
	<asp:HiddenField ID="HiddenFieldCourseId" runat="server" />
	<asp:HiddenField ID="HiddenFieldTutorId" runat="server" />
	<div class="section-padding-100-0">
		<div id="addcourse" class="form" style="width: 80%; margin: auto;">
			<div class="row form-group">
				<label for="inputEmail3" class="col-sm-3 col-form-label myLable">Title : </label>
				<div class="col-sm-9">
					<asp:TextBox ID="TextBoxCourseName" CssClass="form-control" runat="server" minlength="4" required></asp:TextBox>
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxCourseName" CssClass="text-danger" ValidationGroup="UpdateCourseGroup" ErrorMessage="The Title field is required." />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-3">
					<label class="myLable">Job Category : </label>
				</div>
				<div class="col-sm-9">
					<asp:CheckBoxList ID="CheckBoxListCourseCategory" CssClass="mycheckbox" runat="server">
					</asp:CheckBoxList>
					<span id="errorToShow" style="position: absolute;">
						<asp:Label ID="Label1" runat="server" CssClass="error"></asp:Label></span>
					<br />
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-3 myLable">Deadline Date : </label>
				<div class="col-sm-9">
					<asp:TextBox runat="server" ID="TextBoxScheduleDate" TextMode="DateTimeLocal" CssClass="form-control" required></asp:TextBox>
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxScheduleDate" CssClass="text-danger" ValidationGroup="UpdateCourseGroup" ErrorMessage="Pick a date." />
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-3 myLable">Posted Date : </label>
				<div class="col-sm-9">
					<asp:TextBox runat="server" ID="TextBoxCreatedDate" ReadOnly="true" Enabled="false" CssClass="form-control"></asp:TextBox>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-3 col-form-label myLable">Description : </label>
				<div class="col-sm-9">
					<asp:TextBox ID="TextBoxCourseDescription" CssClass="form-control" runat="server" Style="height: 100px" minlengty="5" required></asp:TextBox>
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxCourseDescription" CssClass="text-danger" ValidationGroup="UpdateCourseGroup" ErrorMessage="The Description field is required." />
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-3 col-form-label myLable">Salary : </label>
				<div class="col-sm-9">
					<asp:TextBox ID="TextBoxsalary" CssClass="form-control" runat="server" required></asp:TextBox>
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxsalary" CssClass="text-danger" ValidationGroup="UpdateCourseGroup" ErrorMessage="The Salary field is required." />
				</div>
			</div>
			
			<div class="row form-group">
				<label class="col-sm-3 col-form-label myLable">Location : </label>
				<div class="col-sm-9">
					<select runat="server" id="ddl0" name="ddl0" class="form-control required"></select>
				</div>
				<asp:HiddenField ID="SendA" runat="server" Value="0" />

			</div>
			<div class="row form-group">
				<label class="col-sm-3 col-form-label myLable">Vacant : </label>
				<div class="col-sm-9">
					 <asp:CheckBox ID="CheckBoxvacant" runat="server" />
				</div>
			</div>
			<div class="row form-group">
				<div class="col-sm-9"></div>
				
			</div>
			
			<br />
			<br />

			<br />
			<br />
			<div class="row form-group">

				<asp:linkButton CssClass="btn btn-primary col-sm-3" ID="btnview" OnClick="btview_Click" Text="View Jobs" runat="server" ValidationGroup="ViewMaterialAddGroup" />
				<div class="col-sm-6"></div>
				<asp:Button CssClass="mybtn btn btn-warning col-sm-3" OnClick="btnUpdate_Click" ID="btnUpdate" OnClientClick="return confirm('Are you sure you want to update');" Text="Update Job" runat="server" ValidationGroup="UpdateCourseGroup" />
		
			</div>
			<br />
			<br />


		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">

	<script src='<%= ResolveClientUrl("~/plugins/jqueryvalidation/jquery.validate.min.js") %>'></script>

	<script src='<%= ResolveClientUrl("~/plugins/jqueryvalidation/additional-methods.min.js") %>'></script>

	<script>	


		(function ($) {
			"use strict";
			$(document).ready(function () {
				//init dataTables
				$('#gvs').dataTable({
					lengthChange: true,
					aoColumnDefs: [{ bSortable: false, aTargets: [-1] }],
					info: true,
					pageLength: 5
				});
			});
		}(jQuery));
		function OpenModalViewList() {
			$(document).ready(function () {
				$('#modMatList').modal('show');
			});
		}

	</script>
	<script type="text/javascript">
		$(`#<%=btnUpdate.ClientID%>`).click(function () {
			$('#myform').validate();
			$('[name*="ddl"]').each(function () { $(this).rules('add', { required: false }); });
			$('#<%=TextBoxCourseName.ClientID%>').rules('add', { required: true });
		$('#<%=TextBoxScheduleDate.ClientID%>').rules('add', { required: true });
		$('#<%=TextBoxCourseDescription.ClientID%>').rules('add', { required: true });
		$('#<%=TextBoxsalary.ClientID%>').rules('add', { required: true });
	});



		</script>
</asp:Content>
