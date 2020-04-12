<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="ChangePassword.aspx.vb" Inherits="TeacherStudent.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<form id="form1" runat="server">
		<div>

			<asp:ChangePassword ID="ChangePassword1" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" ContinueDestinationPageUrl="~/Home.aspx" Font-Names="Verdana" Font-Size="10pt">
				<TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
			</asp:ChangePassword>

		</div>
	</form>


</asp:Content>
