<%@ Page Title="Admin Dashboard" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="AdminHome.aspx.vb" Inherits="JP.AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="text-center" style="margin: auto;">
    <br />
    <br />
    <h2>
      <asp:Label ID="LabelWelcome" runat="server" Text="Welcome xxx you are logged in as admin"></asp:Label>
    </h2>
    <br />
    <br />
  </div>





  <div class="mystudent">
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
                <i class="ti-user" style="color: blue;"></i>
                <h3 class="m-b5 counter"><span class="counter">
                  <asp:Label ID="LabelTotalStudent" runat="server" Text="0"></asp:Label></span></h3>
                <p>Total HK</p>
              </div>
            </div>
            <div class="col-16 col-sm-8 col-md-4">
              <div class="head-counter-bx text-center">
                <i class="ti-user" style="color: green;"></i>
                <h3 class="m-b5 counter"><span class="counter">
                  <asp:Label ID="LabelUnfreezeStudent" runat="server" Text="0"></asp:Label></span></h3>
                <p>HK Available</p>
              </div>
            </div>
            <div class="col-16 col-sm-8 col-md-4">
              <div class="head-counter-bx text-center">
                <i class="ti-user" style="color: red;"></i>
                <h3 class="m-b5 counter"><span class="counter">
                  <asp:Label ID="LabelFreezeStudent" runat="server" Text="0"></asp:Label></span></h3>
                <p>HK Blocked</p>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-20 col-sm-10 col-md-5" style="margin: auto;">
              <div class="academy-buttons-area text-center">
                <a runat="server" href="~/Admin/ViewHK" class="btn academy-btn btn-4 m-2" style="width: 100%;">View More Info</a>
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
        <h2 class="text-center" style="margin: auto;">HouseOwner</h2>
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
                  <asp:Label ID="LabelTotalTutor" runat="server" Text="0"></asp:Label></span></h3>
                <p>Total HO</p>
              </div>
            </div>
            <div class="col-16 col-sm-8 col-md-4">
              <div class="head-counter-bx text-center">
                <i class="ti-home" style="color: green;"></i>
                <h3 class="m-b5 counter"><span class="counter">
                  <asp:Label ID="LabelUnfreezeTutor" runat="server" Text="0"></asp:Label></span></h3>
                <p>HO Available</p>
              </div>
            </div>
            <div class="col-16 col-sm-8 col-md-4">
              <div class="head-counter-bx text-center">
                <i class="ti-home" style="color: red;"></i>
                <h3 class="m-b5 counter"><span class="counter">
                  <asp:Label ID="LabelFreezeTutor" runat="server" Text="0"></asp:Label></span></h3>
                <p>HO Blocked</p>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-20 col-sm-10 col-md-5" style="margin: auto;">
              <div class="academy-buttons-area text-center">
                <a runat="server" href="~/Admin/ViewHO" class="btn academy-btn btn-4 m-2" style="width: 100%;">View More Info</a>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>

  </div>
  <hr />

  <div class="mycourse">
    <div class="breadcumb-area bg-img">
      <div class="bradcumbContent">
        <h2 class="text-center" style="margin: auto;">Jobs</h2>
      </div>
    </div>
    <div class="section-padding-100-0">
      <div class="col-12">
        <div class="academy-cool-facts-area mb-50">
          <div class="row">
            <!-- Single Cool Fact-->
            <div class="col-24 col-sm-12 col-md-6">
              <div class="head-counter-bx text-center">
                <i class="ti-hummer" style="color: blue;"></i>
                <h3 class="m-b5 counter"><span class="counter">
                  <asp:Label ID="LabelTotalCourse" runat="server" Text="0"></asp:Label></span></h3>
                <p>Total Jobs</p>
              </div>
            </div>
            <div class="col-24 col-sm-12 col-md-6">
              <br />
              <br />
              <div class="academy-buttons-area text-center">
                <a runat="server" href="~/Admin/AdminCRUDJob" class="btn academy-btn btn-4 m-2" style="width: 100%;">View More Info</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
  <hr />
  <div class="mymaterial">
    <div class="breadcumb-area bg-img" >
      <div class="bradcumbContent">
        <h2 class="text-center" style="margin: auto;">Categories</h2>
      </div>
    </div>
    <div class="section-padding-100-0">
      <div class="col-12">
        <div class="academy-cool-facts-area mb-50">
          <div class="row">
            <!-- Single Cool Fact-->
            <div class="col-24 col-sm-12 col-md-6">
              <div class="head-counter-bx text-center">
                <i class="ti-envelope" style="color: blue;"></i>
                <h3 class="m-b5 counter"><span class="counter">
                  <asp:Label ID="LabelTotalCategory" runat="server" Text="0"></asp:Label></span></h3>
                <p>Total Categories</p>
              </div>
            </div>
            <div class="col-24 col-sm-12 col-md-6">
              <br />
              <br />
              <div class="academy-buttons-area text-center">
                <a runat="server" href="~/Admin/AdminCRUDCategory" class="btn academy-btn btn-4 m-2" style="width: 100%;">View More Info</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <hr />

    <div class="breadcumb-area bg-img">
      <div class="bradcumbContent">
        <h2 class="text-center" style="margin: auto;">Locations</h2>
      </div>
    </div>
    <div class="section-padding-100-0">
      <div class="col-12">
        <div class="academy-cool-facts-area mb-50">
          <div class="row">
            <!-- Single Cool Fact-->
            <div class="col-24 col-sm-12 col-md-6">
              <div class="head-counter-bx text-center">
                <i class="ti-location-pin" style="color: blue;"></i>
                <h3 class="m-b5 counter"><span class="counter">
                  <asp:Label ID="LabelTotalMaterial" runat="server" Text="0"></asp:Label></span></h3>
                <p>Total Locations</p>
              </div>
            </div>
            <div class="col-24 col-sm-12 col-md-6">
              <br />
              <br />
              <div class="academy-buttons-area text-center">
                <a runat="server" href="~/Admin/AdminCRUDLocation" class="btn academy-btn btn-4 m-2" style="width: 100%;">View More Info</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <br />
  <br />
  <br />
  <br />
  <br />
  <hr />
  <div class="col-12">
    <div class="academy-cool-facts-area mb-50">
      <div class="row">

        <!-- Single Cool Fact-->
        <div class="col-16 col-sm-8 col-md-4">
          <div class="head-counter-bx text-center">
            <i class="ti-hummer" style="color: blue;"></i>
            <h3 class="m-b5 counter"><span class="counter">
              <asp:Label ID="LabelnoCourses" runat="server" Text="0"></asp:Label></span></h3>
            <p>Jobs Available</p>
          </div>
        </div>

        <!-- Single Cool Fact-->
        <div class="col-16 col-sm-8 col-md-4">
          <div class="head-counter-bx text-center">
            <i class="ti-home" style="color: blue;"></i>
            <h3 class="m-b5 counter"><span class="counter">
              <asp:Label ID="LabelNoTutors" runat="server" Text="0"></asp:Label></span></h3>
            <p>Amazing HO</p>
          </div>
        </div>

        <!-- Single Cool Fact-->
        <div class="col-16 col-sm-8 col-md-4">
          <div class="head-counter-bx text-center">
            <i class="ti-user" style="color: blue;"></i>
            <h3 class="m-b5 counter"><span class="counter">
              <asp:Label ID="LabelNoStudents" runat="server" Text="0"></asp:Label></span></h3>
            <p>Total HKs</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
