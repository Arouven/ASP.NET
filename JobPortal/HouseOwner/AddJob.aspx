<%@ Page Title="Insert a job" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="AddJob.aspx.vb" Inherits="JP.AddJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
    @font-face {
      font-family: 'Glyphicons Halflings';
      src: url('../fonts/glyphicons-halflings-regular.eot');
      src: url('../fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'), url('../fonts/glyphicons-halflings-regular.woff2') format('woff2'), url('../fonts/glyphicons-halflings-regular.woff') format('woff'), url('../fonts/glyphicons-halflings-regular.ttf') format('truetype'), url('../fonts/glyphicons-halflings-regular.svg#glyphicons_halflingsregular') format('svg');
    }

    .glyphicon {
      position: relative;
      top: 1px;
      display: inline-block;
      font-family: 'Glyphicons Halflings';
      font-style: normal;
      font-weight: normal;
      line-height: 1;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
    }

    .glyphicon-minus:before {
      content: "\2212";
    }


    .glyphicon-plus:before {
      content: "\002b";
    }


    .myLable {
      font-weight: bold;
    }

    .mycheckbox input[type="checkbox"] {
      margin-right: 8px;
    }

    label.error, span.error {
      color: red;
    }
  </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="breadcumb-area bg-img">
    <div class="bradcumbContent">
      <h2 style="text-align:center;">Add New job</h2>
    </div>
  </div>
  <asp:HiddenField ID="HiddenFieldCourseId" runat="server" />
  <asp:HiddenField ID="HiddenFieldTutorId" runat="server" />
  <div class="section-padding-100-0">
    <div id="addcourse" class="form" style="width: 80%; margin: auto;">
      <div class="row form-group">
        <label for="inputEmail3" class="col-sm-3 col-form-label myLable">Title : </label>
        <div class="col-sm-9">
          <asp:TextBox ID="TextBoxCourseName" CssClass="form-control" runat="server" minlength="4" required></asp:TextBox>
          <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxCourseName" CssClass="text-danger" ValidationGroup="AddCourseGroup" ErrorMessage="The title field is required." />
        </div>
      </div>
      <div class="form-group row">
        <div class="col-sm-3">
          <label class="myLable">Job Category : </label>
        </div>
        <div class="col-sm-9">
          <asp:CheckBoxList ID="CheckBoxListCourseCategory" CssClass="mycheckbox" runat="server">
          </asp:CheckBoxList>
          <span id="errorToShow" style="position: absolute;">
            <asp:Label ID="Label1" runat="server" CssClass="error"></asp:Label></span>
          <br />
        </div>
      </div>
      <div class="row form-group">
        <label class="col-sm-3 myLable">Deadline Date : </label>
        <div class="col-sm-9">
          <asp:TextBox runat="server" ID="TextBoxScheduleDate" TextMode="DateTimeLocal" CssClass="form-control" required></asp:TextBox>
          <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxScheduleDate" CssClass="text-danger" ValidationGroup="AddCourseGroup" ErrorMessage="Pick a date." />
        </div>
      </div>
    <%--  <div class="row form-group">
        <label class="col-sm-3 myLable">Posted Date : </label>
        <div class="col-sm-9">
          <asp:TextBox runat="server" ID="TextBoxCreatedDate" ReadOnly="true" Enabled="false" CssClass="form-control"></asp:TextBox>
        </div>
      </div>--%>
      <div class="row form-group">
        <label class="col-sm-3 col-form-label myLable">Description : </label>
        <div class="col-sm-9">
          <asp:TextBox ID="TextBoxCourseDescription" CssClass="form-control" runat="server" Style="height: 100px" minlengty="5" required></asp:TextBox>
          <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxCourseDescription" CssClass="text-danger" ValidationGroup="AddCourseGroup" ErrorMessage="The Description field is required." />
        </div>
      </div>
      <div class="row form-group">
        <label class="col-sm-3 col-form-label myLable">Salary : </label>
        <div class="col-sm-9">
          <asp:TextBox ID="TextBoxSalary" CssClass="form-control" runat="server" required></asp:TextBox>
          <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxSalary" CssClass="text-danger" ValidationGroup="AddCourseGroup" ErrorMessage="The Salary field is required." />
        </div>
      </div>
      <div class="row form-group">
        <label class="col-sm-3 col-form-label myLable">Location : </label>
        <div class="col-sm-9">
          <select runat="server" id="ddl0" name="ddl0" class="form-control required"></select>
        </div>
      </div>
     <%-- <div class="row form-group">
        <label class="col-sm-3 col-form-label myLable">Vacant : </label>
        <div class="col-sm-9">
          <asp:CheckBox ID="CheckBoxvacant" runat="server" />
        </div>
      </div>--%>


      <div class="row form-group">

        <asp:Button CssClass="btn btn-primary col-sm-4" OnClick="LinkButtonAdd_Click" ID="btnSubmit" Text="Add Job" runat="server" ValidationGroup="AddCourseGroup" />
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
  <script src='<%= ResolveClientUrl("~/plugins/jqueryvalidation/jquery.validate.min.js") %>'></script>
  <script src='<%= ResolveClientUrl("~/plugins/jqueryvalidation/additional-methods.min.js") %>'></script>
  <script>

    var validator = $('#myform').validate({


    });
 
    $(`<%=ddl0.ClientID%>`).rules('add', {
      required: true,
      messages: {
        required: "Please Select a Location"
      }
    });
	</script>
</asp:Content>
