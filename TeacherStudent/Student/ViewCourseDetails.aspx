<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="ViewCourseDetails.aspx.vb" Inherits="TeacherStudent.ViewCourseDetails" %>
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

	<div class="form">
		<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/gallery1.jpg);">
			<div class="bradcumbContent">
				<h2>Viewing Course</h2>
			</div>
		</div>
		<asp:HiddenField ID="HiddenFieldCourseId" runat="server" />
		<asp:HiddenField ID="HiddenFieldTutorId" runat="server" />
		<div class="section-padding-100-0">
			<div class="text-center" style="margin: auto;">
				<h2>
					<asp:Label ID="LabelTitle" runat="server"></asp:Label></h2>
				<br />
				<br />
			</div>
			<div  style="width: 80%; margin: auto;">
				<div class="row form-group">
					<div class="col-sm-3"></div>
					<label class="col-sm-3 ">Course Name : </label>
					<div class="col-sm-4">
						<asp:Label ID="LabelCourseName" runat="server"></asp:Label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-3"></div>
					<label class="col-sm-3 ">Date Created : </label>
					<div class="col-sm-4">
						<asp:Label ID="LabelDateCreated" runat="server"></asp:Label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-3"></div>
					<label class="col-sm-3">Date Schedule : </label>
					<div class="col-sm-4">
						<asp:Label ID="LabelDateSchedule" runat="server"></asp:Label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-3"></div>
					<label class="col-sm-3 col-form-label">Description : </label>
					<div class="col-sm-4">
						<asp:Label ID="LabelCourseDescription" runat="server"></asp:Label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-3"></div>
					<label class="col-sm-3 col-form-label">Aims And Objectives : </label>
					<div class="col-sm-4">
						<asp:Label ID="LabelAimsAndObjectives" runat="server"></asp:Label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-3"></div>
					<label class="col-sm-3 col-form-label">Category Name : </label>
					<div class="col-sm-4">
						<asp:Label ID="LabelCategoryName" runat="server"></asp:Label>
					</div>
				</div>
				<br />
				<div class="form-group">
					<div class="tbldiv">
						<asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">

							<Columns>
								<asp:BoundField DataField="MaterialName" HeaderText="Material Name" />
								<asp:BoundField DataField="MaterialTypeName" HeaderText="Type" />
								<asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<asp:LinkButton ID="btnDelete" OnClick="btnDelete_Click" CommandArgument='<%#Eval("MaterialID") %>' CssClass="btn btn-danger" runat="server" Text="Delete" ToolTip="Delete Material"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>&nbsp;&nbsp;

										<asp:LinkButton ID="btnView" CssClass="btn btn-info" runat="server" target="_blank" href='<%#String.Format("OpenDocuments.aspx?filepath={0}", Eval("MaterialPathUrl")) %>' Text="View" ToolTip="View Material"><span class="glyphicon glyphicon-eye-open"></span></asp:LinkButton>&nbsp;&nbsp;
																																
											<asp:LinkButton ID="btnDownload" OnClick="btnDownload_Click" CommandArgument='<%#Eval("MaterialPathUrl") %>' CssClass="btn btn-success" runat="server" Text="Download" ToolTip="Download Material"><span class="glyphicon glyphicon-download"></span></asp:LinkButton>


									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>
					</div>
				</div>

				<div class="row form-group">
					<label class="col-sm-3 col-form-label myLable">Upload Materials : </label>

					<div class="col-sm-4">
						<input id="file0" name="file0" type="file" runat="server" required class="form-control-file" />
					</div>
					<div class="col-sm-4">
						<select runat="server" id="ddl0" name="ddl0" class="form-control required"></select>
					</div>
					<asp:HiddenField ID="SendA" runat="server" Value="0" />
					<div class="col-sm-1">
						<button id="Button00" class="btn btn-primary" type="button" value="Add" onclick="AddFileUpload()" data-toggle="tooltip"><span class="glyphicon glyphicon-plus"></span></button>
					</div>
				</div>
				<div id="duplicateHere">
					<!--FileUpload Controls will be added here -->
				</div>
				<br />
				<br />

				<div class="row form-group">
					<asp:linkButton CssClass="btn btn-primary col-sm-3 float-left" OnClick="btnUpdate_Click" ID="btUpdate" Text="Update Course" runat="server" ValidationGroup="ViewMaterialAddGroup" />
					<div class="col-sm-6"></div>
					<asp:Button CssClass="btn btn-success col-sm-3 float-right" OnClick="btnUpload_Click" OnClientClick="verify()" ID="btUpload" Text="Add Material" runat="server" ValidationGroup="ViewMaterialAddGroup" />
				</div>
				<br />
				<br />

			</div>
		</div>
	</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
	<script src='<%= ResolveClientUrl("~/js/jquery/validate/jquery.validate.js") %>'></script>

	<script src='<%= ResolveClientUrl("~/js/jquery/validate/additional-methods.js") %>'></script>

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
		$('#myform').validate();
		$.validator.addMethod('filesize', function (value, element, param) {
			return this.optional(element) || (element.files[0].size <= param * 1000000)
		}, 'File size must be less than {0} MB');
		$('[name*="ddl"]').each(function () {
			$(this).rules('add', {
				required: true,
				messages: {
					required: "Please Select a Type"
				}
			});
		});
		$('[name*="file"]').each(function () {
			$(this).rules('add', {
				required: true,
				filesize: 3

			});
		});

		function verify() {
			var x = confirm('Note that existing files with same names will be overwritten');
		}

		var counter = 1;
		function AddFileUpload() {
			var options = document.getElementById(`<%=ddl0.ClientID%>`).innerHTML;

			var div = document.createElement('DIV');
			div.innerHTML = '<div class="row form-group">' +
				'<div class="col-sm-3"></div>' +
				'<div class="col-sm-4">' +
				'<input id="file' + counter + '" name = "file' + counter +
				'" type="file" required />' +
				'</div>' +
				'<div class="col-sm-4">' +
				'<select id="ddl' + counter + '" name = "ddl' + counter +
				'" class="form-control required" >' + options + '</select>' +
				'</div>' +
				'<div class="col-sm-1">' +
				'<button id="Button' + counter + '" type="button" ' +
				'value="Remove" onclick = "RemoveFileUpload(this)" Class="btn btn-warning" title="Remove Materials"  ><span class="glyphicon glyphicon-minus"></span></button>' +
				'</div>' +
				'</div>';
			document.getElementById("duplicateHere").appendChild(div);
			document.getElementById("<%=SendA.ClientID%>").value = counter;
			document.getElementById("ddl" + counter).selectedIndex = "0";
			counter++;
		}

		function RemoveFileUpload(div) {
			document.getElementById("duplicateHere").removeChild(div.parentNode.parentNode.parentNode);
		}

	</script>
</asp:Content>