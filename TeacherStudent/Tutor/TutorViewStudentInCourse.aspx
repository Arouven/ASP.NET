<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="TutorViewStudentInCourse.aspx.vb" Inherits="TeacherStudent.TutorViewStudentInCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="col-sm-12">
		<h1>Tutor</h1>
		<h3>
			<asp:Label ID="LabelTotalTutorUnfreeze" runat="server" Text="Label"></asp:Label>
		</h3>

		<asp:UpdatePanel ID="UpdatePanel1" runat="server">
			<ContentTemplate>

				<div class="course-top-wrap">
					<div class="container">
						<div class="row form-group">
							<div class="col-sm-4">
							</div>
							<div class="col-sm-4">
									<asp:DropDownList ID="ddlCategory" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" CausesValidation="false" CssClass="form-control" runat="server"></asp:DropDownList>
								
							</div>
							<div class="col-sm-3">
									<asp:TextBox ID="txtSearch" AutoPostBack="true" CssClass="form-control"  runat="server" CausesValidation="false" OnTextChanged="txtSearch_TextChanged" placeholder="Search Course"></asp:TextBox>								
							</div>
							<div class="col-sm-1">
									<label><i class="fa fa-search"></i></label>								
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<asp:Repeater ID="Repeater1" runat="server">
							<ItemTemplate>
								<div class="col-sm-2">
									<div class="course-block">
										<div class="course-img">
											<img src='../ProfilePictures/<%#  Eval("ProfilePictureUrl")%>' alt="" class="img-fluid">
										</div>

										<div class="course-content">

											<h4><a href="#"><%# Eval("UserName") %></a></h4>

											<p><%# Eval("UserName") %></p>

											<div class="course-footer d-lg-flex align-items-center justify-content-between">
												
												<asp:linkButton ID="ButtonOpenStudent" class="btn btn-success" runat="server" Text="StudentUsername" CommandArgument='<%# Eval("StudentId") %>' OnClick="ButtonOpenStudent_Click" />
												<div class="btn btn-success"><a class="btn btn-main-2 btn-small"><%# Eval("UserName") %></a></div>
											</div>
										</div>
									</div>
								</div>


							</ItemTemplate>
						</asp:Repeater>


						<%--		<asp:DataList ID="DataListTutorUnfreeze" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" GridLines="Both" RepeatLayout="Flow">
			<ItemTemplate>
				<div class="card bg-warning text-white h-60" style="width: 195px; float: left; margin: 8px;">
					<asp:Image runat="server" ImageUrl='<%# Eval("ProfilePictureUrl", "~/ProfilePictures/{0}")%>' ID="Image1" CssClass="card-img-top mx-auto d-block rounded" AlternateText="Card image" Width="190px" Height="200px" />
					<div class="card-body">
						<p class="card-text text-center">
							<asp:HyperLink CssClass="btn btn-primary" runat="server" NavigateUrl='<%#Eval("StudentId", "~/Admin/UserDetails.aspx?user=Tutor&id={0}")%>'><%# Eval("UserName")%></asp:HyperLink>
						</p>
					</div>
				</div>
			</ItemTemplate>
		</asp:DataList>--%>
					</div>
				</div>
			</ContentTemplate>
		</asp:UpdatePanel>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
