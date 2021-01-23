<%@ Page Title="All Jobs" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="HKViewsListOfJobs.aspx.vb" Inherits="JP.HKViewsListOfJobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
	<div class="breadcumb-area bg-img">
		<div class="bradcumbContent">
			<h2 style="text-align:center">View Jobs</h2>
		</div>
	</div>
	<div class="section-padding-100-0">
		<div class="tbldiv">
			<asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">
				<Columns>
					<asp:BoundField DataField="UserName" HeaderText="HouseOwner" />
					<asp:BoundField DataField="Title" HeaderText="Job" />
					<asp:BoundField DataField="DeadlineDate" HeaderText="Deadline Date"  dataformatstring="{0:ddd dd, MMMM, yyyy}" htmlencode="false" />
					<asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:linkButton ID="btnnSubscribe" CssClass="btn btn-primary" OnClick="btnSubscribe_Click" OnClientClick="return mystats();"  CommandArgument='<%#Eval("jobid") %>' name = '<%# String.Format("courseidis{0}", Eval("jobid")) %>'  runat="server"  Text="Subscribe"></asp:linkButton>&nbsp;&nbsp;
						<asp:LinkButton ID="btnDescription" CssClass="btn btn-secondary" OnClick="btnDescription_Click" CommandArgument='<%#Eval("jobid") %>' runat="server" Text="Description"></asp:LinkButton>

						</ItemTemplate>
					</asp:TemplateField>

				</Columns>
			</asp:GridView>
		</div>
		<asp:HiddenField ID="HiddenFieldStudentId" runat="server" />

	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
	<script>	
		$(document).ready(function () {
			mystats();
		});
		//
		function mystats() {
			var HKId = document.getElementById("<%=HiddenFieldStudentId.Clientid%>").value;
			//var courseid = $(this).value;
			//alert(studentId);
			$("[name*=courseidis]").each(function () {
				var fullElementName = $(this).attr("name");
				var JobId = fullElementName.replace('courseidis', '');

				_href = $("[name=" + fullElementName + "]").attr('href');
				$("[name=" + fullElementName + "]").attr("disabled", false);
				$.ajax({
          url: 'WebServiceStatus.asmx/getHKStatsPerJob',
					method: 'post',
					data: { HKId: HKId, JobId: JobId },
					dataType: 'json',
					success: function (data) {
						var isPending = Boolean(data.Pending1);
						var isSubscribe = Boolean(data.Applied1);
						var isAccepted = Boolean(data.Accept1);

						if (isAccepted === true) {
							if (isPending === true) {
								if (isSubscribe === true) {
									$("[name=" + fullElementName + "]").removeClass("btn btn-primary").addClass("btn btn-warning");
									$("[name=" + fullElementName + "]").text("Pending");
									$("[name=" + fullElementName + "]").attr("disabled", true);
									$("[name=" + fullElementName + "]").removeAttr('href');
								}
								else if (isSubscribe === false) {
									$("[name=" + fullElementName + "]").removeClass("btn btn-primary").addClass("btn btn-primary");
									$("[name=" + fullElementName + "]").text("Applied");
								}
							}
							else if (isPending === false) {
								if (isSubscribe === true) {

									$("[name=" + fullElementName + "]").removeClass("btn btn-primary").addClass("btn btn-success");
									$("[name=" + fullElementName + "]").text("Accepted");
									$("[name=" + fullElementName + "]").attr("disabled", true);
									$("[name=" + fullElementName + "]").removeAttr('href');
								}
								else if (isSubscribe === false) {
									$("[name=" + fullElementName + "]").removeClass("btn btn-primary").addClass("btn btn-primary");
									$("[name=" + fullElementName + "]").text("Applied");
									$("[name=" + fullElementName + "]").attr("disabled", false);
								}
							}
						}



						else if (isAccepted === false) {
							if (isPending === true) {
								if (isSubscribe === true) {
									$("[name=" + fullElementName + "]").removeClass("btn btn-primary").addClass("btn btn-warning");
									$("[name=" + fullElementName + "]").text("Pending");
									$("[name=" + fullElementName + "]").attr("disabled", true);
									$("[name=" + fullElementName + "]").removeAttr('href');
								}
								else if (isSubscribe === false) {
									$("[name=" + fullElementName + "]").removeClass("btn btn-primary").addClass("btn btn-primary");
									$("[name=" + fullElementName + "]").text("Applied");
									$("[name=" + fullElementName + "]").attr("disabled", false);
								}
							}
							else if (isPending === false) {
								if (isSubscribe === true) {
									$("[name=" + fullElementName + "]").removeClass("btn btn-primary").addClass("btn btn-danger");
									$("[name=" + fullElementName + "]").text("Rejected");
									$("[name=" + fullElementName + "]").attr("disabled", true);
									$("[name=" + fullElementName + "]").removeAttr('href');
								}
								else if (isSubscribe === false) {
									$("[name=" + fullElementName + "]").removeClass("btn btn-primary").addClass("btn btn-primary");
									$("[name=" + fullElementName + "]").text("Applied");
									$("[name=" + fullElementName + "]").attr("disabled", false);
								}
							}
						}
					}
				});
			});
		}

		
	</script>
</asp:Content>
