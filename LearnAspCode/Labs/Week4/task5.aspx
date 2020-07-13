<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="task5.aspx.vb" Inherits="MasterPageSite.task52" %>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="server">

    <div>
        <h1 style="text-align:center">Credit Card Information</h1>
    </div>

    <br />
    <br />

    <asp:TextBox ID="txtCreditCard" CssClass="form-control" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RFVCreditCard" ControlToValidate="txtCreditCard" runat="server" ErrorMessage="*Credit Card Number Required!"></asp:RequiredFieldValidator>
    <br /> <asp:RegularExpressionValidator ID="REVCreditCard" ControlToValidate="txtCreditCard" runat="server" ErrorMessage="*Credit Card Number Must be 16 digits" ValidationExpression="[0-9]{16}"></asp:RegularExpressionValidator>
    <br /><br />
    
    <asp:Button ID="btnSubmitCreditCard" CssClass="btn btn-primary" runat="server" Text="Submit CreditCard" OnClick="btnSubmitCreditCard_Click" />
</asp:Content>
