Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()>
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class WebServiceGetHKStats
  Inherits System.Web.Services.WebService

  <WebMethod()>
  Public Sub getHKStats(jobId As String)
    Dim TotalHKInJob As Integer = 0
    Dim TotalHKInJobPending As Integer = 0
    Dim TotalHKInJobRejected As Integer = 0

    Dim cs As String = ConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
    Dim con As SqlClient.SqlConnection = New SqlClient.SqlConnection(cs)
    Using (con)
      Dim cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand("ProcedureCheckHKStats", con)
      cmd.CommandType = CommandType.StoredProcedure
      cmd.Parameters.Add(New SqlClient.SqlParameter(parameterName:="@JobId", value:=Convert.ToInt32(jobId)))
      con.Open()
      Dim dr As SqlClient.SqlDataReader
      dr = cmd.ExecuteReader
      While dr.Read
        TotalHKInJob = Convert.ToInt32(dr("TotalHKInJob"))
        TotalHKInJobPending = Convert.ToInt32(dr("TotalHKInJobPending"))
        TotalHKInJobRejected = Convert.ToInt32(dr("TotalHKInJobRejected"))
      End While
    End Using

    Dim o1 As ClassHKStats = New ClassHKStats()
    o1.JobId1 = Convert.ToInt32(jobId)
    o1.TotalHKInJob1 = TotalHKInJob
    o1.TotalHKInJobPending1 = TotalHKInJobPending
    o1.TotalHKInJobRejected1 = TotalHKInJobRejected

    Dim js As Script.Serialization.JavaScriptSerializer = New Script.Serialization.JavaScriptSerializer()
    Context.Response.Write(js.Serialize(o1))
  End Sub
End Class