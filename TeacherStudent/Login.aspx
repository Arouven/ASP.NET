<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="TeacherStudent.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Register / Login - Academy</title>

	<link rel="icon" href="img/core-img/favicon.ico">
	<!-- Font Icon -->
	<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

	<!-- Main css -->
	<link rel="stylesheet" href="css/loginStyle.css">
</head>
<body>
	<div class="login-page">
		<form class="form" runat="server">
			<div class="register-form">
				<asp:TextBox ID="TextBoxUsernameReg" runat="server" placeholder="Username" />
				<asp:TextBox ID="TextBoxPasswordReg" runat="server" TextMode="Password" placeholder="Password" />
				<asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email" placeholder="Email adderss"  />
				<asp:Button ID="ButtonRegister" CssClass="logreg" runat="server" Text="create" />
				<p class="message">Already registered? <a href="#">Sign In</a></p>
			</div>


			<div class="login-form">
				<asp:TextBox ID="TextBoxUsernameLog" runat="server" placeholder="Username" ></asp:TextBox>
				<asp:TextBox ID="TextBoxPasswordLog" runat="server" TextMode="Password" placeholder="Password" ></asp:TextBox>

				<asp:Button ID="ButtonLogin" CssClass="logreg" runat="server" Text="login" />

				<p class="message">Not registered? <a href="#">Create an account</a></p>
				<asp:Button ID="Button1" runat="server" Text="Button" />
				<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
			</div>


			<br />
			<asp:Label ID="lblStatus" runat="server"></asp:Label>
		</form>

	</div>


	<!-- JS -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<script src="js/login.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>

