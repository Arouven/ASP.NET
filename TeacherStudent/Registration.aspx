<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Registration.aspx.vb" Inherits="TeacherStudent.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>


	<form id="form1" runat="server" class="col-lg-6 offset-lg-3 ">
		<div class="row justify-content-center">


			<asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="1px" ContinueDestinationPageUrl="~/Home.aspx" Font-Names="Verdana" Font-Size="0.8em" Width="298px">
				<ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
				<CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
				<TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="#FFFFFF" />
				<WizardSteps>
					<asp:CreateUserWizardStep runat="server">
						<CustomNavigationTemplate>
							<table border="0" cellspacing="5" style="width: 100%; height: 100%;">
								<tr align="right">
									<td align="right" colspan="0">
										<asp:Button ID="StepNextButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CommandName="MoveNext" Font-Names="Verdana" ForeColor="#284775" Text="Create User" ValidationGroup="CreateUserWizard1" />
									</td>
								</tr>
							</table>
						</CustomNavigationTemplate>
					</asp:CreateUserWizardStep>
					<asp:CompleteWizardStep runat="server" />
				</WizardSteps>
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="#FFFFFF" HorizontalAlign="Center" BorderStyle="Solid" Font-Size="0.9em" />
				<NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
				<SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="#FFFFFF" />
				<SideBarStyle BackColor="#5D7B9D" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
				<StepStyle BorderWidth="0px" />
			</asp:CreateUserWizard>

		</div>
	</form>


</body>
</html>
