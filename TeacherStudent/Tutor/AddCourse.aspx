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

		.glyphicon-minus:before {
			content: "\2212";
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

	<script src="jquery.validate.js"></script>
	
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div id="addcourse" class="form" style="width: 80%; margin: auto;">
		<fieldset></fieldset>
		<div class="row form-group">
			<h1>Add New course</h1>
			<asp:HiddenField ID="HiddenFieldDate" Value='<%# DateTime.Now.Date.ToLocalTime %>' runat="server" />
		</div>
		<div class="row form-group">
			<label for="inputEmail3" class="col-sm-3 col-form-label myLable">Course Name : </label>
			<div class="col-sm-9">
				<p>
				<asp:TextBox ID="TextBoxCourseName" runat="server" minlength="3"   required></asp:TextBox>
					</p>
				<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxCourseName" CssClass="text-danger" ValidationGroup="AddCourseGroup" ErrorMessage="The course name field is required." />
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-3">
				<label class="myLable">Course Category : </label>
			</div>
			<div class="col-sm-6">
				<asp:CheckBoxList ID="CheckBoxListCourseCategory" CssClass="mycheckbox" runat="server" >
				</asp:CheckBoxList>
				<%--<asp:RequiredFieldValidator runat="server" ControlToValidate="CheckBoxListCourseCategory" CssClass="text-danger" ValidationGroup="AddCourseGroup" ErrorMessage="Select At least one." />--%>
			</div>
			<div id="isCheckedMsg" class="col-sm-3">
				<asp:CustomValidator runat="server" ID="cvmodulelist"  ClientValidationFunction="ValidateModuleList"  ValidationGroup="AddCourseGroup" ErrorMessage="Please Select At least one Module" ></asp:CustomValidator>
			</div>
		</div>


		<div class="row form-group">
			<label class="col-sm-3 myLable">Schedule Date : </label>
			<div class="col-sm-9">
				<asp:TextBox runat="server" ID="TextBoxScheduleDate" TextMode="DateTimeLocal" CssClass="form-control"></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxScheduleDate" CssClass="text-danger" ValidationGroup="AddCourseGroup" ErrorMessage="Pick a date." />
			</div>
		</div>
		<div class="row form-group">
			<label class="col-sm-3 col-form-label myLable">Course Description : </label>
			<div class="col-sm-9">
				<asp:TextBox ID="TextBoxCourseDescription" CssClass="form-control" runat="server"   Style="height: 100px"></asp:TextBox>
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
					<input id="file0" name="file0" type="file" runat="server" required />
				</div>
				<div class="col-sm-4">
					<select runat="server" id="ddl0" name="ddl0" class="form-control"></select>
				</div>

			<asp:HiddenField ID="SendA" runat="server" Value="0" />





			<div class="col-sm-1">
				<button id="Button00" class="btn btn-primary" type="button" value="Add" onclick="AddFileUpload()" data-toggle="tooltip"><span class="glyphicon glyphicon-plus"></span></button>
			</div>
		</div>
	





		<div id="duplicateHere">
			<!--FileUpload Controls will be added here -->
		</div>
		<asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>



		<div class="row form-group">
			<asp:LinkButton ID="LinkButtonAdd" CssClass="btn btn-success col-sm-4"  runat="server" OnClientClick="return verify();" ValidationGroup="AddCourseGroup">Add course</asp:LinkButton>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">


<script>
	 $(`#myform`).validate();
	//validator.element(`#<%=TextBoxCourseName.ClientID%>`);
		function verify() {
			var x = confirm('Note that existing files with same names will be overwritten');
			//if (x == true) {
			//	$('#addcourse').submit(function () {
			//		if ($('input:checkbox', this).is(':checked') &&
			//			$('input:radio', this).is(':checked')) {
			//			// everything's fine...
			//		} else {
			//			alert('Please select something!');
			//			return false;
			//		}
			//	});
			//}
		}
</script>
	<script type="text/javascript">
		var counter = 1;
		function AddFileUpload() {
			var options = document.getElementById(`<%=ddl0.ClientID%>`).innerHTML;

			var div = document.createElement('DIV');
			div.innerHTML = '<div class="row form-group">' +
				'<div class="col-sm-3"></div>' +
				'<div class="col-sm-4">' +
				'<input id="file' + counter + '" name = "file' + counter +
				'" type="file" required />' +
				'</div>' +
				'<div class="col-sm-4">' +
				'<select id="ddl' + counter + '" name = "ddl' + counter +
				'" class="form-control" >' + options + '</select>' +
				'</div>' +
				'<div class="col-sm-1">' +
				'<button id="Button' + counter + '" type="button" ' +
				'value="Remove" onclick = "RemoveFileUpload(this)" Class="btn btn-warning" title="Remove Materials"  ><span class="glyphicon glyphicon-minus"></span></button>' +
				'</div>' +
				'</div>';
			document.getElementById("duplicateHere").appendChild(div);
			document.getElementById("<%=SendA.ClientID%>").value = counter;
			document.getElementById("ddl" + counter).selectedIndex = "0";
			counter++;
		}

		function RemoveFileUpload(div) {
			document.getElementById("duplicateHere").removeChild(div.parentNode.parentNode.parentNode);
		}

	</script>
</asp:Content>
