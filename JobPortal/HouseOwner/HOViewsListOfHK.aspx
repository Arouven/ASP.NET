<%@ Page Title="My Posted Jobs" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="HOViewsListOfHK.aspx.vb" Inherits="JP.HOViewsListOfHK" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
    .tbldiv {
      margin: auto;
      width: 90%;
    }

    th {
      background: #4CAF50;
      color: White;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="myCourses">
    <div class="breadcumb-area bg-img">
      <div class="bradcumbContent">
        <h2 style="text-align:center">All My Posted Jobs</h2>
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
                <p>Total HouseKeeper</p>
              </div>
            </div>
            <div class="col-16 col-sm-8 col-md-4">
              <div class="head-counter-bx text-center">
                <i class="ti-user" style="color: orange;"></i>
                <h3 class="m-b5 counter"><span class="counter">
                  <asp:Label ID="LabelTotalStudentPending" runat="server" Text="0"></asp:Label></span></h3>
                <p>HouseKeeper Pending</p>
              </div>
            </div>
            <div class="col-16 col-sm-8 col-md-4">
              <div class="head-counter-bx text-center">
                <i class="ti-user" style="color: red;"></i>
                <h3 class="m-b5 counter"><span class="counter">
                  <asp:Label ID="LabelTotalStudentRejected" runat="server" Text="0"></asp:Label></span></h3>
                <p>HouseKeeper Rejected</p>
              </div>
            </div>
          </div>


        </div>
        <br />
        <br />
        <br />
        <hr />




      </div>
    </div>
    <div class="form-group">
      <div class="tbldiv">
        <asp:GridView ID="gvs" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" OnPreRender="gvs_PreRender">

          <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" />
            <asp:BoundField DataField="DeadlineDate" HeaderText="Deadline Date" />
            <asp:TemplateField HeaderText="Views" ItemStyle-HorizontalAlign="Center">
              <ItemTemplate>
                <a href="#" runat="server">
                  <button class="btn btn-success" onclick='<%# String.Format("return OpenStats({0});return false;", Eval("JobID")) %>'>Statistics</button></a>
                &nbsp;&nbsp;
										
                <asp:LinkButton ID="btnStud" CommandArgument='<%#Eval("JobID") %>' OnClick="btnStud_Click" CssClass="btn btn-primary" runat="server" Text="HouseKeeper" ToolTip="List of HouseKeepers on this job"></asp:LinkButton>
              </ItemTemplate>
            </asp:TemplateField>
          </Columns>
        </asp:GridView>
      </div>
    </div>



    <div class="section-padding-100-0">
      <div class="col-12">
        <div class="col-12">
          <div class="academy-cool-facts-area mb-50">
            <div class="row" id="scrollhere">
              <!-- Single Cool Fact-->

              <div class="col-16 col-sm-8 col-md-4">
                <div class="head-counter-bx text-center">
                  <i class="ti-user" style="color: blue;"></i>
                  <h3 class="m-b5 counter"><span class="counter" id="totalStudent"></span></h3>
                  <p>Total HouseKeeper</p>
                </div>
              </div>
              <div class="col-16 col-sm-8 col-md-4">
                <div class="head-counter-bx text-center">
                  <i class="ti-user" style="color: orange;"></i>
                  <h3 class="m-b5 counter"><span class="counter" id="totalPendingStudent"></span></h3>
                  <p>HouseKeeper Pending</p>
                </div>
              </div>
              <div class="col-16 col-sm-8 col-md-4">
                <div class="head-counter-bx text-center">
                  <i class="ti-user" style="color: red;"></i>
                  <h3 class="m-b5 counter"><span class="counter" id="totalRejectedStudent"></span></h3>
                  <p>HouseKeeper Rejected</p>
                </div>
              </div>
            </div>


          </div>
          <br />
          <br />
          <br />
          <hr />


        </div>

      </div>
    </div>
  </div>
  <hr />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">

  <script>	

    (function ($) {
      "use strict";
      $(document).ready(function () {
        //init dataTables
        $('#gvs').dataTable({
          aoColumnDefs: [{ bSortable: false, aTargets: [-1] }],
          pageLength: 5
        });
      });
    }(jQuery));

    function OpenStats(JobId) {

      var JobId = parseInt(JobId);
      //   $('html,body').animate({
      //     scrollTop: $("#scrollhere").offset().top
      //   },'slow');
      $.ajax({
        url: 'WebServiceGetHKStats.asmx/getHKStats',
        method: 'post',
        data: { JobId: JobId },
        dataType: 'json',
        success: function (data) {
          var spanTotalStudentInCourse = $('#totalStudent');
          var spanTotalStudentInCoursePending = $('#totalPendingStudent');
          var spanTotalStudentInCourseRejected = $('#totalRejectedStudent');
          spanTotalStudentInCourse.text(data.TotalHKInJob1);
          spanTotalStudentInCoursePending.text(data.TotalHKInJobPending1);
          spanTotalStudentInCourseRejected.text(data.TotalHKInJobRejected1);
        },
        error: function (err) {
          alert(err);
        }
      });

    };



	</script>
</asp:Content>
