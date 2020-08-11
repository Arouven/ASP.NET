<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="UpdateCourse.aspx.vb" Inherits="TeacherStudent.UpdateCourse" %>
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

		label.error, span.error {
			color: red;
		}
	</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/gallery1.jpg);">
		<div class="bradcumbContent">
			<h2>Update course</h2>
		</div>
	</div>
	<asp:HiddenField ID="HiddenFieldCourseId" runat="server" />
	<asp:HiddenField ID="HiddenFieldTutorId" runat="server" />
	<div class="section-padding-100-0">
		<div id="addcourse" class="form" style="width: 80%; margin: auto;">
			<div class="row form-group">
				<label for="inputEmail3" class="col-sm-3 col-form-label myLable">Course Name : </label>
				<div class="col-sm-9">
					<asp:TextBox ID="TextBoxCourseName" CssClass="form-control" runat="server" minlength="4" required></asp:TextBox>
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
					<span id="errorToShow" style="position: absolute;">
						<asp:Label ID="Label1" runat="server" CssClass="error"></asp:Label></span>
					<br />
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-3 myLable">Schedule Date : </label>
				<div class="col-sm-9">
					<asp:TextBox runat="server" ID="TextBoxScheduleDate" TextMode="DateTimeLocal" CssClass="form-control" required></asp:TextBox>
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxScheduleDate" CssClass="text-danger" ValidationGroup="AddCourseGroup" ErrorMessage="Pick a date." />
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-3 col-form-label myLable">Course Description : </label>
				<div class="col-sm-9">
					<asp:TextBox ID="TextBoxCourseDescription" CssClass="form-control" runat="server" Style="height: 100px" minlengty="5"  required></asp:TextBox>
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxCourseDescription" CssClass="text-danger" ValidationGroup="AddCourseGroup" ErrorMessage="The Description field is required." />
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-3 col-form-label myLable">Aims And Objectives : </label>
				<div class="col-sm-9">
					<asp:TextBox ID="TextBoxAimsAndObjectives" CssClass="form-control" runat="server" required></asp:TextBox>
					<asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxAimsAndObjectives" CssClass="text-danger" ValidationGroup="AddCourseGroup" ErrorMessage="The Aims And Objectives field is required." />
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-3 col-form-label myLable">Upload Materials : </label>

				<div class="col-sm-4">
					<input id="file0" name="file0" type="file" runat="server" required class="form-control-file" />
				</div>
				<div class="col-sm-4">
					<select runat="server" id="ddl0" name="ddl0" class="form-control required"></select>
				</div>
				<asp:HiddenField ID="SendA" runat="server" Value="0" />
				<div class="col-sm-1">
					<button id="Button00" class="btn btn-primary" type="button" value="Add" onclick="AddFileUpload()" data-toggle="tooltip"><span class="glyphicon glyphicon-plus"></span></button>
				</div>
			</div>
			<div class="row formgroup">
				<div class="tbldiv">
						<asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">

							<Columns>
								<asp:BoundField DataField="MaterialName" HeaderText="Material Name" />
								<asp:BoundField DataField="MaterialTypeName" HeaderText="Type" />
								<asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<asp:LinkButton ID="btnDelete" OnClick="btnDelete_Click" CommandArgument='<%#Eval("MaterialID") %>' CssClass="btn btn-danger" runat="server" Text="Delete" ToolTip="Delete Material"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>&nbsp;&nbsp;

										<asp:LinkButton ID="btnView" CssClass="btn btn-info" runat="server" target="_blank" href='<%#String.Format("OpenDocuments.aspx?filepath={0}", Eval("MaterialPathUrl")) %>' Text="View" ToolTip="View Material"><span class="glyphicon glyphicon-eye-open"></span></asp:LinkButton>&nbsp;&nbsp;
																																
											<asp:LinkButton ID="btnDownload" OnClick="btnDownload_Click" CommandArgument='<%#Eval("MaterialPathUrl") %>' CssClass="btn btn-success" runat="server" Text="Download" ToolTip="Download Material"><span class="glyphicon glyphicon-download"></span></asp:LinkButton>


									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>
					</div>
			</div>




			<div id="duplicateHere">
				<!--FileUpload Controls will be added here -->
			</div>
			<div class="row form-group">

				<asp:Button CssClass="btn btn-success col-sm-4" OnClick="LinkButtonAdd_Click" ID="btnSubmit" Text="Add course" runat="server" ValidationGroup="AddCourseGroup" />
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">

	<script src='<%= ResolveClientUrl("~/js/jquery/validate/jquery.validate.js") %>'></script>

	<script src='<%= ResolveClientUrl("~/js/jquery/validate/additional-methods.js") %>'></script>

	<script>

		//if ($('#videoUploadFile').get(0).files.length === 0) {
		//	console.log("No files selected.");
		//}
		//$.validator.addMethod("valueNotEquals", function (value, element, arg) {
		//	return arg !== value;
		//}, "Value must not equal arg.");




		//$("input[type=checkbox]").attr("name", "checkedornot");
		var validator = $('#myform').validate({
			//rules: {
			//	checkedornot: {required:true }
			//},
			//messages: {
			//	//checkedornot: { minlength: "Please select at least one." }
			//},
			//errorPlacement: function (error, element) {
			//	if (element.attr("name") == "checkedornot") {
			//		error.appendTo("#errorToShow");
			//	} else {
			//		error.insertAfter(element);
			//	}
			//}

		});
		$.validator.addMethod('filesize', function (value, element, param) {
			return this.optional(element) || (element.files[0].size <= param * 1000000)
		}, 'File size must be less than {0} MB');
		$('[name*="file"]').each(function () {
			$(this).rules('add', {
				required: true,
				filesize: 3

			});
		});
		$('[name*="ddl"]').each(function () {
			$(this).rules('add', {
				required: true,
				messages: {
					required: "Please Select a Type"
				}
			});
		});





	</script>
	<script type="text/javascript">
		function verify() {
			var x = confirm('Note that existing files with same names will be overwritten');
		}

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
				'" class="form-control required" >' + options + '</select>' +
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
