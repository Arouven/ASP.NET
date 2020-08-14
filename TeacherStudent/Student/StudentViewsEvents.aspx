<%@ Page Title="View Events" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="StudentViewsEvents.aspx.vb" Inherits="TeacherStudent.StudentViewsEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
	<style>
		.tbldiv {
			margin: auto;
			width: 90%;
		}

		th {
			background: #4CAF50;
			color: White;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/gallery1.jpg);">
		<div class="bradcumbContent">
			<h2>View Events</h2>
		</div>
	</div>
	<asp:HiddenField ID="HiddenFieldCourseId" runat="server" />
	<asp:HiddenField ID="HiddenFieldTutorId" runat="server" />
	<div class="section-padding-100-0">
		<div class="form" style="width: 80%; margin: auto;">
			<div class="tbldiv">
				<asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">
					<Columns>
						<asp:BoundField DataField="UserName" HeaderText="Tutor" />
						<asp:BoundField DataField="EventName" HeaderText="Event Name" />
						<asp:BoundField DataField="EventDetail" HeaderText="Event Details" />
						<asp:BoundField DataField="Location" HeaderText="Location" />
						<asp:BoundField DataField="DateSchedule" HeaderText="Date Schedule" />
						<asp:BoundField DataField="DateCreated" HeaderText="Date Created" />

					</Columns>
				</asp:GridView>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
	<script>	
		(function ($) {
			"use strict";
			$(document).ready(function () {
				//init dataTables
				$('#gvs').dataTable({
					lengthChange: true,
					info: true,
					pageLength: 5
				});
			});
		}(jQuery));
	</script>
</asp:Content>
