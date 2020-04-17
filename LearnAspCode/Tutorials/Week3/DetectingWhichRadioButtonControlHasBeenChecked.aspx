<%@ Page Title="Show RadioButton" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="DetectingWhichRadioButtonControlHasBeenChecked.aspx.vb" Inherits="LearnAspCode.DetectingWhichRadioButtonControlHasBeenChecked" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
	<script runat="server">
		Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)
			If rdlMagazine.Checked Then
				lblResult.Text = rdlMagazine.Text
			End If
			If rdlTelevision.Checked Then
				lblResult.Text = rdlTelevision.Text
			End If
			If rdlOther.Checked Then
				lblResult.Text = rdlOther.Text
			End If
		End Sub
	</script>
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
