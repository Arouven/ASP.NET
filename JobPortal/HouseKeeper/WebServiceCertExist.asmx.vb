Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()>
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class WebServiceCertExist
  Inherits System.Web.Services.WebService

  <WebMethod()>
  Public Sub CertExist(CertificateName As String, HKId As String)
    Dim certificateNameInUse As Boolean = False

    Dim cs As String = ConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
    Dim con As SqlClient.SqlConnection = New SqlClient.SqlConnection(cs)
    Using (con)
      Dim cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand("ProcedureCertNameExists", con)
      cmd.CommandType = CommandType.StoredProcedure
      cmd.Parameters.Add(New SqlClient.SqlParameter(parameterName:="@HKId", value:=HKId))
      cmd.Parameters.Add(New SqlClient.SqlParameter(parameterName:="@CertificateName", value:=CertificateName))
      con.Open()
      certificateNameInUse = Convert.ToBoolean(cmd.ExecuteScalar())
    End Using

    Dim o1 As ClassCertName = New ClassCertName()
    o1.HKId1 = Convert.ToInt32(HKId)
    o1.CertificateName1 = CertificateName
    o1.CertificateNameInUse1 = certificateNameInUse

    Dim js As Script.Serialization.JavaScriptSerializer = New Script.Serialization.JavaScriptSerializer()
    Context.Response.Write(js.Serialize(o1))
  End Sub
End Class