﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="IsPostBack.aspx.vb" Inherits="LearnAspCode.IsPostBack1" %>

<!DOCTYPE html>

<script runat="server">
    Sub Page_Load()
        If Not Page.IsPostBack Then
            ' Create collection of items
            Dim items As New ArrayList()
            items.Add("Apples")
            items.Add("Oranges")
            ' Bind to DropDownList
            DropDownList1.DataSource = items
            DropDownList1.DataBind()
        End If
    End Sub
    Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
        Label1.Text = DropDownList1.SelectedItem.Text
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show IsPostBack</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList
                ID="DropDownList1"
                runat="server" />
            <asp:Button
                ID="Button1"
                Text="Select"
                OnClick="Button1_Click"
                runat="server" />
            <br />
            <br />
            You selected:
            <asp:Label
                ID="Label1"
                runat="server" />
        </div>
    </form>
</body>
</html>