<%@ Page Title="Dashboard" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="StudentHome.aspx.vb" Inherits="TeacherStudent.StudentHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="text-center" style="margin: auto;">
		<br />
		<br />
		<h2>
			<asp:Label ID="LabelWelcome" runat="server" Text="Welcome xxx you are logged in as Student"></asp:Label>
		</h2>
		<br />
		<br />
	</div>

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
								<i class="icon-contract"></i>
								<h3><span class="counter">
									<asp:Label ID="LabelMyTotalCourses" runat="server" Text="0"></asp:Label></span></h3>
								<p>Sent Subscription</p>
							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-20 col-sm-10 col-md-5" style="margin: auto;">
							<div class="academy-buttons-area text-center">
								<a runat="server" href="~/Student/StudentViewsListOfCourses" class="btn academy-btn btn-4 m-2" style="width: 100%;">View More Info</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<hr />



	<div class="myevent">
		<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/tea2.jpg);">
			<div class="bradcumbContent">
				<h2>Event</h2>
			</div>
		</div>
		<div class="section-padding-100-0">
			<div class="col-12">
				<div class="academy-cool-facts-area mb-50">
					<div class="row">
						<!-- Single Cool Fact-->
						<div class="col-16 col-sm-8 col-md-4">
						</div>
						<div class="col-16 col-sm-8 col-md-4">
							<div class="single-cool-fact text-center">
								<i class="icon-email" style="color: green;"></i>
								<h3><span class="counter">
									<asp:Label ID="LabelEvents" runat="server" Text="0"></asp:Label></span></h3>
								<p>Total Events</p>
							</div>
						</div>
						<div class="col-16 col-sm-8 col-md-4">
						</div>
					</div>
					<div class="row">
						<div class="col-20 col-sm-10 col-md-5" style="margin: auto;">
							<div class="academy-buttons-area text-center">
								<a runat="server" href="~/Student/StudentViewsEvents" class="btn academy-btn btn-4 m-2" style="width: 100%;">View More Info</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
	<hr />




	<hr />


	<br />
	<br />
	<br />
	<br />
	<br />
	<hr />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
