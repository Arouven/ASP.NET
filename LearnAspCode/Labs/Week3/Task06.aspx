<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task06.aspx.vb" Inherits="LearnAspCode.Task61" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>To detect when a user hits the bull’s eyes in a dartboard image. Print messages: "You hit the target at coords (x,y)" or "You missed" accordingly. Here you will have to work with the ImageButton control.</h1>
	<br />
	<div>
		<div class="text-center">
			<asp:ImageMap ID="shoot" Width="600" Height="600" ImageUrl="~/Images/LabWeek3Pic2.png" runat="Server" HotSpotMode="PostBack">
				<asp:CircleHotSpot NavigateUrl="javascript:OnAbort()" X="300" Y="300" Radius="7" PostBackValue="Hit"></asp:CircleHotSpot>
				<asp:CircleHotSpot NavigateUrl="javascript:OnAbort()" X="300" Y="300" Radius="270" PostBackValue="Miss"></asp:CircleHotSpot>
			</asp:ImageMap>
			<br />
			<asp:Label ID="Label1" runat="server" Text="" Font-Size="XX-Large" Font-Bold="true"></asp:Label>
		</div>
	</div>
</asp:Content>


