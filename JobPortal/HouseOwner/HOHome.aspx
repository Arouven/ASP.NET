<%@ Page Title="HouseOwner Dashboard" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="HOHome.aspx.vb" Inherits="JP.HOHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="text-center" style="margin: auto;">
    <br />
    <br />
    <h2>
      <asp:Label ID="LabelWelcome" runat="server" Text="Welcome xxx you are logged in as HouseOwner"></asp:Label>
    </h2>
    <br />
    <br />
  </div>
  <div class="mystudent">
    <div class="breadcumb-area bg-img">
      <div class="bradcumbContent">
        <h2 style="text-align:center">Job</h2>
      </div>
    </div>
    <div class="section-padding-100-0">
      <div class="col-12">
        <div class="academy-cool-facts-area mb-50">
          <div class="row">
            <!-- Single Cool Fact-->
            <div class="col-24 col-sm-12 col-md-6">
              <div class="head-counter-bx text-center">
                <i class="ti-user" style="color: blue;"></i>
                <h3 class="m-b5 counter"><span class="counter">
                  <asp:Label ID="LabelTotalCourse" runat="server" Text="0"></asp:Label></span></h3>
                <p>Total Jobs</p>
              </div>
            </div>
            <div class="col-24 col-sm-12 col-md-6">
              <div class="head-counter-bx text-center">
                <i class="ti-user" style="color: green;"></i>
                <h3 class="m-b5 counter"><span class="counter">
                  <asp:Label ID="LabelMyTotalCourses" runat="server" Text="0"></asp:Label></span></h3>
                <p>My Total Jobs</p>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-20 col-sm-10 col-md-5" style="margin: auto;">
              <div class="academy-buttons-area text-center">
                <a runat="server" href="~/HouseOwner/HOCRUDJob" class="btn academy-btn btn-4 m-2" style="width: 100%;">View More Info</a>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
  <hr />

  <div class="mytutor">
    <div class="breadcumb-area bg-img">
      <div class="bradcumbContent">
        <h2 class="text-center" style="margin: auto;">HouseKeeper</h2>
      </div>
    </div>
    <div class="section-padding-100-0">
      <div class="col-12">
        <div class="academy-cool-facts-area mb-50">
          <div class="row">
            <!-- Single Cool Fact-->
            <div class="col-16 col-sm-8 col-md-4">
              <div class="head-counter-bx text-center">
                <i class="ti-home" style="color: blue;"></i>
                <h3 class="m-b5 counter"><span class="counter">
                  <asp:Label ID="LabelMyTotalStudent" runat="server" Text="0"></asp:Label></span></h3>
                <p>My Total HouseKeeper</p>
              </div>
            </div>
            <div class="col-16 col-sm-8 col-md-4">
            </div>
            <div class="col-20 col-sm-10 col-md-5" style="margin: auto;">
              <div class="academy-buttons-area text-center">
                <a runat="server" href="~/HouseOwner/HOViewsListOfHK" class="btn academy-btn btn-4 m-2" style="width: 100%;">View More Info</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <hr />
  <hr />
  <br />
  <br />
  <br />
  <br />
  <br />
  <hr />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>

