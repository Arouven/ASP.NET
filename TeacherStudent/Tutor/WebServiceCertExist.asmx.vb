Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()>
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")>
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ToolboxItem(False)>
Public Class WebServiceCertExist
    Inherits System.Web.Services.WebService

    <WebMethod()>
    Public Sub CertExist(CertificationName As String, TutorId As String)
        Dim certificateNameInUse As Boolean = False

        Dim cs As String = ConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
        Dim con As SqlClient.SqlConnection = New SqlClient.SqlConnection(cs)
        Using (con)
            Dim cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand("ProcedureCertNameExists", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New SqlClient.SqlParameter(parameterName:="@TutorId", value:=TutorId))
            cmd.Parameters.Add(New SqlClient.SqlParameter(parameterName:="@CertificationName", value:=CertificationName))
            con.Open()
            certificateNameInUse = Convert.ToBoolean(cmd.ExecuteScalar())
        End Using

        Dim o1 As ClassCertName = New ClassCertName()
        o1.TutorId1 = Convert.ToInt32(TutorId)
        o1.CertificationName1 = CertificationName
        o1.CertificateNameInUse1 = certificateNameInUse

        Dim js As Script.Serialization.JavaScriptSerializer = New Script.Serialization.JavaScriptSerializer()
        Context.Response.Write(js.Serialize(o1))
    End Sub
End Class