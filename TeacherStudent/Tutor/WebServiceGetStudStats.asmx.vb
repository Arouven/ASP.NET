Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()>
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")>
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ToolboxItem(False)>
Public Class WebServiceGetStudStats
	Inherits System.Web.Services.WebService

    <WebMethod()>
    Public Sub getStudentStats(courseId As String)
        Dim TotalStudentInCourse As Integer = 0
        Dim TotalStudentInCoursePending As Integer = 0
        Dim TotalStudentInCourseRejected As Integer = 0

        Dim cs As String = ConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
        Dim con As SqlClient.SqlConnection = New SqlClient.SqlConnection(cs)
        Using (con)
            Dim cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand("ProcedureCheckStudStats", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New SqlClient.SqlParameter(parameterName:="@CourseId", value:=Convert.ToInt32(courseId)))
            con.Open()
            Dim dr As SqlClient.SqlDataReader
            dr = cmd.ExecuteReader
            While dr.Read
                TotalStudentInCourse = Convert.ToInt32(dr("TotalStudentInCourse"))
                TotalStudentInCoursePending = Convert.ToInt32(dr("TotalStudentInCoursePending"))
                TotalStudentInCourseRejected = Convert.ToInt32(dr("TotalStudentInCourseRejected"))

            End While
        End Using

        Dim o1 As ClassStudentStats = New ClassStudentStats()
        o1.CourseId1 = Convert.ToInt32(courseId)
        o1.TotalStudentInCourse1 = TotalStudentInCourse
        o1.TotalStudentInCoursePending1 = TotalStudentInCoursePending
        o1.TotalStudentInCourseRejected1 = TotalStudentInCourseRejected

        Dim js As Script.Serialization.JavaScriptSerializer = New Script.Serialization.JavaScriptSerializer()
        Context.Response.Write(js.Serialize(o1))
    End Sub
End Class