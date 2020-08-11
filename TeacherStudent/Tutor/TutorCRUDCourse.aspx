<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="TutorCRUDCourse.aspx.vb" Inherits="TeacherStudent.TutorCRUDCourse" %>

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
			width: 90%;
		}

		th {
			background: #4CAF50;
			color: White;
		}


		.form .tbInput {
			font-family: "Roboto", sans-serif;
			outline: 0;
			background: #f2f2f2;
			width: 100%;
			border: 0;
			margin: 0 0 15px;
			padding: 15px;
			box-sizing: border-box;
			font-size: 14px;
			border-radius: 8px;
		}

		.form .myBtn {
			font-family: "Roboto", sans-serif;
			text-transform: uppercase;
			outline: 0;
			background: #4CAF50;
			width: 100%;
			border: 0;
			padding: 15px;
			color: #FFFFFF;
			font-size: 14px;
			cursor: pointer;
			border-radius: 8px;
		}

			.form .myBtn:hover, .form .myBtn:active, .form .myBtn:focus {
				background: #43A047;
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
	<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/tea2.jpg);">
		<div class="bradcumbContent">
			<h2>List Of My Courses</h2>
		</div>
	</div>
	<div class="section-padding-100-0">
		<div class="tbldiv">
			<asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">
				<Columns>
					<asp:BoundField DataField="courseName" HeaderText="Course Name" />
					<asp:BoundField DataField="dateSchedule" HeaderText="Date Schedule" />
					<asp:BoundField DataField="dateCreated" HeaderText="Date Created" />
					<asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:UpdatePanel runat="server" ID="updatePanel000">
								<ContentTemplate>
									<asp:LinkButton ID="btnDelete" CssClass="btn btn-danger" runat="server" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete?');" CommandArgument='<%# Eval("courseId") %>' Text="Delete" ToolTip="Delete Category"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
									&nbsp;&nbsp;
								<asp:LinkButton ID="btnViewCourse" CssClass="btn btn-light" href='<%#Eval("courseId", "/Tutor/ViewCourse.aspx?id={0}")%>' runat="server" Text="View" ToolTip="View Course"><span class="glyphicon glyphicon-eye-open"></span></asp:LinkButton>
									&nbsp;&nbsp;
								<asp:LinkButton ID="btnUpdate" CssClass="btn btn-warning" href='<%#Eval("courseId", "~/Tutor/UpdateCourse.aspx?id={0}")%>' runat="server" Text="Update" ToolTip="Update Course"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
								</ContentTemplate>
							</asp:UpdatePanel>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
			<br />
			<asp:LinkButton ID="LinnkButtonAdd" CssClass="btn btn-success col-sm-2" OnClick="AddButton_Click" runat="server" Text="Add" ToolTip="Add Course">Add&nbsp;&nbsp;<span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
		</div>
	</div>
	<%--<asp:UpdatePanel runat="server" ID="updatePanelTop1" UpdateMode="Conditional" ChildrenAsTriggers="True">
		<ContentTemplate>
			<div class="modal fade" id="modAddCourse" role="dialog">
				<div class="modal-dialog modal-dialog-center">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="text-align: center;">
							<button type="button" class="modal-title close">Add Course</button>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<asp:UpdatePanel runat="server">
								<ContentTemplate>
									<div class="form goGreen">
										<div class="form-group">
											<h4 class="modal-title">
												<asp:Label ID="LabelAddCourseName" runat="server" Text="Add New Course"></asp:Label>
											</h4>
										</div>
										<br />
										<div class="form-group">
											<asp:TextBox ID="TextBoxAddCourse" placeholder="Week 10" runat="server" CssClass="tbInput" ValidationGroup="AddCourseGroup" />
											<div id="emptyMessageAdd"></div>
											<div id="existMessageAdd"></div>
										</div>


										<div class="form-group">
									<asp:TextBox ID="TextBoxPasswordTutorLog" runat="server" TextMode="Password" placeholder="Password" CssClass="tbInput"></asp:TextBox><br />
									<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxPasswordTutorLog" CssClass="text-danger" ValidationGroup="tutorLoginGroup" ErrorMessage="The password field is required." />
								</div>


										<div class="form-group">
											<asp:Button ID="AddButton" ValidationGroup="AddCourseGroup" CssClass="myBtn" runat="server" Text="Add Course" OnClick="AddButton_Click" />
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

	<asp:UpdatePanel runat="server" ID="updatePanelTop2" UpdateMode="Conditional" ChildrenAsTriggers="True">
		<ContentTemplate>
			<div class="modal fade" id="modUpdateCourse" role="dialog">
				<div class="modal-dialog modal-dialog-center">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="text-align: center;">
							<button type="button" class="modal-title close">Update Course</button>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<asp:UpdatePanel runat="server">
								<ContentTemplate>
									<div class="form goGreen">
										<div class="form-group">
											<h4 class="modal-title">
												<asp:Label ID="LabelUpdateCourseName" runat="server"></asp:Label>
											</h4>
											<asp:HiddenField ID="myHiddenId" runat="server" />
										</div>
										<div class="form-group">
											<asp:TextBox ID="TextBoxUpdateCourse" runat="server" CssClass="tbInput" />
											<div id="emptyMessage"></div>
											<div id="existMessage"></div>
										</div>
										<div class="form-group">
											<asp:Button ID="UpdateButton" ValidationGroup="CourseGroup" OnClientClick="return confirm('Are you sure you want to update?');" CssClass="myBtn" runat="server" Text="Update Course" OnClick="UpdateButton_Click" />
										</div>
									</div>
								</ContentTemplate>
							</asp:UpdatePanel>
						</div>
					</div>
				</div>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server"><script src="https://cdn.datatables.net/plug-ins/1.10.21/sorting/date-euro.js"></script>
	<script>
		(function ($) {
			"use strict";
			$(document).ready(function () {
				//init dataTables
				$('#gvs').dataTable({
					lengthChange: true,
					columnDefs: [{ type: 'date-euro', targets: 2 }, { type: 'date-euro', targets: 1 }, { "orderable": false, "targets": -1 }],
					info: true,
					pageLength: 10
				});
			});
		}(jQuery));

	</script>
</asp:Content>
