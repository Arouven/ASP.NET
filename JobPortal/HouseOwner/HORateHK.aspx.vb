Public Class HORateHK
  Inherits System.Web.UI.Page
  Dim HOid As Int16
  Dim HKId As Integer
  Private ReadOnly _conString As String
  Public Sub New()
    _conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
  End Sub
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    If Not IsNothing(Session("HOId")) Then
      HOid = Session("HOId")
      HKId = Convert.ToInt32(Request.QueryString("HKId"))
      LabelHKName.Text = GetNameHK(HKId)
    Else Response.Redirect("~/HouseOwner/HOLogin.aspx")
    End If
  End Sub
  Private Function GetNameHK(HKId As Integer)
    Dim con As New SqlClient.SqlConnection(_conString)
    Dim cmd As New SqlClient.SqlCommand()
    Dim cname As String = ""
    cmd.Connection = con
    cmd.CommandType = CommandType.Text
    cmd.CommandText = "SELECT Username FROM HouseKeeperTable WHERE HKId=@HKid;"
    cmd.Parameters.AddWithValue("@HKid", HKId)
    Dim reader As SqlClient.SqlDataReader
    con.Open()
    reader = cmd.ExecuteReader()
    While reader.Read
      cname = reader("Username")
    End While
    reader.Close()
    con.Close()
    Return cname
  End Function
  Protected Sub ButtonRate_Click(sender As Object, e As EventArgs)
    Dim Rating As Integer = Convert.ToInt32(textBoxPhoneNumber.Text)
    Dim Jobid As Integer = Convert.ToInt32(Convert.ToInt32(Request.QueryString("JobId")))
    Dim con As New SqlClient.SqlConnection(_conString)
    Dim cmd As New SqlClient.SqlCommand()
    cmd.Connection = con
    con.Open()
    cmd.CommandType = CommandType.Text
    cmd.CommandText = "update HKJobAssociativeTable set 
Rating=@Rating
where HKId=@HKId and JobId=@JobId;"
    cmd.Parameters.AddWithValue("@Rating", Rating)
    cmd.Parameters.AddWithValue("@HKId", HKId)
    cmd.Parameters.AddWithValue("@JobId", Jobid)
    cmd.ExecuteNonQuery()
    con.Close()
    Response.Redirect("~/HouseOwner/HKHome")
  End Sub
End Class