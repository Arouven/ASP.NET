<%@ Page Title="Show RadioButton" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DetectingWhichRadioButtonControlHasBeenChecked.aspx.vb" Inherits="LearnAspCode.DetectingWhichRadioButtonControlHasBeenChecked" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

	<div>
		Select the source:
				<ul>
					<li>
						<asp:RadioButton ID="rdlMagazine" Text="Magazine Article" GroupName="Source" runat="server" />
					</li>
					<li>
						<asp:RadioButton ID="rdlTelevision" Text="Television Program" GroupName="Source" runat="server" />
					</li>
					<li>
						<asp:RadioButton ID="rdlOther" Text="Other Source" GroupName="Source" runat="server" />
					</li>
				</ul>
		<asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
		<hr />
		<asp:Label ID="lblResult" runat="server" />
	</div>
</asp:Content>
