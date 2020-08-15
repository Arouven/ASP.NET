<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="TutorViewsListOfStudents.aspx.vb" Inherits="TeacherStudent.TutorViewsListOfStudents" %>

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
	<div class="myCourses">
		<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/bg-1.jpg);">
			<div class="bradcumbContent">
				<h2>All Courses</h2>
			</div>
		</div>
		<div class="section-padding-100-0">
			<div class="col-12">
				<div class="academy-cool-facts-area mb-50">
					<div class="row">
						<!-- Single Cool Fact-->

						<div class="col-16 col-sm-8 col-md-4">
							<div class="single-cool-fact text-center">
								<i class="icon-id-card"></i>
								<h3><span class="counter">
									<asp:Label ID="LabelTotalStudent" runat="server" Text="0"></asp:Label></span></h3>
								<p>Total Student</p>
							</div>
						</div>
						<div class="col-16 col-sm-8 col-md-4">
							<div class="single-cool-fact text-center">
								<i class="icon-id-card" style="color: cornflowerblue;"></i>
								<h3><span class="counter">
									<asp:Label ID="LabelTotalStudentPending" runat="server" Text="0"></asp:Label></span></h3>
								<p>Student Pending</p>
							</div>
						</div>
						<div class="col-16 col-sm-8 col-md-4">
							<div class="single-cool-fact text-center">
								<i class="icon-id-card" style="color: Red;"></i>
								<h3><span class="counter">
									<asp:Label ID="LabelTotalStudentRejected" runat="server" Text="0"></asp:Label></span></h3>
								<p>Student Rejected</p>
							</div>
						</div>
					</div>


				</div>
				<br />
				<br />
				<br />
				<hr />




			</div>
		</div>
		<div class="form-group">
			<div class="tbldiv">
				<asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">

					<Columns>
						<asp:BoundField DataField="CourseName" HeaderText="Course Name" />
						<asp:BoundField DataField="DateSchedule" HeaderText="Date Schedule" />
						<asp:TemplateField HeaderText="Views" ItemStyle-HorizontalAlign="Center">
							<ItemTemplate>
								<a href="#" runat="server">
									<button class="btn btn-success" onclick='<%# String.Format("return OpenStats({0});return false;", Eval("CourseID")) %>'>Statistics</button></a>
								&nbsp;&nbsp;
											<asp:LinkButton ID="btnStud" CommandArgument='<%#Eval("CourseID") %>' OnClick="btnStud_Click" CssClass="btn btn-primary" runat="server" Text="Students" ToolTip="Students List"></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
					</Columns>
				</asp:GridView>
			</div>
		</div>



		<div class="section-padding-100-0">
			<div class="col-12">
				<div class="col-12">
					<div class="academy-cool-facts-area mb-50">
						<div class="row">
							<!-- Single Cool Fact-->

							<div class="col-16 col-sm-8 col-md-4">
								<div class="single-cool-fact text-center">
									<i class="icon-id-card"></i>
									<h3><span class="counter" id="totalStudent"></span></h3>
									<p>Total Student</p>
								</div>
							</div>
							<div class="col-16 col-sm-8 col-md-4">
								<div class="single-cool-fact text-center">
									<i class="icon-id-card" style="color: cornflowerblue;"></i>
									<h3><span class="counter" id="totalPendingStudent"></span></h3>
									<p>Student Pending</p>
								</div>
							</div>
							<div class="col-16 col-sm-8 col-md-4">
								<div class="single-cool-fact text-center">
									<i class="icon-id-card" style="color: Red;"></i>
									<h3><span class="counter" id="totalRejectedStudent"></span></h3>
									<p>Student Rejected</p>
								</div>
							</div>
						</div>


					</div>
					<br />
					<br />
					<br />
					<hr />


				</div>

			</div>
		</div></div>
		<hr />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">

	<script>	

		(function ($) {
			"use strict";
			$(document).ready(function () {
				//init dataTables
				$('#gvs').dataTable({
					aoColumnDefs: [{ bSortable: false, aTargets: [-1] }],
					pageLength: 5
				});
			});
		}(jQuery));

		function OpenStats(CourseId) {

			var courseId = parseInt(CourseId);
			$.ajax({
				url: 'WebServiceGetStudStats.asmx/getStudentStats',
				method: 'post',
				data: { courseId: courseId },
				dataType: 'json',
				success: function (data) {
					var spanTotalStudentInCourse = $('#totalStudent');
					var spanTotalStudentInCoursePending = $('#totalPendingStudent');
					var spanTotalStudentInCourseRejected = $('#totalRejectedStudent');
					spanTotalStudentInCourse.text(data.TotalStudentInCourse1);
					spanTotalStudentInCoursePending.text(data.TotalStudentInCoursePending1);
					spanTotalStudentInCourseRejected.text(data.TotalStudentInCourseRejected1);
				},
				error: function (err) {
					alert(err);
				}
			});

		};



	</script>
</asp:Content>
