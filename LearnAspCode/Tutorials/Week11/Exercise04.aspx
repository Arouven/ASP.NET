<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Exercise04.aspx.vb" Inherits="LearnAspCode.Exercise04" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<div>
		<h3>Search for movies</h3>
		<h4>Filter by BoxOfficeTotals:</h4>
		<asp:DropDownList ID="ddlboxtotals" runat="server" CssClass="form-control">
			<asp:ListItem Text="Select Amount" Value="-1"></asp:ListItem>
			<asp:ListItem Text="Above $150000000" Value="150000000"></asp:ListItem>
			<asp:ListItem Text="Above $300000000" Value="300000000"></asp:ListItem>
			<asp:ListItem Text="Above $500000000" Value="500000000"></asp:ListItem>
		</asp:DropDownList>
		<br />
		<h4>Enter Movie name</h4>
		<asp:TextBox ID="txtmoviename" AutoPostBack="true" CssClass="form-control" OnTextChanged="txtmoviename_TextChanged" runat="server"></asp:TextBox>
		<br />
		
		<asp:UpdatePanel ID="UpdatePanel1" runat="server">
			<ContentTemplate>
				<asp:DataList ID="dlstMovies" runat="server">
			<ItemTemplate>
				<h1><%#Eval("Moviename")%></h1>
				Movie Description:
				<%#Eval("Description") %>
				<br />
				Box Office Totals:
				<%#Eval("BoxOfficeTotals", "{0:c}") %>
			</ItemTemplate>
		</asp:DataList>
			</ContentTemplate>
			<Triggers>
				<asp:AsyncPostBackTrigger ControlID="txtmoviename" EventName="TextChanged" />
				<asp:AsyncPostBackTrigger ControlID="ddlboxtotals" EventName="selectedindexchanged" />
			</Triggers>
		</asp:UpdatePanel>
	</div>
</asp:Content>
