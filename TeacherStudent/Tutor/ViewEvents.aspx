<%@ Page Title="My Events" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="ViewEvents.aspx.vb" Inherits="TeacherStudent.ViewEvents" %>

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

	<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/gallery1.jpg);">
		<div class="bradcumbContent">
			<h2>My Events</h2>
		</div>
	</div>
	<div class="section-padding-100-0">
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

						<asp:LinkButton CommandArgument='<%# Eval("EventId") %>' OnClientClick="return Confirm('Are you sure you want to delete this event?');" ID="btnDelete" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" ToolTip="Delete Event"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>&nbsp;&nbsp;

						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
			<br />
			<asp:LinkButton ID="btnAdd" CssClass="btn btn-success col-sm-2 " runat="server" OnClick="btnAdd_Click" Text="Add" ToolTip="Add Event">Add&nbsp;&nbsp;<span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
		</div>
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
											<b>Event Name:</b>
											<asp:TextBox ID="TextBoxEventName" runat="server" CssClass="tbInput" required />
											<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxEventName" CssClass="text-danger" ValidationGroup="ViewEventUpdateGroup" ErrorMessage="Field is required." />

										</div>
										<div class="form-group">
											<b>Event Detail:</b>
											<asp:TextBox ID="TextBoxEventDetail" runat="server" CssClass="tbInput" required />
											<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxEventDetail" CssClass="text-danger" ValidationGroup="ViewEventUpdateGroup" ErrorMessage="Field is required." />

										</div>
										<div class="form-group">
											<b>Event Location:</b>
											<asp:TextBox ID="TextBoxLocation" runat="server" CssClass="tbInput" required />
											<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxLocation" CssClass="text-danger" ValidationGroup="ViewEventUpdateGroup" ErrorMessage="Field is required." />

										</div>
										<div class="form-group">
											<b>Event Date Schedule:</b>
											<asp:TextBox ID="TextBoxDateSchedule" runat="server" textmode="DateTimeLocal" CssClass="tbInput" required />
											<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxDateSchedule" CssClass="text-danger" ValidationGroup="ViewEventUpdateGroup" ErrorMessage="Field is required." />

										</div>
										<div class="form-group">
											<b>Event Date Created:</b>
											<asp:TextBox ID="TextBoxDateCreated" runat="server" CssClass="tbInput" ReadOnly="true" Enabled="false" />

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
	

	<script src='<%= ResolveClientUrl("~/js/jquery/validate/jquery.validate.js") %>'></script>

	<script src='<%= ResolveClientUrl("~/js/jquery/validate/additional-methods.js") %>'></script>
	<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment-with-locales.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment-with-locales.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.7.0/moment.min.js"></script>
	<script>	
		$('#myform').validate({});
		(function ($) {
			"use strict";
			$(document).ready(function () {
				//init dataTables
				$('#gvs').dataTable({
					dom: 'Bfrtip',
					aoColumnDefs: [{ bSortable: false, aTargets: [-1] }],
					buttons: [{
						extend: 'print',
						exportOptions: { columns: [0, 1, 2, 3, 4] }
					}],
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
				var dateString = dateSchedule;
				var currentDate = moment(dateString, "DD/MM/YYYY hh:mm:ss");
				var outdate = (currentDate.format("YYYY-MM-DDTHH:mm"));
				$(`#<%=TextBoxDateSchedule.ClientID%>`).val(outdate);
				$(`#<%=TextBoxDateCreated.ClientID%>`).val(dateCreated);
				$('#modUpdateEvent').modal('show');
			});
		};
	</script>
</asp:Content>
