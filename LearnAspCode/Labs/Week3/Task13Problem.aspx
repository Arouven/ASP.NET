<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Task13Problem.aspx.vb" Inherits="LearnAspCode.Task13" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<style type="text/css">
		html {
			background-color: silver;
		}

		.content {
			background-color: white;
			padding: 10px;
			border: solid 1px black;
			margin: auto;
			width: 400px;
			text-align: center;
		}

		.box {
			float: right;
			padding: 10px;
			border-left: solid 1px black;
		}

		.clear {
			clear: both;
		}
	</style>
	<title>AdRotator XML</title>
</head>
<body>
	<form id="form1" runat="server">
		<div class="content">
			<asp:AdRotator ID="AdRotator1" AdvertisementFile="~/xmlbanner/mybanner.xml" KeywordFilter="banner" CssClass="banner" runat="server" />
			<br />
			<div class="box">
				<asp:AdRotator ID="AdRotator2" AdvertisementFile="~/xmlbanner/mybanner.xml" KeywordFilter="box" runat="server" />
				<br />
				<br />
				<asp:AdRotator ID="AdRotator3" AdvertisementFile="~/xmlbanner/mybanner.xml" KeywordFilter="box" runat="server" />
			</div>
			<br />
			Here is the body text in the page.
 <br />
			Here is the body text in the page.
 <br />
			Here is the body text in the page.
 <br />
			Here is the body text in the page.
 <br class="clear" />
		</div>
	</form>
</body>
</html>

