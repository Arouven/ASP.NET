﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="StudentViewsListOfCourses.aspx.vb" Inherits="TeacherStudent.StudentViewsListOfCourses" %>

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

		.glyphicon-envelope:before {
			content: "\2709";
		}

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

	<h1>View all Courses</h1>
	<div class="tbldiv">
		<asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">
			<Columns>
				<%--<asp:BoundField DataField="UserName" HeaderText="Tutor" />--%>
				<asp:BoundField DataField="CourseName" HeaderText="Course" />
				<asp:BoundField DataField="DateSchedule" HeaderText="Date Schedule" />
				<asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
					<ItemTemplate>
						<asp:LinkButton href="../LoginRequired.aspx" OnClientClick="return Confirm('Subscribe To This Course?');" ID="btnSubscribe" CssClass="btn btn-success" runat="server" Text="Subscribe" ToolTip="Subscribe To Course"><span class="glyphicon glyphicon-envelope"></span></asp:LinkButton>&nbsp;&nbsp;

						<%--<asp:LinkButton ID="btnDelete" CssClass="btn btn-danger" runat="server" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete?');" CommandArgument='<%# Eval("CategoryId") %>' Text="Delete" ToolTip="Delete Category"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
						&nbsp;&nbsp;
						<asp:LinkButton CssClass="btn btn-warning" rel="modal:open" data-toggle="modal" OnClientClick='<%# String.Format("return OpenModal({0}, ""{1}"");", Eval("CategoryId"), Eval("CategoryName")) %>' href="#modUpdateCategory" runat="server" Text="Update" ToolTip="Update Category"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>--%>
					</ItemTemplate>
				</asp:TemplateField>

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
