<%@ Page Title="List of users" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="AdminViewsListOfHOHK.aspx.vb" Inherits="JP.AdminViewsListOfHOHK" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div class="row">
		<div class="col-sm-12">
			<h1>Admin Views List Of HO / HK</h1>
		</div>
		<div class="col-sm-6" style="background-color: coral">
			<h1>Tutor</h1>
			<h3>
				<asp:Label ID="LabelTotalTutorUnfreeze" runat="server" Text="Label"></asp:Label>
			</h3>
			<asp:DataList ID="DataListTutorUnfreeze" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" GridLines="Both" RepeatLayout="Flow">
				<ItemTemplate>
					<div class="card bg-warning text-white h-60" style="width: 200px; padding-top: 3px; margin: 10px;">
						<asp:Image runat="server" ImageUrl='<%# Eval("ProfilePictureUrl", "~/ProfilePictures/{0}")%>' ID="Image1" CssClass="card-img-top mx-auto d-block rounded" AlternateText="Card image" Width="190px" Height="200px" />
						<div class="card-body">
							<p class="card-text text-center">
								<asp:HyperLink CssClass="btn btn-primary" runat="server" NavigateUrl='<%#Eval("HOId", "~/Admin/UserDetails.aspx?user=HO&id={0}")%>'><%# Eval("UserName")%></asp:HyperLink>
							</p>
						</div>
					</div>
				</ItemTemplate>
			</asp:DataList>
		</div>

		<div class="col-sm-6" style="background-color: aqua">
			<h1>HK</h1>
			<h3>
				<asp:Label ID="LabelTotalStudentUnfreeze" runat="server" Text="Label"></asp:Label>
			</h3>
			<asp:DataList ID="DataListStudentUnfreeze" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" GridLines="Both" RepeatLayout="Flow">
				<ItemTemplate>
					<div class="card bg-info text-white h-60" style="width: 200px; padding-top: 3px; margin: 10px;">
						<asp:Image runat="server" ImageUrl='<%# Eval("ProfilePictureUrl", "~/ProfilePictures/{0}")%>' ID="Image1" CssClass="card-img-top mx-auto d-block rounded" AlternateText="Card image" Width="190px" Height="200px" />
						<div class="card-body">
							<p class="card-text text-center">
								<asp:HyperLink CssClass="btn btn-primary stretched-link" runat="server" NavigateUrl='<%#Eval("HKId", "~/UserDetails.aspx?user=HK&id={0}")%>'><%# Eval("UserName")%></asp:HyperLink>
							</p>
						</div>
					</div>
				</ItemTemplate>
			</asp:DataList>
		</div>
		
		<div class="col-sm-6" style="background-color: coral">
			<h1>HO</h1>
			<h3>
				<asp:Label ID="LabelTotalTutorFreeze" runat="server" Text="Label"></asp:Label>
			</h3>
			<asp:DataList ID="DataListTutorFreeze" runat="server" RepeatDirection="Horizontal" GridLines="Both" RepeatLayout="Flow">
				<ItemTemplate>
					<div class="card bg-warning text-white h-60" style="width: 200px; padding-top: 3px; margin: 10px;">
						<asp:Image runat="server" ImageUrl='<%# Eval("ProfilePictureUrl", "~/ProfilePictures/{0}")%>' ID="Image1" CssClass="card-img-top mx-auto d-block rounded" AlternateText="Card image" Width="190px" Height="200px" />
						<div class="card-body">
							<p class="card-text text-center">
								<asp:HyperLink CssClass="btn btn-primary" runat="server" NavigateUrl='<%#Eval("HOId", "~/UserDetails.aspx?user=HO&id={0}")%>'><%# Eval("UserName")%></asp:HyperLink>
							</p>
						</div>
					</div>
				</ItemTemplate>
			</asp:DataList>
		</div>

		<div class="col-sm-6" style="background-color: aqua">
			<h1>HK</h1>
			<h3>
				<asp:Label ID="LabelTotalStudentFreeze" runat="server" Text="Label"></asp:Label>
			</h3>
			<asp:DataList ID="DataListStudentFreeze" runat="server" RepeatDirection="Horizontal" GridLines="Both" RepeatLayout="Flow">
				<ItemTemplate>
					<div class="card bg-info text-white h-60" style="width: 200px; padding-top: 3px; margin: 10px;">
						<asp:Image runat="server" ImageUrl='<%# Eval("ProfilePictureUrl", "~/ProfilePictures/{0}")%>' ID="Image1" CssClass="card-img-top mx-auto d-block rounded" AlternateText="Card image" Width="190px" Height="200px" />
						<div class="card-body">
							<p class="card-text text-center">
								<asp:HyperLink CssClass="btn btn-primary stretched-link" runat="server" NavigateUrl='<%#Eval("HKId", "~/UserDetails.aspx?user=HK&id={0}")%>'><%# Eval("UserName")%></asp:HyperLink>
							</p>
						</div>
					</div>
				</ItemTemplate>
			</asp:DataList>
		</div>

		<div class="col-sm-12">
			<h1>Admin stats: Viewing number of HK / Jobs</h1>
			<h3>
				<asp:Label ID="LabelNoStudents" runat="server" Text="Label"></asp:Label>
			</h3>
			<br />
			<br />
			<h3>
				<asp:Label ID="LabelNoCourses" runat="server" Text="Label"></asp:Label>
			</h3>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
