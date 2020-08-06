Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()>
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")>
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ToolboxItem(False)>
Public Class WebServiceMaterial
	Inherits System.Web.Services.WebService

    <WebMethod()>
    Public Sub MaterialNameExists(materialName As String)
        Dim materialNameInUse As Boolean = False

        Dim cs As String = ConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
        Dim con As SqlClient.SqlConnection = New SqlClient.SqlConnection(cs)
        Using (con)
            Dim cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand("ProcedureMaterialNameExists", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New SqlClient.SqlParameter(parameterName:="@MaterialName", value:=materialName))
            con.Open()
            materialNameInUse = Convert.ToBoolean(cmd.ExecuteScalar())
        End Using

        Dim o1 As ClassMaterialName = New ClassMaterialName()
        o1.MaterialName1 = materialName
        o1.MaterialNameInUse1 = materialNameInUse

        Dim js As Script.Serialization.JavaScriptSerializer = New Script.Serialization.JavaScriptSerializer()
        Context.Response.Write(js.Serialize(o1))
    End Sub

End Class