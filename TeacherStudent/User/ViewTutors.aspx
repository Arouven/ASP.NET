<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="ViewTutors.aspx.vb" Inherits="TeacherStudent.ViewTutors1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



	<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
	<div class="container">
		<div class="row form-group" runat="server">
			<div class="col-sm-6 " style="float: left">
				<h2>List of Movies</h2>
			</div>
			<div class="col-sm-3" style="float: right;">
				<div class="input-group">
					<%--Trigger the TextChanged event--%>
					&nbsp;
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
				<div class="row">
					<asp:ListView ID="lvMovies" runat="server" ItemPlaceholderID="itemPlaceholder" DataKeyNames="UserName" ClientIDMode="Static">
						<ItemTemplate>
							<div class="single-teachers-area text-center mb-100 wow fadeInUp" data-wow-delay="400ms">
								<div class="card h-100" style="width: 195px; float: left; margin: 8px;">
									<div class="teachers-thumbnail">
										<asp:Image runat="server" ImageUrl='<%# Eval("ProfilePictureUrl", "~/ProfilePictures/{0}")%>' ID="Image1" class="card-img-top" alt="Card image" Style="display: block; margin-left: auto; margin-right: auto; width: 100%" />
									</div>
									<div class="card-body">
										<div class="teachers-info mt-30">

											<h5><%# Eval("UserName")%></h5>
											<span><%# Eval("CertificaionName")%></span>
										</div>

										<asp:LinkButton ID="LinkButton1" runat="server" Text="Request access" CommandArgument='<%#Eval("TutorId") %>' CommandName="btnAccess" CssClass="btn btn-primary" />
									</div>
								</div>
							</div>
						</ItemTemplate>
						<LayoutTemplate>
							<div id="itemPlaceholder" class="categoryContainer" runat="server">
							</div>
							<hr style="clear: both" />
							<div class="text-right">
								<asp:DataPager ID="DataPager1" runat="server" PageSize="20">
									<Fields>
										<asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="false" ShowFirstPageButton="true" />
										<asp:NumericPagerField />
										<asp:NextPreviousPagerField ButtonType="Link" ShowPreviousPageButton="false" ShowLastPageButton="true" />
									</Fields>
								</asp:DataPager>
							</div>
						</LayoutTemplate>
					</asp:ListView>
				</div>
			</ContentTemplate>
			<Triggers>
				<asp:AsyncPostBackTrigger ControlID="TextBox1" EventName="TextChanged" />
			</Triggers>
		</asp:UpdatePanel>
		<asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
