<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="viewmovieschedule.aspx.vb" Inherits="LearnAspCode.viewmovieschedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h2>View Movie Schedule</h2>
		</div>
	</div>
	<div class="tbldiv">
		<asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">
			<Columns>
				<asp:BoundField DataField="mname" HeaderText="Movie Title" />
				<asp:BoundField DataField="cat_name" HeaderText="Category" />
				<asp:BoundField DataField="descr" HeaderText="Description" />
				<asp:ImageField DataImageUrlField="poster" DataImageUrlFormatString="~/Images/{0}" HeaderText="Poster" />
				<asp:BoundField DataField="Schedule" HeaderText="Schedule" HtmlEncode="false" DataFormatString="<a href='{0}' data-toggle='lightbox'>View Schedule</a>" />
				<asp:BoundField DataField="box" HeaderText="Box Office" />
				<asp:TemplateField HeaderText="Action">
					<ItemTemplate>
						<%-- Assign the Movie_Id to the link button --%>
						<asp:LinkButton ID="btnDelete" CssClass="btn btn-info" runat="server" OnClick="btnDelete_Click" OnClientClick="return confirm('are you sure you want to delete')" CommandArgument='<%# Eval("Movie_Id") %>' ToolTip="Delete Movie"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
	</div>
</asp:Content>
