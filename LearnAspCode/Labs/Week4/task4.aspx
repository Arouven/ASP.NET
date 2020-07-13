<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/guestMasterPage.Master" CodeBehind="task4.aspx.vb" Inherits="MasterPageSite.task42" %>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="server">

    <div>
        <h1 style="text-align: center">Auction Website</h1>
    </div>
    <br />
    <br />

    <asp:Label ID="lblCurrentBid" runat="server" Text=""></asp:Label><br />
    <br />
    <asp:TextBox ID="txtYourBid" CssClass="form-control" runat="server"></asp:TextBox>
    
    <asp:CustomValidator ID="CVBidCheck" runat="server" ErrorMessage="*Your bid is less than current bid" OnServerValidate="CVBidCheck_ServerValidate"></asp:CustomValidator>
    <br />
    <br />
    <asp:Button ID="btnSubmitBid" runat="server" Text="Submit Bid" />
</asp:Content>
