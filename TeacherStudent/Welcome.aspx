<%@ Page Title="Welcome" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="Welcome.aspx.vb" Inherits="TeacherStudent.Welcome1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Label ID="LabelWelcome" runat="server" Text="Welcome mr/mrs x you are logged in as x"></asp:Label>
	<div class="studentWelcome" style="background-color: darkgrey">
		<br>
		<a href="~/StudentUpdatesProfile" id="HyperLinkStudentUpdatesProfile" runat="server">Student updates profile</a>
		<br>
		<a href="~/StudentViewsListOfCourses" id="HyperLinkStudentViewsListOfCourses" runat="server">Student views list of courses</a>
		<br>
		<a href="~/StudentAdvanceSearch" id="HyperLinkStudentAdvanceSearch" runat="server">Student: Advance Search for a course by category / starting character & Student subscribes for a course (send email to tutor)</a>
		<br>
		<a href="~/StudentViewsEvents" id="HyperLinkStudentViewsEvents" runat="server">Student views events</a>
		<br>
		<a href="~/StudentDownloadsCoursMeaterials" id="HyperLinkStudentDownloadsCoursMeaterials" runat="server">Student views/downloads course materials</a>
		<br />
	</div>
	<br />
	<br />

	<div class="tutorWelcome" style="background-color: aquamarine">
		<br />
		<a href="~/TutorCRUDCourse" id="HyperLinkTutorCRUDCourse" runat="server">Tutor CRUD course</a>
		<br>
		<a href="~/TutorPostsMaterials" id="HyperLinkTutorPostsMaterials" runat="server">Tutor Posts Materials</a>
		<br>
		<a href="~/TutorViewsListOfStudents" id="HyperLinkTutorViewsListOfStudents" runat="server">Tutor views list of students & Tutor accepts/rejects subscription request</a>
		<br>
		<a href="~/TutorPostsEvent" id="HyperLinkTutorPostsEvent" runat="server">Tutor posts event</a>
		<br />
	</div>
	<br />
	<br />

	<div class="adminWelcome" style="background-color: darkturquoise">
		<br>
		<a href="~/Admin/AdminViewsListOfTutorsStudents" id="HyperLinkAdminViewsListOfTutorsStudents" runat="server">Admin views list of tutors / students</a>
		<br>
		<a href="~/Admin/AdminFreezesUserAccount" id="HyperLinkAdminFreezesUserAccount" runat="server">Admin freezes user account</a>
		<br>
		<a href="~/Admin/AdminCRUDCourse" id="HyperLinkAdminCRUDCourse" runat="server">Admin CRUD course</a>
		<br>
		<a href="~/Admin/AdminCRUDCourseCategory" id="HyperLinkAdminCRUDCourseCategory" runat="server">Admin CRUD course category</a>
		<br>
		<a href="~/Admin/AdminViewingNumberOfStudentsCourses" id="HyperLinkAdminViewingNumberOfStudentsCourses" runat="server">Admin stats: Viewing number of students / courses</a>
		<br />
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
