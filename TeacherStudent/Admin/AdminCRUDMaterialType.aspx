<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="AdminCRUDMaterialType.aspx.vb" Inherits="TeacherStudent.AdminCRUDMaterialType" %>

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
	<div class="col-sm-12 text-center">
		<br />
		<h2>List Of Material Type</h2>
		<br />
		<br />
	</div>
	<div class="tbldiv">
		<asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">
			<Columns>
				<asp:BoundField DataField="MaterialTypeName" HeaderText="Material Name" />
				<asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
					<ItemTemplate>
						<asp:LinkButton ID="btnDelete" CssClass="btn btn-danger" runat="server" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete?');" CommandArgument='<%# Eval("MaterialTypeId") %>' Text="Delete" ToolTip="Delete Material"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
						&nbsp;&nbsp;
						<asp:LinkButton CssClass="btn btn-warning" rel="modal:open" data-toggle="modal" OnClientClick='<%# String.Format("return OpenModal({0}, ""{1}"");", Eval("MaterialTypeId"), Eval("MaterialTypeName")) %>' href="#modUpdateMaterial" runat="server" Text="Update" ToolTip="Update Material"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
		<br />
		<asp:LinkButton ID="btnAdd" CssClass="btn btn-success col-sm-2" rel="modal:open" data-toggle="modal" OnClientClick="return OpenMod();" href="#modAddMaterial" runat="server" Text="Add" ToolTip="Add Material">Add&nbsp;&nbsp;<span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
	</div>

	<asp:UpdatePanel runat="server" ID="updatePanelTop1" UpdateMode="Conditional" ChildrenAsTriggers="True">
		<ContentTemplate>
			<div class="modal fade" id="modAddMaterial" role="dialog">
				<div class="modal-dialog modal-dialog-center">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="text-align: center;">
							<button type="button" class="modal-title close">Add Material</button>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<asp:UpdatePanel runat="server">
								<ContentTemplate>
									<div class="form goGreen">
										<div class="form-group">
											<h4>
												<asp:Label ID="LabelAddMaterialName" runat="server" Text="Add New Material"></asp:Label>
											</h4>
										</div>
										<br />
										<div class="form-group">
											<asp:TextBox ID="TextBoxAddMaterial" placeholder="Assignment" runat="server" CssClass="tbInput" ValidationGroup="AddMaterialGroup" />
											<div id="emptyMessageAdd"></div>
											<div id="existMessageAdd"></div>
										</div>
										<div class="form-group">
											<asp:Button ID="AddButton" ValidationGroup="AddMaterialGroup" CssClass="myBtn" runat="server" Text="Add Material" OnClick="AddButton_Click" />
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
			<div class="modal fade" id="modUpdateMaterial" role="dialog">
				<div class="modal-dialog modal-dialog-center">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="text-align: center;">
							<button type="button" class="modal-title close">Update Material</button>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<asp:UpdatePanel runat="server">
								<ContentTemplate>
									<div class="form goGreen">
										<div class="form-group">
											<h4>
												<asp:Label ID="LabelUpdateMaterialName" runat="server"></asp:Label>
											</h4>
											<asp:HiddenField ID="myHiddenId" runat="server" />
										</div>
										<div class="form-group">
											<asp:TextBox ID="TextBoxUpdateMaterial" runat="server" CssClass="tbInput" />
											<div id="emptyMessage"></div>
											<div id="existMessage"></div>
										</div>
										<div class="form-group">
											<asp:Button ID="UpdateButton" ValidationGroup="MaterialGroup" OnClientClick="return confirm('Are you sure you want to update?');" CssClass="myBtn" runat="server" Text="Update Material" OnClick="UpdateButton_Click" />
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
		function OpenModal(MyId, MyName) {
			$(document).ready(function () {
				$(`#<%=myHiddenId.ClientID%>`).val(MyId)
				$(`#<%=LabelUpdateMaterialName.ClientID%>`).text("Update from " + MyName)
				$(`#<%=TextBoxUpdateMaterial.ClientID%>`).val(MyName)
				$('#modUpdateMaterial').modal('show');
			});
		};
		function OpenMod() {
			$(document).ready(function () {
				$('#modAddMaterial').modal('show');
			});
		};
		$(document).ready(function () {
			$(`#<%=TextBoxUpdateMaterial.ClientID%>`).keyup(function () {
				var materialName = $(this).val();
				if (materialName.length >= 1) {
					$('#emptyMessage').text('');
					$.ajax({
						url: 'WebServiceMaterial.asmx/MaterialNameExists',
						method: 'post',
						data: { materialName: materialName },
						dataType: 'json',
						success: function (data) {
							var divElement = $('#existMessage');
							if (data.MaterialNameInUse1) {
								divElement.text(data.MaterialName1 + ' already in use');
								divElement.css('color', 'red');
								$(`#<%=UpdateButton.ClientID%>`).attr("disabled", true);
							}
							else {
								divElement.text(data.MaterialName1 + ' available')
								divElement.css('color', 'green');
								$(`#<%=UpdateButton.ClientID%>`).attr("disabled", false);
							}
						},
						error: function (err) {
							alert(err);
						}
					});
				}
				if (!materialName.replace(/\s/g, '').length) {
					$('#emptyMessage').text('Empty textbox');
					$('#emptyMessage').css('color', 'red');
					$(`#<%=UpdateButton.ClientID%>`).attr("disabled", true);
					$('#existMessage').text('');
				}
			});
		});
		$(document).ready(function () {
			$(`#<%=TextBoxAddMaterial.ClientID%>`).keyup(function () {
				var materialName = $(this).val();
				if (materialName.length >= 1) {
					$('#emptyMessageAdd').text('');
					$.ajax({
						url: 'WebServiceMaterial.asmx/MaterialNameExists',
						method: 'post',
						data: { materialName: materialName },
						dataType: 'json',
						success: function (data) {
							var divElement = $('#existMessageAdd');
							if (data.MaterialNameInUse1) {
								divElement.text(data.MaterialName1 + ' already in use');
								divElement.css('color', 'red');
								$(`#<%=AddButton.ClientID%>`).attr("disabled", true);
							}
							else {
								divElement.text(data.MaterialName1 + ' available')
								divElement.css('color', 'green');
								$(`#<%=AddButton.ClientID%>`).attr("disabled", false);
							}
						},
						error: function (err) {
							alert(err);
						}
					});
				}
				if (!materialName.replace(/\s/g, '').length) {
					$('#emptyMessageAdd').text('Empty textbox');
					$('#emptyMessageAdd').css('color', 'red');
					$(`#<%=AddButton.ClientID%>`).attr("disabled", true);
					$('#existMessageAdd').text('');
				}
			});
		});
	</script>
</asp:Content>
