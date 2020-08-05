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

		.glyphicon-calendar:before {
			content: "\e109";
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
			<label class="col-sm-3 col-form-label myLable">Material Name : </label>
			<div class="col-sm-9">
				<asp:DropDownList ID="DropDownListMaterialName" CssClass="form-control" runat="server"></asp:DropDownList>
			</div>
		</div>
		<div class="row form-group">
			<label class="col-sm-3 col-form-label myLable">Upload Materials : </label>
			<div class="col-sm-9">
				<asp:FileUpload ID="FileUploadDoc" runat="server" AllowMultiple="true" />
			</div>
		</div>


		<div class="row form-group d-flex justify-content-around">
			<asp:LinkButton ID="LinkButtonAdd" CssClass="btn btn-success btnsize" OnClick="LinkButtonAdd_Click" runat="server" OnClientClick="validate()" ValidationGroup="ValidationGroupUser">Add</asp:LinkButton>
		</div>
		<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
	<script type="text/javascript">  
		function validate() {
			var array = ['pdf', 'doc', 'docx', 'txt', 'xlsx', 'ppt', 'zip'];
			var xyz = $(`#<%=FileUploadDoc.ClientID%>`);

			var Extension = xyz.value.substring(xyz.value.lastIndexOf('.') + 1).toLowerCase();
			if (array.indexOf(Extension) <= -1) {
				alert("Please Upload only pdf,doc,zip,txt.xlsx and ppt extension flle");
				return false;
			}
			else {
				var ask = confirm('Your Existing files will be overwritten if any');
				if (ask) {
					return true;
				}
				else { return false;}
			}
		}
	</script>
	<script>

	</script>
</asp:Content>
