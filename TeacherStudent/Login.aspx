<%@ Page Title="Register / Login" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="Login.aspx.vb" Inherits="TeacherStudent.Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div class="login-page">
		<form class="form" runat="server" >
			<div class="register-form">
				<asp:TextBox ID="TextBoxUsernameReg" runat="server" placeholder="Username" />
				<asp:TextBox ID="TextBoxPasswordReg" runat="server" TextMode="Password" placeholder="Password" />
				<asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email" placeholder="Email adderss" />


				<asp:TextBox  runat="server" placeholder="Email adderss" />
				<asp:TextBox  runat="server" placeholder="Email adderss" />
				<asp:TextBox  runat="server" placeholder="Email adderss" />
				<asp:TextBox  runat="server" placeholder="Email adderss" />
				<asp:TextBox  runat="server" placeholder="Email adderss" />
				<asp:TextBox  runat="server" placeholder="Email adderss" />
				<asp:TextBox  runat="server" placeholder="Email adderss" />
				<asp:TextBox  runat="server" placeholder="Email adderss" />
				<asp:TextBox  runat="server" placeholder="Email adderss" />
				<asp:TextBox  runat="server" placeholder="Email adderss" />
				<asp:TextBox  runat="server" placeholder="Email adderss" />
				<asp:TextBox  runat="server" placeholder="Email adderss" />
				<asp:TextBox  runat="server" placeholder="Email adderss" />




				<asp:Button ID="ButtonRegister" CssClass="logreg" runat="server" Text="create" />
				<p class="message">Already registered? <a href="#">Sign In</a></p>
			</div>
			<div class="login-form">
				<asp:TextBox ID="TextBoxUsernameLog" runat="server" placeholder="Username"></asp:TextBox>
				<asp:TextBox ID="TextBoxPasswordLog" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
				<asp:Button ID="ButtonLogin" CssClass="logreg" runat="server" Text="login" />
				<p class="message">Not registered? <a href="#">Create an account</a></p>
			</div>


			<br />
			<asp:Label ID="lblStatus" runat="server"></asp:Label>
		</form>

	</div>

</asp:Content>