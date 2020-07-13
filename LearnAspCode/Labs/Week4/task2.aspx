<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="task2.aspx.vb" Inherits="MasterPageSite.task22" %>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="server">

    
    <div>
        <h1 style="text-align:center">Registration Form</h1>
    </div>

    <br />
    <div>
    <asp:TextBox ID="txtFirstName" CssClass="form-control" placeholder="First Name" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RFVFirstname" runat="server" SetFocusOnError="true" CssClass="text-danger" ErrorMessage="*First Name Required!" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
    <asp:TextBox ID="txtSurName" CssClass="form-control" placeholder="Surname" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RFVSurname" runat="server" SetFocusOnError="true" CssClass="text-danger" ErrorMessage="*Surname Required!" ControlToValidate="txtSurName"></asp:RequiredFieldValidator>
    <asp:TextBox ID="txtUserName" CssClass="form-control" placeholder="Username" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RFVUsername" runat="server" SetFocusOnError="true" CssClass="text-danger" ErrorMessage="*Username Required!" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RFVPassword" runat="server" SetFocusOnError="true" CssClass="text-danger" ErrorMessage="*Password Required!" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="REVPassword" runat="server" CssClass="text-danger" ValidateEmptyText="true" ErrorMessage="*Password must be between 5-10 characters!" ControlToValidate="txtPassword" ValidationExpression="[0-9a-zA-Z]{5,10}" SetFocusOnError="True"></asp:RegularExpressionValidator>
    <asp:TextBox ID="txtConfirmPassword" CssClass="form-control" placeholder="Confirm Password" runat="server"></asp:TextBox>
    <asp:CompareValidator ID="CVConfirmPassword" runat="server" CssClass="text-danger" ErrorMessage="*Password does not match" ControlToValidate="txtPassword" ValueToCompare="txtPassword" ControlToCompare="txtConfirmPassword" SetFocusOnError="True"></asp:CompareValidator>
    <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="REVEmail" runat="server" ErrorMessage="*Invalid Email" CssClass="text-danger" SetFocusOnError="True" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    <asp:TextBox ID="txtPhoneNumber" CssClass="form-control" placeholder="Phone Number" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="REVPhonenumber" runat="server" ErrorMessage="*Invalid Phone Number" CssClass="text-danger" SetFocusOnError="True" ControlToValidate="txtPhoneNumber" ValidationExpression="\d{8}" ></asp:RegularExpressionValidator>
    <asp:TextBox ID="txtZipCode" CssClass="form-control" placeholder="Zip Code" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="REVZipcode" runat="server" CssClass="text-danger" ErrorMessage="*Zip Code must be 5 digits!" ControlToValidate="txtZipCode" ValidationExpression="[0-9a-zA-Z]{5}" SetFocusOnError="True"></asp:RegularExpressionValidator>
        <br />
        <asp:DropDownList CssClass="form-control" ID="ddCountry" runat="server">
            <asp:ListItem Value="-1">Choose Country</asp:ListItem>
            <asp:ListItem Value="0">Mauritius</asp:ListItem>
            <asp:ListItem Value="1">Rodrigues</asp:ListItem>
            <asp:ListItem Value="2">Reunion</asp:ListItem>
        </asp:DropDownList>
        <asp:CustomValidator ID="CVCountryDropDown" runat="server" ControlToValidate="ddCountry" OnServerValidate="CVCountryDropDown_ServerValidate" CssClass="text-danger" ErrorMessage="*Choose a Country!"></asp:CustomValidator>

        <br />
        <br />
    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary text-center" OnClick="btnSubmit_Click" Text="Submit" />
        </div>

</asp:Content>
