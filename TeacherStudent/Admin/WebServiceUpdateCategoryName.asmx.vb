Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Script.Serialization


' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()>
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")>
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ToolboxItem(False)>
Public Class WebServiceUpdateCategoryName
	Inherits System.Web.Services.WebService

    <WebMethod()>
    Public Sub CategoryNameExists(categoryName As String)
        Dim categoryNameInUse As Boolean = False

        Dim cs As String = ConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(cs)
        Using (con)
            Dim cmd As SqlCommand = New SqlCommand("ProcedureCategoryNameExists", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New SqlParameter(parameterName:="@CategoryName", value:=categoryName))
            con.Open()
            categoryNameInUse = Convert.ToBoolean(cmd.ExecuteScalar())
        End Using

        Dim o1 As ClassUpdateCategoryName = New ClassUpdateCategoryName()
        o1.CategoryName1 = categoryName
        o1.CategoryNameInUse1 = categoryNameInUse

        Dim js As JavaScriptSerializer = New JavaScriptSerializer()
        Context.Response.Write(js.Serialize(o1))
    End Sub

End Class