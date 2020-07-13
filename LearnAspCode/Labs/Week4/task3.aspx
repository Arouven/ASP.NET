<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="task3.aspx.vb" Inherits="MasterPageSite.task32" %>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="server">

    <asp:Label ID="lblFirstNumber" runat="server" Text="Enter First Number: "></asp:Label><asp:TextBox ID="txtFirstNumber" CssClass="form-control" runat="server"></asp:TextBox><br />
    <asp:Label ID="lblSecondNumber" runat="server" Text="Enter Second Number: "></asp:Label><asp:TextBox ID="txtSecondNumber" CssClass="form-control" runat="server"></asp:TextBox><br />
   
    <asp:Label ID="lblThirdNumber" runat="server" Text="Enter the number that falls within the two: "></asp:Label><asp:TextBox ID="txtThirdNumber" CssClass="form-control" runat="server"></asp:TextBox>
     <br /><asp:CustomValidator ID="CVCheckThirdNumber" runat="server" CssClass="text-danger" ErrorMessage="*Number does not fall within the two" OnServerValidate="CVCheckThirdNumber_ServerValidate" SetFocusOnError="True"></asp:CustomValidator>
    <br />
    <br />
    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" />
</asp:Content>
