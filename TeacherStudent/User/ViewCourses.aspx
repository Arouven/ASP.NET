<%@ Page Title="Courses List" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="ViewCourses.aspx.vb" Inherits="TeacherStudent.ViewCourses" %>

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
	<div class="breadcumb-area bg-img" style="background-image: url(../img/bg-img/breadcumb.jpg);">
		<div class="bradcumbContent">
			<h2>List of Courses Available</h2>
		</div>
	</div>
	<div class="section-padding-100-0">
	<div class="container">
		<div class="row form-group" runat="server">
			<div class="col-sm-6 " style="float: left">
				<h2>List of Movies</h2>
			</div>
			<div class="col-sm-3" style="float: right;">
				<div class="input-group">
					<%--Trigger the TextChanged event--%>
					<asp:DropDownList ID="ddlCategory" OnTextChanged="ddlCategory_TextChanged" runat="server" CssClass="form-control" AutoPostBack="true">
					</asp:DropDownList>&nbsp;
				</div>
			</div>
			<div class="col-sm-3" style="float: right;">
				<div class="input-group">
					<%--generate text changed event--%>
					<asp:TextBox ID="TextBox1" OnTextChanged="TextBox1_TextChanged" runat="server" AutoPostBack="true" CssClass="form-control" Placeholder="Search..." />
					<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
				</div>
			</div>
		</div>
		<%-- START AJAX CONTROL --%>
		<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
			<ContentTemplate>
				<asp:ListView ID="lvMovies" runat="server" ItemPlaceholderID="itemPlaceholder" DataKeyNames="courseid" ClientIDMode="Static">
					<ItemTemplate>
						<div class="card h-100" style="width: 195px; float: left; margin: 8px;">
							<image runat="server" ID="Image1" class="card-img-top" alt="Card image" Width="193px" Height="195px"><i class="icon-contract"></i></image>
							<div class="card-body">
								<h6 class="card-title"><%# Eval("coursename")%></h6>
								<p class="card-text">

								</p>
								<p class="card-text">
									<span><strong>Aims and objectives:<br />
									</strong></span><%# Eval("aimsandobjectives")%>
								</p>
								<%--Eval movie_id as the commandargument--%>
								<asp:LinkButton ID="LinkButton1" runat="server" Text="Request access" CommandArgument='<%#Eval("courseid") %>' CommandName="btnAccess" CssClass="btn btn-primary" />
							</div>
						</div>
					</ItemTemplate>
					<LayoutTemplate>
						<div id="itemPlaceholder" class="categoryContainer" runat="server">
						</div>
						<hr style="clear: both" />
						<div class="text-right">
							<asp:DataPager ID="DataPager1" runat="server" PageSize="5">
								<Fields>
									<asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="false" ShowFirstPageButton="true" />
									<asp:NumericPagerField />
									<asp:NextPreviousPagerField ButtonType="Link" ShowPreviousPageButton="false" ShowLastPageButton="true" />
								</Fields>
							</asp:DataPager>
						</div>
					</LayoutTemplate>
				</asp:ListView>
			</ContentTemplate>
			<Triggers>
				<asp:AsyncPostBackTrigger ControlID="TextBox1" EventName="TextChanged" />
				<asp:AsyncPostBackTrigger ControlID="ddlcategory" EventName="SelectedIndexChanged" />
			</Triggers>
		</asp:UpdatePanel>
		<asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
	</div>
		
		
	<%--	<div class="tbldiv">
		<asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">
			<Columns>
				<asp:BoundField DataField="CourseName" HeaderText="Course Name" />
				<asp:BoundField DataField="DateSchedule" HeaderText="Date Schedule" />
				<asp:BoundField DataField="AimsAndObjectives" HeaderText="Aims" />
				<asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
					<ItemTemplate>

						<asp:LinkButton onclick="btnSubscribe_Click" OnClientClick="return Confirm('Subscribe To This Course?');" ID="btnSubscribe" CssClass="btn btn-success" runat="server" Text="Subscribe" ToolTip="Subscribe To Course"><span class="glyphicon glyphicon-envelope"></span></asp:LinkButton>&nbsp;&nbsp;

					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
		<br />
	</div>--%>

</div>






</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
	<script>	
		//(function ($) {
		//	"use strict";
		//	$(document).ready(function () {
		//		//init dataTables
		//		$('#gvs').dataTable({
		//			lengthChange: true,
		//			aoColumnDefs: [{ bSortable: false, aTargets: [-1] }],
		//			info: true,
		//			pageLength: 20
		//		});
		//	});
		//}(jQuery));

	</script>
</asp:Content>
