Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel
Imports System.Data.SqlClient
Imports System.Web.Script.Serialization

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()>
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class WebServiceLocation
  Inherits System.Web.Services.WebService

  <WebMethod()>
  Public Sub LocationNameExists(locationName As String)
    Dim locationNameInUse As Boolean = False

    Dim cs As String = ConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
    Dim con As SqlConnection = New SqlConnection(cs)
    Using (con)
      Dim cmd As SqlCommand = New SqlCommand("ProcedureLocationNameExists", con)
      cmd.CommandType = CommandType.StoredProcedure
      cmd.Parameters.Add(New SqlParameter(parameterName:="@LocationName", value:=locationName))
      con.Open()
      locationNameInUse = Convert.ToBoolean(cmd.ExecuteScalar())
    End Using

    Dim o1 As ClassLocationName = New ClassLocationName()
    o1.LocationName1 = locationName
    o1.LocationNameInUse1 = locationNameInUse

    Dim js As JavaScriptSerializer = New JavaScriptSerializer()
    Context.Response.Write(js.Serialize(o1))
  End Sub

End Class