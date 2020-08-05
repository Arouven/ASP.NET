<%@ Page Title="Course Details" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="ViewCourse.aspx.vb" Inherits="TeacherStudent.ViewCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
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
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="form" style="width: 80%; margin: auto;">
		<div class="row form-group">
			<div class="col-sm-10">
				<br />
				<h1>Viewing Course: 
				<asp:Label ID="LabelTitle" runat="server"></asp:Label>
				</h1>
				<asp:HiddenField ID="HiddenFieldCourseId" runat="server" />
				<asp:HiddenField ID="HiddenFieldTutorId" runat="server" />
			</div>
		</div>

		<div>
			<div class="row form-group">
				<label class="col-sm-3 ">Course Name : </label>
				<div class="col-sm-9">
					<asp:Label ID="LabelCourseName" runat="server"></asp:Label>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-3 ">Date Created : </label>
				<div class="col-sm-9">
					<asp:Label ID="LabelDateCreated" runat="server"></asp:Label>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-3">Date Schedule : </label>
				<div class="col-sm-9">
					<asp:Label ID="LabelDateSchedule" runat="server"></asp:Label>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-3 col-form-label">Description : </label>
				<div class="col-sm-9">
					<asp:Label ID="LabelCourseDescription" runat="server"></asp:Label>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-3 col-form-label">Aims And Objectives : </label>
				<div class="col-sm-9">
					<asp:Label ID="LabelAimsAndObjectives" runat="server"></asp:Label>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-3 col-form-label">Category Name : </label>
				<div class="col-sm-9">
					<asp:Label ID="LabelCategoryName" runat="server"></asp:Label>
				</div>
			</div>
			<br />
			<br />
			<div class="row form-group">
				<label class="col-sm-3 col-form-label">Materials : </label>
				<div class="col-sm-9">
					<asp:LinkButton CssClass="btn btn-primary" rel="modal:open" data-toggle="modal" OnClientClick="return OpenModalViewList();" href="#modMatList" runat="server" Text="Materials" ToolTip="Materials List"></asp:LinkButton>
				</div>
			</div>
			<div class="row form-group d-flex justify-content-around">

				<asp:LinkButton ID="LinkButtonBack" CssClass="btn btn-success btnsize" runat="server" ValidationGroup="ValidationGroupUser">Back</asp:LinkButton>
				<asp:LinkButton ID="LinkButtonUpdate" CssClass="btn btn-primary btnsize" OnClientClick="return confirm('Are you sure you want to update this user status?')" runat="server" ValidationGroup="ValidationGroupUser">Freeze/ Unfreeze</asp:LinkButton>
				<asp:LinkButton ID="LinkButtonDelete" CssClass="btn btn-danger btnsize" OnClientClick="return confirm('Are you sure you want to delete this user?')" runat="server" ValidationGroup="ValidationGroupUser">Delete</asp:LinkButton>
				<asp:LinkButton ID="LinkButtonResetPassword" CssClass="btn btn-warning btnsize" runat="server" ValidationGroup="ValidationGroupUser">Reset Password</asp:LinkButton>
			</div>
		</div>
	</div>
	<asp:UpdatePanel runat="server" ID="updatePanelTop1" UpdateMode="Conditional" ChildrenAsTriggers="True">
		<ContentTemplate>
			<div class="modal fade" id="modMatList" role="dialog">
				<div class="modal-dialog modal-dialog-center">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="text-align: center;">
							<button type="button" class="modal-title close">Materials</button>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<asp:UpdatePanel runat="server">
								<ContentTemplate>
									<div class="form goGreen">
										<div class="form-group">
											<h4>
												<asp:Label ID="Label1" runat="server" Text="Materials"></asp:Label>
											</h4>
										</div>
										<br />
										<div class="form-group">
											<div class="tbldiv">
												<asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">
													<Columns>
														<asp:BoundField DataField="MaterialPathUrl" HeaderText="Material Name" />
														<asp:BoundField DataField="MaterialTypeName" HeaderText="Type" />
														<asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
															<ItemTemplate>
																<asp:LinkButton ID="btnView" CssClass="btn btn-info" runat="server" target="_blank" href='<%#String.Format("OpenDocuments.aspx?filepath={0}", Eval("MaterialPathUrl")) %>' Text="View" ToolTip="View Material"><span class="glyphicon glyphicon-eye-open"></span></asp:LinkButton>&nbsp;&nbsp;

																<asp:LinkButton ID="btnEdit" CssClass="btn btn-warning" runat="server" Text="Edit" ToolTip="Edit Material"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>&nbsp;&nbsp;

																<asp:LinkButton ID="btnDownload" OnClick="btnDownload_Click" CommandArgument='<%#Eval("MaterialPathUrl") %>' CssClass="btn btn-success" runat="server" Text="Download" ToolTip="Download Material"><span class="glyphicon glyphicon-download"></span></asp:LinkButton>
															</ItemTemplate>
														</asp:TemplateField>
													</Columns>
												</asp:GridView>
												<br />
												<asp:LinkButton ID="btnAdd" CssClass="btn btn-success col-sm-2"  OnClick="btnAdd_Click"   runat="server" Text="Add" ToolTip="Add Category">Add&nbsp;&nbsp;<span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
											</div>
										</div>
									</div>
								</ContentTemplate>
							</asp:UpdatePanel>
						</div>
					</div>
				</div>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
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
</asp:Content>
