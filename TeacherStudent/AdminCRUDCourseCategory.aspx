<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="AdminCRUDCourseCategory.aspx.vb" Inherits="TeacherStudent.AdminCRUDCourseCategory" %>

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

		.tbldiv {
			margin: auto;
			width: 90%;
		}

		th {
			background: #7aff6e;
			color: black;
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
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


	<div class="col-sm-12">
		<h1>Admin Views List Of course Category</h1>
	</div>
	<div class="tbldiv">
		<asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">
			<Columns>
				<asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
				<asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
					<ItemTemplate>
						<asp:UpdatePanel runat="server" ID="updatePanel000">
							<ContentTemplate>
								<asp:LinkButton ID="btnDelete" CssClass="btn btn-danger" runat="server" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete?');" CommandArgument='<%# Eval("CategoryId") %>' Text="Delete" ToolTip="Delete Category"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
								&nbsp;&nbsp;
								<asp:LinkButton ID="btnUpdate" CssClass="btn btn-info" rel="modal:open" data-toggle="modal" OnClientClick='<%# String.Format("return OpenModal({0}, ""{1}"");", Eval("CategoryId"), Eval("CategoryName")) %>' href="#modUpdateCategory" runat="server" Text="update" ToolTip="Update Category"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
							</ContentTemplate>
						</asp:UpdatePanel>
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
	</div>

	<asp:UpdatePanel runat="server" ID="updatePanelTop" UpdateMode="Conditional" ChildrenAsTriggers="True">
		<ContentTemplate>
			<div class="modal fade" id="modUpdateCategory" role="dialog">
				<div class="modal-dialog modal-dialog-center">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="text-align: center;">
							<button type="button" class="modal-title close">Update</button>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<asp:UpdatePanel runat="server">
								<ContentTemplate>
									<div class="form">
										<%--<asp:FormView ID="FormView1" runat="server">
											<ItemTemplate>--%>
										<div class="form-group">
											<asp:Label ID="LabelUpdateCategoryName" runat="server"></asp:Label>
											<asp:HiddenField id="myHiddenId" runat="server" />
										</div>
										<br />
										<div class="form-group">
											<asp:TextBox ID="TextBoxUpdateCategory" runat="server" CssClass="tbInput" />
											<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxUpdateCategory" CssClass="text-danger" Placeholder="Update to " ValidationGroup="CategoryGroup" ErrorMessage="The field to update field is missing." />
										</div>
										<div class="form-group">
											<asp:Button ID="UpdateButton" ValidationGroup="CategoryGroup"  CssClass="myBtn" runat="server" Text="Update" OnClick="UpdateButton_Click" />
										</div>
										<%--</ItemTemplate>
										</asp:FormView>--%>
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
		function OpenModal(MyId, MyName) {
			$(document).ready(function () {
				$(`#<%=myHiddenId.ClientID%>`).val(MyId)
				$(`#<%=LabelUpdateCategoryName.ClientID%>`).text("Update from "+MyName)
				$(`#<%=TextBoxUpdateCategory.ClientID%>`).val(MyName)
				$('#modUpdateCategory').modal('show');
			});
		};
	</script>
</asp:Content>
