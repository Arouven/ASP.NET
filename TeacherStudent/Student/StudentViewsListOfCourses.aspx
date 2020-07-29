<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="StudentViewsListOfCourses.aspx.vb" Inherits="TeacherStudent.StudentViewsListOfCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



	<asp:GridView ID="gvCatNames" DataKeyNames="CourseId" AutoGenerateColumns="false" Width="500" runat="server">
		<%--OnSelectedIndexChanged="gvCatNames_SelectedIndexChanged"--%>
		<HeaderStyle BackColor="#9a9a9a" ForeColor="White" Font-Bold="true" Height="30" />
		<AlternatingRowStyle BackColor="#f5f5f5" />
		<Columns>
			<asp:TemplateField>
				<ItemTemplate>
					<asp:LinkButton ID="LinkButtonSelect" runat="server" CommandName="Select" Text="Select" />
				</ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Category Name">
				<ItemTemplate>
					<!-- display the category name -->
					<asp:Label ID="lblCatName" Text='<%#Eval("CourseName")%>' runat="server" />
				</ItemTemplate>
			</asp:TemplateField>
		</Columns>
	</asp:GridView>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder1" runat="server">
</asp:Content>
