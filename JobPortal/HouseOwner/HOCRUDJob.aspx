<%@ Page Title="Posted Job" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="HOCRUDJob.aspx.vb" Inherits="JP.HOCRUDJob" %>
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
      background-color: #222845;
      color: white !important;
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
      background: #3055FE;
      width: 100%;
      border: 0;
      padding: 15px;
      color: #FFFFFF;
      font-size: 14px;
      cursor: pointer;
      border-radius: 8px;
    }

      .form .myBtn:hover, .form .myBtn:active, .form .myBtn:focus {
        background: blue;
      }

    .goGreen h4 {
      text-align: center;
      color: #3055FE;
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
	<div class="breadcumb-area bg-img" >
		<div class="bradcumbContent">
			<h2 style="text-align:center;">List Of My Posted Jobs</h2>
		</div>
	</div>
	<div class="section-padding-100-0">
		<div class="tbldiv">
			<asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">
				<Columns>
					<asp:BoundField DataField="Title" HeaderText="Job Title" />
					<asp:BoundField DataField="LocationName" HeaderText="Location" />
					<asp:BoundField DataField="Salary" HeaderText="Salary(MRU)" />
					<asp:BoundField DataField="DatePosted" HeaderText="DatePosted" />
					<asp:BoundField DataField="DeadlineDate" HeaderText="Deadline Date" />
					<asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:UpdatePanel runat="server" ID="updatePanel000">
								<ContentTemplate>
									<asp:LinkButton ID="btnDelete" CssClass="btn btn-danger" runat="server" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete?');" CommandArgument='<%# Eval("jobId") %>' Text="Delete" ToolTip="Delete Category"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
									&nbsp;&nbsp;
								<asp:LinkButton ID="btnViewCourse" CssClass="btn btn-light" href='<%#Eval("jobId", "/HouseOwner/ViewJob.aspx?id={0}")%>' runat="server" Text="View" ToolTip="View Job"><span class="glyphicon glyphicon-eye-open"></span></asp:LinkButton>
									&nbsp;&nbsp;
								<asp:LinkButton ID="btnUpdate" CssClass="btn btn-warning" href='<%#Eval("JobId", "/HouseOwner/UpdateJob.aspx?id={0}")%>' runat="server" Text="Update" ToolTip="Update Job"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
								</ContentTemplate>
							</asp:UpdatePanel>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
			<br />
			<asp:LinkButton ID="LinnkButtonAdd" CssClass="btn btn-info col-sm-2" OnClick="AddButton_Click" runat="server" Text="Add" ToolTip="Add Course">Add&nbsp;&nbsp;<span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
		</div>
	</div>
	
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
	
	<script src='<%= ResolveClientUrl("~/plugins/datatables/date-euro.js") %>'></script>
<%--	<script src="https://cdn.datatables.net/plug-ins/1.10.21/sorting/date-euro.js"></script>--%>
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