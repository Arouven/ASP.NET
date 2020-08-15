<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="TutorViewProfile.aspx.vb" Inherits="TeacherStudent.TutorViewProfile" %>
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

		
		label.error, span.error {
			color: red;
		}

		
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="form">
		<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/gallery1.jpg);">
			<div class="bradcumbContent">
				<h2>Viewing Profile</h2>
			</div>
		</div>
		<div class="section-padding-100-0">
			<div class="text-center" style="margin: auto;">
				<h2>
					<asp:Label ID="LabelTutorName" runat="server"></asp:Label></h2>
				<asp:Image ID="ImageTutorProfile" CssClass="pull-right" runat="server" Style="display: block; margin-left: auto; width: 100px; height: 100px; border-radius: 50%;" AlternateText="Profile Picture" />
				<br />
				<br />
			</div>
			<asp:HiddenField ID="HiddenFieldTutorId" runat="server" />
			<div  style="width: 80%; margin: auto;">
				<div class="row form-group">
					<div class="col-sm-3"></div>
					<label class="col-sm-3 ">User Name : </label>
					<div class="col-sm-4">
						<asp:Label ID="LabelTutorUserName" runat="server"></asp:Label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-3"></div>
					<label class="col-sm-3 ">First Name : </label>
					<div class="col-sm-4">
						<asp:Label ID="LabelTutorFirstName" runat="server"></asp:Label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-3"></div>
					<label class="col-sm-3 ">Last Name : </label>
					<div class="col-sm-4">
						<asp:Label ID="LabelTutorLastName" runat="server"></asp:Label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-3"></div>
					<label class="col-sm-3 ">Date of Birth : </label>
					<div class="col-sm-4">
						<asp:Label ID="LabelDOB" runat="server"></asp:Label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-3"></div>
					<label class="col-sm-3 col-form-label">Address : </label>
					<div class="col-sm-4">
						<asp:Label ID="LabelAddress" runat="server"></asp:Label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-3"></div>
					<label class="col-sm-3 col-form-label">Phone : </label>
					<div class="col-sm-4">
						<asp:Label ID="LabelPhone" runat="server"></asp:Label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-3"></div>
					<label class="col-sm-3 col-form-label">Email : </label>
					<div class="col-sm-4">
						<asp:Label ID="LabelEmail" runat="server"></asp:Label>
					</div>
				</div>
				<br />
				<div class="form-group">
					<div class="tbldiv">
						<asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">

							<Columns>
								<asp:BoundField DataField="CertificationName" HeaderText="Certification Name" />
								<asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<asp:LinkButton ID="btnDelete" OnClick="btnDelete_Click" CommandArgument='<%#Eval("CertificationID") %>' CssClass="btn btn-danger" runat="server" Text="Delete" ToolTip="Delete Material"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>&nbsp;&nbsp;

									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>
					</div>
				</div>

				<div class="row form-group">
					<label class="col-sm-3 col-form-label myLable">New Certifite : </label>
					<div class="col-sm-6">
					<asp:TextBox ID="TextBoxCert" CssClass="form-control" runat="server" required></asp:TextBox></div>
					<asp:Button ID="ButtonAddCert" runat="server" Text="Add Certification" OnClick="ButtonAddCert_Click" CssClass="btn btn-success col-sm-3"/>					
				</div>
				<div id="existMessage"></div>
				<br />
				<br />

				<div class="row form-group">
					<asp:linkButton CssClass="btn btn-primary col-sm-3 float-left" OnClick="btnUpdate_Click" ID="btUpdate" Text="Update Profile" runat="server" />
					<div class="col-sm-6"></div>
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

		$('#myform').validate();
		
		$(document).ready(function () {
			$(`#<%=TextBoxCert.ClientID%>`).keyup(function () {
				var certificationName = $(this).val();
				var tutorId = $(`#<%=HiddenFieldTutorId.ClientID%>`).val();
				$('#existMessage').text('');
				if (certificationName.length >= 1) {
					$.ajax({
						url: 'WebServiceCertExist.asmx/CertExist',
						method: 'post',
						data: { certificationName: certificationName ,tutorId:tutorId},
						dataType: 'json',
						success: function (data) {
							var divElement = $('#existMessage');
							if (data.CertificateNameInUse1) {
								divElement.text(certificationName + ' already in use');
								divElement.css('color', 'red');
								$(`#<%=ButtonAddCert.ClientID%>`).attr("disabled", true);
							}
							else {
								divElement.text(certificationName + ' available')
								divElement.css('color', 'green');
								$(`#<%=ButtonAddCert.ClientID%>`).attr("disabled", false);
							}
						},
						error: function (err) {
							alert(err);
						}
					});
				}
			});
		});
		

	</script>
</asp:Content>

