<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="addressform.ascx.vb" Inherits="LearnAspCode.addressform" %>
<fieldset>
	<legend>
		<asp:Literal
			ID="ltlTitle"
			Text="Address Form"
			runat="server" />
	</legend>
	<div class="addressLabel">
		<asp:Label
			ID="lblStreet"
			Text="Street:"
			AssociatedControlID="txtStreet"
			runat="server" />
	</div>
	<div class="addressField">
		<asp:TextBox
			ID="txtStreet"
			runat="server" />
		<asp:RequiredFieldValidator
			ID="reqStreet"
			Text="(required)"
			ControlToValidate="txtStreet"
			runat="server" />
	</div>
	<br class="clear" />
	<div class="addressLabel">
		<asp:Label
			ID="lblCity"
			Text="City:"
			AssociatedControlID="txtCity"
			runat="server" />
	</div>
	<div class="addressField">
		<asp:TextBox
			ID="txtCity"
			runat="server" />
		<asp:RequiredFieldValidator
			ID="reqCity"
			Text="(required)"
			ControlToValidate="txtCity"
			runat="server" />
	</div>
	<br class="clear" />
	<div class="addressLabel">
		<asp:Label
			ID="lblState"
			Text="State:"
			AssociatedControlID="txtState"
			runat="server" />
	</div>
	<div class="addressField">
		<asp:TextBox
			ID="txtState"
			runat="server" />
		<asp:RequiredFieldValidator
			ID="reqState"
			Text="(required)"
			ControlToValidate="txtState"
			runat="server" />
	</div>
	<br class="clear" />
	<div class="addressLabel">
		<asp:Label
			ID="lblPostalCode"
			Text="Postal Code:"
			AssociatedControlID="txtPostalCode"
			runat="server" />
	</div>
	<div class="addressField">
		<asp:TextBox
			ID="txtPostalCode"
			runat="server" />
		<asp:RequiredFieldValidator
			ID="RequiredFieldValidator1"
			Text="(required)"
			ControlToValidate="txtPostalCode"
			runat="server" />
	</div>
	<br class="clear" />
</fieldset>
[ showaddress.asp