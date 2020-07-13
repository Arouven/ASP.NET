<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="InsertingARecordWithTheDetailsViewControl.aspx.vb" Inherits="LearnAspCode.InsertingARecordWithTheDetailsViewControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		html {
			font: 14px Arial,Sans-Serif;
		}

		td, th {
			padding: 10px;
		}

		#divDisplay {
			border: solid 1px black;
			width: 800px;
			padding: 15px;
			background-color: #eeeeee;
		}

		#divInsert {
			display: none;
			border: solid 1px black;
			width: 400px;
			position: absolute;
			top: 100px;
			right: 100px;
			padding: 10px;
			background-color: white;
		}
	</style>
	<script type="text/javascript">
		function showInsert() {
			var divInsert = document.getElementById('divInsert');
			divInsert.style.display = 'block';
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div id="divDisplay">
		<h1>List of Categories:</h1>
		<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Category_Id">
			<Columns>
				<asp:BoundField DataField="Category_Id" HeaderText="Category_Id" InsertVisible="False" ReadOnly="True" SortExpression="Category_Id" />
				<asp:BoundField DataField="Category_Name" HeaderText="Category_Name" SortExpression="Category_Name" />
			</Columns>
		</asp:GridView>
		<br />
		<a href="JavaScript:showInsert();">Insert Category</a>
	</div>
	<hr />
	<div id="divInsert">
		<h1>Insert Category</h1>
		<asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="Category_Id" DefaultMode="Insert" DataSourceID="SqlDataSource1">
			<Fields>
				<asp:BoundField DataField="Category_Id" HeaderText="Category_Id" InsertVisible="False" ReadOnly="True" SortExpression="Category_Id" />
				<asp:BoundField DataField="Category_Name" HeaderText="Category_Name" SortExpression="Category_Name" />
				<asp:CommandField ControlStyle-CssClass="btn btn-success" CausesValidation="True" ShowInsertButton="True" />
			</Fields>
		</asp:DetailsView>
	</div>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesCS %>" InsertCommand="INSERT INTO tblCategory(Category_Name) VALUES (@Category_Name)" SelectCommand="SELECT * FROM [tblCategory]">
		<InsertParameters>
			<asp:Parameter Name="Category_Name" />
		</InsertParameters>
	</asp:SqlDataSource>
</asp:Content>
