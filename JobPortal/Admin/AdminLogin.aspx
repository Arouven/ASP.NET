﻿<%@ Page Title="Admin Login" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="AdminLogin.aspx.vb" Inherits="JP.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="page-content bg-white">
    <!-- inner page banner -->
    <div class="dez-bnr-inr overlay-black-middle bg-pt">
      <div class="container">
        <div class="dez-bnr-inr-entry">
          <h1 class="text-white">Web Admin Login</h1>

        </div>
      </div>
    </div>
    <!-- inner page banner END -->
    <!-- contact area -->
    <div class="section-full content-inner-2 shop-account">
      <!-- Product -->
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
            <h3 class="font-weight-700 m-t0 m-b20">Login Your Web Admin Account</h3>
          </div>
        </div>
        <div>
          <div class="max-w500 m-auto m-b30">
            <div class="p-a30 border-1 seth">
              <div class="tab-content nav">
                <div id="login" class="tab-pane active col-12 p-a0 ">
                  <h4 class="font-weight-700">LOGIN</h4>
                  <p class="font-weight-600">If you have an account with us, please log in.</p>
                  <div class="form-group">
                    <label class="font-weight-700">Username *</label>
                    <asp:TextBox ID="TextBoxUsernameAdminLog" runat="server" placeholder="Your Username Id" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxUsernameAdminLog" CssClass="text-danger" ValidationGroup="adminLoginGroup" ErrorMessage="The user name field is required." />
                    <%--<input name="dzName" required="" class="form-control" placeholder="Your Email Id" type="email">--%>
                  </div>
                  <div class="form-group">
                    <label class="font-weight-700">PASSWORD *</label>
                    <asp:TextBox ID="TextBoxPasswordAdminLog" runat="server" TextMode="Password" placeholder="Type Password" CssClass="form-control"></asp:TextBox><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxPasswordAdminLog" CssClass="text-danger" ValidationGroup="adminLoginGroup" ErrorMessage="The password field is required." />
                    <%--<input name="dzName" required="" class="form-control " placeholder="Type Password" type="password">--%>
                  </div>
                  <div class="form-group">
                    <asp:CheckBox runat="server" ID="AdminRememberMe" ValidationGroup="adminLoginGroup" Text="Remember me?" Checked="true" />
                  </div>
                  <div class="text-left">

                    <asp:Button ID="ButtonAdminLogin" OnClick="ButtonAdminLogin_Click" ValidationGroup="adminLoginGroup" CssClass="site-button m-r5 button-lg" runat="server" Text="login" />

                    <%--<button class="site-button m-r5 button-lg">login</button>--%>
                    <a data-toggle="tab" href="#forgot-password" class="m-l5"><i class="fa fa-unlock-alt"></i>Forgot Password</a>
                  </div>
                </div>
                <div id="forgot-password" class="tab-pane fade  col-12 p-a0">
                  <h4 class="font-weight-700">FORGET PASSWORD ?</h4>
                  <p class="font-weight-600">Contact database admin to reset your password. </p>

                </div>
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Product END -->
    </div>
    <!-- contact area  END -->
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder1" runat="server">
</asp:Content>
