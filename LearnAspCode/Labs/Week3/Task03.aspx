<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="Task03.aspx.vb" Inherits="LearnAspCode.Task31" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<h1>Modify example 6 in your tutorial such that the program respond once a user checks any one of the radio buttons. You will also have to use the Sender parameter rather than If Statement.</h1>
	<br />
	<div>
		Select the source:
			<ul>
				<li>
					<asp:RadioButton OnCheckedChanged="Radio_CheckedChanged" AutoPostBack="true" ID="rdlMagazine" Text="Magazine Article" GroupName="Source" runat="server" />
				</li>
				<li>
					<asp:RadioButton OnCheckedChanged="Radio_CheckedChanged" AutoPostBack="true" ID="rdlTelevision" Text="Television Program" GroupName="Source" runat="server" />
				</li>
				<li>
					<asp:RadioButton OnCheckedChanged="Radio_CheckedChanged" AutoPostBack="true" ID="rdlOther" Text="Other Source" GroupName="Source" runat="server" />
				</li>
			</ul>
		<asp:Label ID="lblResult" runat="server" />

	</div>
</asp:Content>

