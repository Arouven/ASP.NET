<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="ViewEvents.aspx.vb" Inherits="TeacherStudent.ViewEvents" %>

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
			width: 90%;
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
	<h1>My Events</h1>

	<div class="tbldiv">
		<asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">
			<Columns>
				<asp:BoundField DataField="EventName" HeaderText="Event Name" />
				<asp:BoundField DataField="EventDetail" HeaderText="Event Details" />
				<asp:BoundField DataField="Location" HeaderText="Location" />
				<asp:BoundField DataField="DateSchedule" HeaderText="Date Schedule" />
				<asp:BoundField DataField="DateCreated" HeaderText="Date Created" />
				<asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
					<ItemTemplate>
						<asp:LinkButton ID="btnEdit" CssClass="btn btn-warning" rel="modal:open" data-toggle="modal"
							OnClientClick='<%# String.Format("return OpenModal({0}, ""{1}"", ""{2}"", ""{3}"", ""{4}"", ""{5}"");", Eval("EventId"), Eval("EventName"), Eval("EventDetail"), Eval("Location"), Eval("DateSchedule"), Eval("DateCreated")) %>'
							href="#modUpdateEvent" runat="server" Text="Edit" ToolTip="Edit Event"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>&nbsp;&nbsp;

						<asp:LinkButton OnClick="btnDelete_Click" CommandArgument='<%# Eval("EventId") %>' OnClientClick="return Confirm('Are you sure you want to delete this event?');" ID="btnDelete" CssClass="btn btn-danger" runat="server" Text="Delete" ToolTip="Delete Event"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>&nbsp;&nbsp;

					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
		<br />
		<asp:LinkButton ID="btnAdd" CssClass="btn btn-success col-sm-2" runat="server" OnClick="btnAdd_Click" Text="Add" ToolTip="Add Event">Add&nbsp;&nbsp;<span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
	</div>

	<asp:UpdatePanel runat="server" ID="updatePanelTop2" UpdateMode="Conditional" ChildrenAsTriggers="True">
		<ContentTemplate>
			<div class="modal fade" id="modUpdateEvent" role="dialog">
				<div class="modal-dialog modal-dialog-center">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="text-align: center;">
							<button type="button" class="modal-title close">Update Event</button>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<asp:UpdatePanel runat="server">
								<ContentTemplate>
									<div class="form goGreen">
										<div class="form-group">
											<h4>
												<asp:Label ID="LabelUpdateEventName" runat="server"></asp:Label>
											</h4>
											<asp:HiddenField ID="myHiddenId" runat="server" />
										</div>
										<div class="form-group">
											<asp:TextBox ID="TextBoxEventName" runat="server" CssClass="tbInput" />
											<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxEventName" CssClass="text-danger" ValidationGroup="ViewEventUpdateGroup" ErrorMessage="Field is required." />
										</div>
										<div class="form-group">
											<asp:TextBox ID="TextBoxEventDetail" runat="server" CssClass="tbInput" />
											<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxEventDetail" CssClass="text-danger" ValidationGroup="ViewEventUpdateGroup" ErrorMessage="Field is required." />
										</div>
										<div class="form-group">
											<asp:TextBox ID="TextBoxLocation" runat="server" CssClass="tbInput" />
											<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxLocation" CssClass="text-danger" ValidationGroup="ViewEventUpdateGroup" ErrorMessage="Field is required." />
										</div>
										<div class="form-group">
											<asp:TextBox ID="TextBoxDateSchedule" runat="server" CssClass="tbInput" />
											<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxDateSchedule" CssClass="text-danger" ValidationGroup="ViewEventUpdateGroup" ErrorMessage="Field is required." />
										</div>
										<div class="form-group">
											<asp:TextBox ID="TextBoxDateCreated" runat="server" CssClass="tbInput" />
											<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxDateCreated" CssClass="text-danger" ValidationGroup="ViewEventUpdateGroup" ErrorMessage="Field is required." />
										</div>
										<div class="form-group">
											<asp:Button ID="UpdateButton" ValidationGroup="ViewEventUpdateGroup" OnClientClick="return confirm('Are you sure you want to update?');" CssClass="myBtn" runat="server" Text="Update Event" OnClick="UpdateButton_Click" />
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
		function OpenModal(MyId, EventName, EventDetail, location, dateSchedule, dateCreated) {
			$(document).ready(function () {
				$(`#<%=myHiddenId.ClientID%>`).val(MyId);
				$(`#<%=LabelUpdateEventName.ClientID%>`).text("Update Event : " + EventName);
				$(`#<%=TextBoxEventName.ClientID%>`).val(EventName);
				$(`#<%=TextBoxEventDetail.ClientID%>`).val(EventDetail);
				$(`#<%=TextBoxLocation.ClientID%>`).val(location);
				$(`#<%=TextBoxDateSchedule.ClientID%>`).val(dateSchedule);
				$(`#<%=TextBoxDateCreated.ClientID%>`).val(dateCreated);
				$('#modUpdateEvent').modal('show');
			});
		};
	</script>
</asp:Content>
