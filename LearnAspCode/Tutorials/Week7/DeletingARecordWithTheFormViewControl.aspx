<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DeletingARecordWithTheFormViewControl.aspx.vb" Inherits="LearnAspCode.DeletingARecordWithTheFormViewControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<style type="text/css">
		#content {
			margin-left: 20px;
			width: 500px;
			padding: 10px;
			background-color: lightgray;
			font: 24px Georgia,Serif;
		}

		a {
			color: blue;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="Server">
	<div id="content">
		<asp:FormView ID="FormView1" runat="server" DataKeyNames="Movie_Id" AllowPaging="true" DataSourceID="SqlDataSource1">
			<ItemTemplate>
				Movie_Id:
				<asp:Label ID="Movie_IdLabel" runat="server" Text='<%# Eval("Movie_Id") %>' />
				<br />
				moviename:
				<asp:Label ID="movienameLabel" runat="server" Text='<%# Eval("moviename") %>' />
				<br />
				description:
				<asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
				<br />
				boxofficetotals:
				<asp:Label ID="boxofficetotalsLabel" runat="server" Text='<%# Eval("boxofficetotals", "{0:c}") %>' />
				<br />
				poster:
				<asp:Image ID="posterLabel" runat="server" ImageUrl='<%# 			Eval("poster", "~/Images/{0}") %>' />
				<br />
				status:
				<asp:CheckBox ID="statusCheckBox" runat="server" Checked='<%# Eval("status") %>'
					Enabled="false" />
				<br />
				Category_Id:
				<asp:Label ID="Category_IdLabel" runat="server" Text='<%# Eval("Category_Id") %>' />
				<br />
				<asp:LinkButton ID="lnkDelete" Text="Delete Movie" CommandName="Delete" CausesValidation="True" OnClientClick="return confirm('Are you sure?');" runat="server" />
			</ItemTemplate>
		</asp:FormView>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesCS %>" DeleteCommand="DELETE FROM tblMovies WHERE (Movie_Id = @movie_id)" SelectCommand="SELECT * FROM [tblMovies]">
			<DeleteParameters>
				<asp:Parameter Name="movie_id" />
			</DeleteParameters>
		</asp:SqlDataSource>
	</div>
</asp:Content>
