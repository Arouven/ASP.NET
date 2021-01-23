Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()>
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")>
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ToolboxItem(False)>
Public Class WebServiceUserNameExist
  Inherits System.Web.Services.WebService

  <WebMethod()>
  Public Sub UserNameExists(userName As String)
    Dim userNameInUse As Boolean = False

    Dim cs As String = ConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
    Dim con As SqlClient.SqlConnection = New SqlClient.SqlConnection(cs)
    Using (con)
      Dim cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand("ProcedureUserNameExists", con)
      cmd.CommandType = CommandType.StoredProcedure
      cmd.Parameters.Add(New SqlClient.SqlParameter(parameterName:="@UserName", value:=userName))
      con.Open()
      userNameInUse = Convert.ToBoolean(cmd.ExecuteScalar())
    End Using

    Dim o1 As ClassUserName = New ClassUserName()
    o1.userName1 = userName
    o1.UserNameInUse1 = userNameInUse

    Dim js As Script.Serialization.JavaScriptSerializer = New Script.Serialization.JavaScriptSerializer()
    Context.Response.Write(js.Serialize(o1))
  End Sub

End Class