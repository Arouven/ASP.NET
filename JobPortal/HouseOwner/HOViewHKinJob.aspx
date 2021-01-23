<%@ Page Title="HouseKeepers in Job" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="HOViewHKinJob.aspx.vb" Inherits="JP.HOViewHKinJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="col-sm-12">
		<h1 style="text-align:center">Job : <asp:Label ID="Labelcoursename" runat="server" Text=""></asp:Label></h1>
		<h3>
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
									<asp:TextBox ID="txtSearch" AutoPostBack="true" CssClass="form-control"  runat="server" CausesValidation="false" OnTextChanged="txtSearch_TextChanged" placeholder="Search HouseKeeper"></asp:TextBox>								
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
												
												<asp:linkButton ID="ButtonOpenStudent" class="btn btn-success" runat="server" Text="Details" CommandArgument='<%# Eval("HKId") %>' OnClick="ButtonOpenStudent_Click" />
											
											</div>
										</div>
									</div>
								</div>


							</ItemTemplate>
						</asp:Repeater>


					</div>
				</div>
			</ContentTemplate>
		</asp:UpdatePanel>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
