﻿<%@ Page Title="List of HO" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="ViewHO.aspx.vb" Inherits="JP.ViewHO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div class="container">
		<div class="row form-group" runat="server">
			<div class="col-sm-6 " style="float: left">
				<h2>List of HOs</h2>
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
				<asp:ListView ID="lvMovies" runat="server" ItemPlaceholderID="itemPlaceholder" DataKeyNames="HOId" ClientIDMode="Static">
					<ItemTemplate>
						<div class="card h-100" style="width: 195px; float: left; margin: 8px;">
							<asp:Image runat="server" ImageUrl='<%# Eval("ProfilePictureUrl", "~/ProfilePictures/{0}")%>' ID="Image1" class="card-img-top" alt="Card image" Width="193px" Height="195px" />
							<div class="card-body">
								<h6 class="card-title"><%# Eval("UserName")%></h6>
								<p class="card-text">
								</p>
								<p class="card-text">
								</p>
								<%--Eval movie_id as the commandargument--%>
								<asp:HyperLink CssClass="btn btn-primary" runat="server" NavigateUrl='<%#Eval("HOId", "~/Admin/UserDetails.aspx?user=HO&id={0}")%>'>Details</asp:HyperLink>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
