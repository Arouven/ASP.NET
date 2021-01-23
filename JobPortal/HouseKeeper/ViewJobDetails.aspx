<%@ Page Title="Job Details" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="ViewJobDetails.aspx.vb" Inherits="JP.ViewJobDetails" %>
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

	<div class="form">
		<div class="breadcumb-area bg-img">
			<div class="bradcumbContent">
				<h2 style="text-align:center">Viewing Job</h2>
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
			<div style="width: 80%; margin: auto;">
				<div class="row form-group">
					<div class="col-sm-3"></div>
					<label class="col-sm-3 ">Title : </label>
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
					<label class="col-sm-3">Deadline Date : </label>
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
					<label class="col-sm-3 col-form-label">Salary : </label>
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
	<%--			<asp:UpdatePanel ID="UpdatePanel1" runat="server">
					<ContentTemplate>


						<div class="row form-group">
							<div class="col-sm-3"></div>
							<label class="col-sm-3 col-form-label">Show Materials : </label>
							<div class="col-sm-4">
								<asp:Button ID="ButtonShowMaterials" OnClick="ButtonShowMaterials_Click"  CssClass="btn btn-primary" runat="server" Text="Show Materials" />
								<br />
								<asp:Label ID="LabelMaterialMessage" runat="server" ForeColor="red"></asp:Label>
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

												<asp:LinkButton ID="btnView" CssClass="btn btn-info" runat="server" target="_blank" href='<%#String.Format("OpenDoc.aspx?filepath={0}", Eval("MaterialPathUrl")) %>' Text="View" ToolTip="View Material"><span class="glyphicon glyphicon-eye-open"></span></asp:LinkButton>&nbsp;&nbsp;
																																
											<asp:LinkButton ID="btnDownload" OnClick="btnDownload_Click" CommandArgument='<%#Eval("MaterialPathUrl") %>' CssClass="btn btn-success" runat="server" Text="Download" ToolTip="Download Material"><span class="glyphicon glyphicon-download"></span></asp:LinkButton>


											</ItemTemplate>
										</asp:TemplateField>
									</Columns>
								</asp:GridView>
							</div>
						</div>
					</ContentTemplate>
				</asp:UpdatePanel>--%>

				<br />
				<br />

			</div>
		</div>
	</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
	<script>	

		var prm = Sys.WebForms.PageRequestManager.getInstance();

		prm.add_endRequest(function () {
			createDataTable();
		});

		createDataTable();

		function createDataTable() {
			var table = $('#gvs').DataTable({
				lengthChange: true,
				aoColumnDefs: [{ bSortable: false, aTargets: [-1] }],
				info: true,
				pageLength: 5
			});
			$('#gvs tbody').on('click', 'tr', function () {
				$(this).toggleClass('selected');
			});
		}



	</script>
</asp:Content>
