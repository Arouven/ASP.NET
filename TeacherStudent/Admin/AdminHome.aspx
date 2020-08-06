<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="AdminHome.aspx.vb" Inherits="TeacherStudent.AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="mystudent">
		<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/bg-1.jpg);">
			<div class="bradcumbContent">
				<h2>Student</h2>
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
								<i class="icon-id-card" style="color: green;"></i>
								<h3><span class="counter">
									<asp:Label ID="LabelUnfreezeStudent" runat="server" Text="0"></asp:Label></span></h3>
								<p>Student Available</p>
							</div>
						</div>
						<div class="col-16 col-sm-8 col-md-4">
							<div class="single-cool-fact text-center">
								<i class="icon-id-card" style="color: red;"></i>
								<h3><span class="counter">
									<asp:Label ID="LabelFreezeStudent" runat="server" Text="0"></asp:Label></span></h3>
								<p>Student Blocked</p>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-20 col-sm-10 col-md-5" style="margin: auto;">
							<div class="academy-buttons-area text-center">
								<a runat="server" href="~/Admin/ViewStudents" class="btn academy-btn btn-4 m-2" style="width: 100%;">View More Info</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<hr />

	<div class="mytutor">
		<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/tea2.jpg);">
			<div class="bradcumbContent">
				<h2>Tutor</h2>
			</div>
		</div>
		<div class="section-padding-100-0">
			<div class="col-12">
				<div class="academy-cool-facts-area mb-50">
					<div class="row">
						<!-- Single Cool Fact-->
						<div class="col-16 col-sm-8 col-md-4">
							<div class="single-cool-fact text-center">
								<i class="icon-assistance"></i>
								<h3><span class="counter">
									<asp:Label ID="LabelTotalTutor" runat="server" Text="0"></asp:Label></span></h3>
								<p>Total Tutor</p>
							</div>
						</div>
						<div class="col-16 col-sm-8 col-md-4">
							<div class="single-cool-fact text-center">
								<i class="icon-assistance" style="color: green;"></i>
								<h3><span class="counter">
									<asp:Label ID="LabelUnfreezeTutor" runat="server" Text="0"></asp:Label></span></h3>
								<p>Tutor Available</p>
							</div>
						</div>
						<div class="col-16 col-sm-8 col-md-4">
							<div class="single-cool-fact text-center">
								<i class="icon-assistance" style="color: red;"></i>
								<h3><span class="counter">
									<asp:Label ID="LabelFreezeTutor" runat="server" Text="0"></asp:Label></span></h3>
								<p>Tutor Blocked</p>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-20 col-sm-10 col-md-5" style="margin: auto;">
							<div class="academy-buttons-area text-center">
								<a runat="server" href="~/Admin/ViewTutors" class="btn academy-btn btn-4 m-2" style="width: 100%;">View More Info</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
	<hr />

	<div class="mycourse">
		<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/gallery1.jpg);">
			<div class="bradcumbContent">
				<h2>Course</h2>
			</div>
		</div>
		<div class="section-padding-100-0">
			<div class="col-12">
				<div class="academy-cool-facts-area mb-50">
					<div class="row">
						<!-- Single Cool Fact-->
						<div class="col-24 col-sm-12 col-md-6">
							<div class="single-cool-fact text-center">
								<i class="icon-contract"></i>
								<h3><span class="counter">
									<asp:Label ID="LabelTotalCourse" runat="server" Text="0"></asp:Label></span></h3>
								<p>Total Courses</p>
							</div>
						</div>
						<div class="col-24 col-sm-12 col-md-6">
							<div class="single-cool-fact text-center">
								<i class="icon-email"></i>
								<h3><span class="counter">
									<asp:Label ID="LabelTotalCategory" runat="server" Text="0"></asp:Label></span></h3>
								<p>Total Categories</p>
							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-20 col-sm-10 col-md-5" style="margin: auto;">
							<div class="academy-buttons-area text-center">
								<a runat="server" href="~/Admin/AdminCRUDCourseCategory" class="btn academy-btn btn-4 m-2" style="width: 100%;">View More Info</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>




	</div>
	<hr />
	<div class="mymaterial">
		<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/pc-6.jpg);">
			<div class="bradcumbContent">
				<h2>Materials</h2>
			</div>
		</div>
		<div class="section-padding-100-0">
			<div class="col-12">
				<div class="academy-cool-facts-area mb-50">
					<div class="row">
						<!-- Single Cool Fact-->
						<div class="col-24 col-sm-12 col-md-6">
							<div class="single-cool-fact text-center">
								<i class="icon-link"></i>
								<h3><span class="counter">
									<asp:Label ID="LabelTotalMaterial" runat="server" Text="0"></asp:Label></span></h3>
								<p>Total Materials</p>
							</div>
						</div>
						<div class="col-24 col-sm-12 col-md-6">
							<br /><br />
							<div class="academy-buttons-area text-center">
								<a runat="server" href="~/Admin/AdminCRUDMaterialType" class="btn academy-btn btn-4 m-2" style="width: 100%;">View More Info</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<br />
	<br />
	<br />
	<br />
	<br />
	<hr />
	<div class="col-12">
		<div class="academy-cool-facts-area mb-50">
			<div class="row">

				<!-- Single Cool Fact-->
				<div class="col-16 col-sm-8 col-md-4">
					<div class="single-cool-fact text-center">
						<i class="icon-contract"></i>
						<h3><span class="counter">
							<asp:Label ID="LabelnoCourses" runat="server" Text="0"></asp:Label></span></h3>
						<p>Courses Available</p>
					</div>
				</div>

				<!-- Single Cool Fact-->
				<div class="col-16 col-sm-8 col-md-4">
					<div class="single-cool-fact text-center">
						<i class="icon-assistance"></i>
						<h3><span class="counter">
							<asp:Label ID="LabelNoTutors" runat="server" Text="0"></asp:Label></span></h3>
						<p>Amazing Teachers</p>
					</div>
				</div>

				<!-- Single Cool Fact-->
				<div class="col-16 col-sm-8 col-md-4">
					<div class="single-cool-fact text-center">
						<i class="icon-id-card"></i>
						<h3><span class="counter">
							<asp:Label ID="LabelNoStudents" runat="server" Text="0"></asp:Label></span></h3>
						<p>Total Students</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
