<%@ Page Title="New Course" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="AddCourse.aspx.vb" Inherits="TeacherStudent.AddCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
	<style>
		@font-face {
			font-family: 'Glyphicons Halflings';
			src: url('../fonts/glyphicons-halflings-regular.eot');
			src: url('../fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'), url('../fonts/glyphicons-halflings-regular.woff2') format('woff2'), url('../fonts/glyphicons-halflings-regular.woff') format('woff'), url('../fonts/glyphicons-halflings-regular.ttf') format('truetype'), url('../fonts/glyphicons-halflings-regular.svg#glyphicons_halflingsregular') format('svg');
		}

		.glyphicon {
			position: relative;
			top: 1px;
			display: inline-block;
			font-family: 'Glyphicons Halflings';
			font-style: normal;
			font-weight: normal;
			line-height: 1;
			-webkit-font-smoothing: antialiased;
			-moz-osx-font-smoothing: grayscale;
		}




		.glyphicon-plus:before {
			content: "\002b";
		}


		.myLable {
			font-weight: bold;
		}

		.mycheckbox input[type="checkbox"] {
			margin-right: 8px;
		}
	</style>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div class="form" style="width: 80%; margin: auto;">
		<div class="row form-group">
			<h1>Add New course</h1>
			<asp:HiddenField ID="HiddenFieldDate" Value='<%# DateTime.Now.Date.ToLocalTime %>' runat="server" />
		</div>
		<div class="row form-group">
			<label for="inputEmail3" class="col-sm-3 col-form-label myLable">Course Name : </label>
			<div class="col-sm-9">
				<asp:TextBox ID="TextBoxCourseName" CssClass="form-control" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxCourseName" CssClass="text-danger" ValidationGroup="AddCourseGroup" ErrorMessage="The course name field is required." />
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-3">
				<label class="myLable">Course Category : </label>
			</div>
			<div class="col-sm-9">
				<asp:CheckBoxList ID="CheckBoxListCourseCategory" CssClass="mycheckbox" runat="server">
				</asp:CheckBoxList>
			</div>
		</div>


		<div class="row form-group">
			<label class="col-sm-3 myLable">Schedule Date : </label>
			<div class="col-sm-9">
				<asp:TextBox runat="server" ID="TextBoxScheduleDate" CssClass="form-control" TextMode="DateTime"></asp:TextBox>




			</div>
		</div>
		<div class="row form-group">
			<label class="col-sm-3 col-form-label myLable">Course Description : </label>
			<div class="col-sm-9">
				<asp:TextBox ID="TextBoxCourseDescription" CssClass="form-control" runat="server" Style="height: 100px"></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxCourseDescription" CssClass="text-danger" ValidationGroup="AddCourseGroup" ErrorMessage="The Description field is required." />
			</div>
		</div>
		<div class="row form-group">
			<label class="col-sm-3 col-form-label myLable">Aims And Objectives : </label>
			<div class="col-sm-9">
				<asp:TextBox ID="TextBoxAimsAndObjectives" CssClass="form-control" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxAimsAndObjectives" CssClass="text-danger" ValidationGroup="AddCourseGroup" ErrorMessage="The Aims And Objectives field is required." />
			</div>
		</div>
		<div class="row form-group">
			<label class="col-sm-3 col-form-label myLable">Upload Materials : </label>
			<div class="col-sm-4">
				<asp:FileUpload ID="FileUploadDoc" runat="server" />
			</div>
			<div class="col-sm-4">
				<asp:DropDownList ID="DropDownListMaterialName" CssClass="form-control" runat="server"></asp:DropDownList>
			</div>
			<div class="col-sm-1">
				<asp:LinkButton ID="btnAddMaterials" OnClick="btnAddMaterials_Click" CssClass="btn btn-primary" runat="server" Text="Add" ToolTip="Add Material"><span class="glyphicon glyphicon-plus"></span></asp:LinkButton>&nbsp;&nbsp;
			</div>
		</div>

		<div class="row form-group">
			<div class="col-sm-3"></div>
			<div class="col-sm-4">
				<asp:FileUpload runat="server" />
			</div>
			<div class="col-sm-4" id="">
				<asp:DropDownList CssClass="form-control" runat="server"></asp:DropDownList>
			</div>
			<div class="col-sm-1">
			</div>
		</div>


		<div class="row form-group">
			<asp:LinkButton ID="LinkButtonAdd" CssClass="btn btn-success col-sm-4" OnClick="LinkButtonAdd_Click" runat="server" OnClientClick="return confirm('Note that existing files with same names will be overwritten');" ValidationGroup="AddCourseGroup">Add course</asp:LinkButton>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">

	<script>

</script>
</asp:Content>
