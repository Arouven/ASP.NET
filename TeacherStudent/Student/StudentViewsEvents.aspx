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

	<h1>View all events</h1>
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
