<%@ Page Title="MultiView Tabs" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DisplayingTabbedPageWithMultiViewControl.aspx.vb" Inherits="LearnAspCode.DisplayingTabbedPageWithMultiViewControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		html {
			background-color: silver;
		}

		.tabs {
			position: relative;
			top: 1px;
			left: 10px;
		}

		.tab {
			border: solid 1px black;
			background-color: #eeeeee;
			padding: 2px 10px;
		}

		.selectedTab {
			background-color: white;
			border-bottom: solid 1px white;
		}

		.tabContents {
			border: solid 1px black;
			padding: 10px;
			background-color: white;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<script runat="server">
		Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As MenuEventArgs)
			Dim index As Integer = Int32.Parse(e.Item.Value)
			MultiView1.ActiveViewIndex = index
		End Sub
	</script>
	<div>
		<asp:Menu ID="Menu1" Orientation="Horizontal" StaticMenuItemStyle-CssClass="tab" StaticSelectedStyle-CssClass="selectedTab" CssClass="tabs" OnMenuItemClick="Menu1_MenuItemClick" runat="server">
			<Items>
				<asp:MenuItem Text="Tab 1" Value="0" Selected="true" />
				<asp:MenuItem Text="Tab 2" Value="1" />
				<asp:MenuItem Text="Tab 3" Value="2" />
			</Items>
		</asp:Menu>
		<div class="tabContents">
			<asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
				<asp:View ID="View1" runat="server">
					<br />
					This is the first view
							<br />
					This is the first view
							<br />
					This is the first view
							<br />
					This is the first view
				</asp:View>
				<asp:View ID="View2" runat="server">
					<br />
					This is the second view
							<br />
					This is the second view
							<br />
					This is the second view
							<br />
					This is the second view
				</asp:View>
				<asp:View ID="View3" runat="server">
					<br />
					This is the third view
							<br />
					This is the third view
							<br />
					This is the third view
							<br />
					This is the third view
				</asp:View>
			</asp:MultiView>
		</div>
	</div>
</asp:Content>
