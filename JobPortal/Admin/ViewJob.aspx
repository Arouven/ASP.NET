<%@ Page Title="Job Details" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="ViewJob.aspx.vb" Inherits="JP.ViewJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
    @font-face {
      font-family: "Glyphicons Halflings";
      src: url("../fonts/glyphicons-halflings-regular.eot");
      src: url("../fonts/glyphicons-halflings-regular.eot?#iefix") format("embedded-opentype"), url("../fonts/glyphicons-halflings-regular.woff2") format("woff2"), url("../fonts/glyphicons-halflings-regular.woff") format("woff"), url("../fonts/glyphicons-halflings-regular.ttf") format("truetype"), url("../fonts/glyphicons-halflings-regular.svg#glyphicons_halflingsregular") format("svg");
    }

    .glyphicon {
      position: relative;
      top: 1px;
      display: inline-block;
      font-family: "Glyphicons Halflings";
      font-style: normal;
      font-weight: 400;
      line-height: 1;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
    }

    .glyphicon-wrench:before {
      content: "\e136";
    }

    .glyphicon-upload:before {
      content: "\e027";
    }

    .glyphicon-trash:before {
      content: "\e020";
    }

    .glyphicon-download:before {
      content: "\e026";
    }

    .glyphicon-edit:before {
      content: "\e065";
    }

    .glyphicon-plus:before {
      content: "\002b";
    }

    .glyphicon-eye-open:before {
      content: "\e105";
    }

    .tbldiv {
      margin: auto;
      width: 100%;
    }

    th {
      background: #4CAF50;
      color: White;
    }

    label {
      font-weight: bold;
    }

    .btnsize {
      width: 160px !important;
    }



    .goGreen h4 {
      text-align: center;
      color: #4CAF50;
    }

    .modal-dialog {
      max-width: 80% !important;
      margin: auto;
    }

    .modal-dialog-center {
      margin-top: 5%;
    }

    label.error, span.error {
      color: red;
    }

    .glyphicon-minus:before {
      content: "\2212";
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div class="form">
    <div class="breadcumb-area bg-img">
      <div class="bradcumbContent">
        <h2>Viewing Jobs</h2>
      </div>
    </div>
    <asp:HiddenField ID="HiddenFieldCourseId" runat="server" />
    <asp:HiddenField ID="HiddenFieldTutorId" runat="server" />
    <div class="section-padding-100-0">
      <div class="text-center" style="margin: auto;">
        <h2>
          <asp:Label ID="LabelTitle" runat="server"></asp:Label>
          by
          <asp:Label ID="LabelUser" runat="server"></asp:Label></h2>
        <br />
        <br />
      </div>
      <div style="width: 80%; margin: auto;">
        <div class="row form-group">
          <div class="col-sm-3"></div>
          <label class="col-sm-3 ">Title : </label>
          <div class="col-sm-4">
            <asp:Label ID="LabelCourseName" runat="server"></asp:Label>
          </div>
        </div>
        <div class="row form-group">
          <div class="col-sm-3"></div>
          <label class="col-sm-3 ">Salary : </label>
          <div class="col-sm-4">
            <asp:Label ID="LabelSalary" runat="server"></asp:Label>
          </div>
        </div>
        <div class="row form-group">
          <div class="col-sm-3"></div>
          <label class="col-sm-3 ">Description : </label>
          <div class="col-sm-4">
            <asp:Label ID="LabelDescription" runat="server"></asp:Label>
          </div>
        </div>
        <div class="row form-group">
          <div class="col-sm-3"></div>
          <label class="col-sm-3 ">Date Posted : </label>
          <div class="col-sm-4">
            <asp:Label ID="LabelDatePosted" runat="server"></asp:Label>
          </div>
        </div>
        <div class="row form-group">
          <div class="col-sm-3"></div>
          <label class="col-sm-3">Deadline : </label>
          <div class="col-sm-4">
            <asp:Label ID="LabelDatedead" runat="server"></asp:Label>
          </div>
        </div>
        <div class="row form-group">
          <div class="col-sm-3"></div>
          <label class="col-sm-3 col-form-label">Location : </label>
          <div class="col-sm-4">
            <asp:Label ID="LabelLocation" runat="server"></asp:Label>
          </div>
        </div>
        <div class="row form-group">
          <div class="col-sm-3"></div>
          <label class="col-sm-3 col-form-label">Category Name : </label>
          <div class="col-sm-4">
            <asp:Label ID="LabelCategoryName" runat="server"></asp:Label>
          </div>
        </div>
        <br />
        <asp:LinkButton ID="btnDelete" CssClass="btn btn-danger" runat="server" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete?');"  Text="Delete" ToolTip="Delete Job"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
        <br />
        <br />

      </div>
    </div>
  </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
  <%--	<script src='<%= ResolveClientUrl("~/plugins/jqueryvalidation/jquery.validate.js") %>'></script>
	<script src='<%= ResolveClientUrl("~/plugins/jqueryvalidation/additional-methods.js") %>'></script>--%>
</asp:Content>
