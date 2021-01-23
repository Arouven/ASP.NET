Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()>
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class WebServiceStatus
  Inherits System.Web.Services.WebService

  <WebMethod()>
  Public Sub getHKStatsPerJob(HKId As String, JobId As String)
    Dim pending As Boolean = 0
    Dim applied As Boolean = 0
    Dim accept As Boolean = 0

    Dim cs As String = ConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
    Dim con As SqlClient.SqlConnection = New SqlClient.SqlConnection(cs)
    Using (con)
      Dim cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand("ProcedureCheckHKStatsPerJob", con)
      cmd.CommandType = CommandType.StoredProcedure
      cmd.Parameters.Add(New SqlClient.SqlParameter(parameterName:="@HKId", value:=(HKId)))
      cmd.Parameters.Add(New SqlClient.SqlParameter(parameterName:="@JobId", value:=(JobId)))
      con.Open()
      Dim dr As SqlClient.SqlDataReader
      dr = cmd.ExecuteReader
      While dr.Read
        pending = Convert.ToBoolean(dr("pending"))
        applied = Convert.ToBoolean(dr("applied"))
        accept = Convert.ToBoolean(dr("accepted"))
      End While
    End Using

    Dim o1 As ClassHKStatsPerJob = New ClassHKStatsPerJob()
    o1.JobId1 = (JobId)
    o1.HKId1 = (HKId)
    o1.Pending1 = pending
    o1.Applied1 = applied
    o1.Accept1 = accept

    Dim js As Script.Serialization.JavaScriptSerializer = New Script.Serialization.JavaScriptSerializer()
    Context.Response.Write(js.Serialize(o1))
  End Sub

End Class