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
    Public Sub getStudentStatsPerCourse(studentId As String, courseId As String)
        Dim pending As Boolean = 0
        Dim subscribe As Boolean = 0
        Dim accept As Boolean = 0

        Dim cs As String = ConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
        Dim con As SqlClient.SqlConnection = New SqlClient.SqlConnection(cs)
        Using (con)
            Dim cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand("ProcedureCheckStudStatsPerCourse", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New SqlClient.SqlParameter(parameterName:="@StudentId", value:=(studentId)))
            cmd.Parameters.Add(New SqlClient.SqlParameter(parameterName:="@CourseId", value:=(courseId)))
            con.Open()
            Dim dr As SqlClient.SqlDataReader
            dr = cmd.ExecuteReader
            While dr.Read
                pending = Convert.ToBoolean(dr("pending"))
                subscribe = Convert.ToBoolean(dr("subscribe"))
                accept = Convert.ToBoolean(dr("accepted"))

            End While
        End Using

        Dim o1 As ClassStudentStatsPerCourse = New ClassStudentStatsPerCourse()
        o1.CourseId1 = (courseId)
        o1.StudentId1 = (studentId)
        o1.Pending1 = pending
        o1.Subscribe1 = subscribe
        o1.Accept1 = accept

        Dim js As Script.Serialization.JavaScriptSerializer = New Script.Serialization.JavaScriptSerializer()
        Context.Response.Write(js.Serialize(o1))
    End Sub

End Class