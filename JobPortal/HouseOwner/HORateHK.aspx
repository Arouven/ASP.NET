<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="HORateHK.aspx.vb" Inherits="JP.HORateHK" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <h2 > Rating for <asp:Label ID="LabelHKName" runat="server" Text="Label"></asp:Label></h2><br />
  
   <div class="form-group">
          <asp:TextBox ID="textBoxPhoneNumber" CssClass="form-control" placeholder="Rating Number" TextMode="Number" runat="server" required></asp:TextBox>
          <asp:RegularExpressionValidator ID="REVPhonenumber" runat="server" ValidationGroup="registerGroup" ErrorMessage="Invalid Number" CssClass="text-danger" SetFocusOnError="True" ControlToValidate="textBoxPhoneNumber" ValidationExpression="\d{1}"></asp:RegularExpressionValidator>
        </div>
  <asp:Button ID="ButtonRate" OnClick="ButtonRate_Click" runat="server" Text="Submit" CssClass="btn btn-success" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder1" runat="server">
</asp:Content>
