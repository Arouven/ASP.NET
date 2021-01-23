Public Class ViewJob1
  Inherits System.Web.UI.Page
	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
	End Sub
	Dim jobid As Integer

	Private Sub showCourseDetails()
		Dim con As New SqlClient.SqlConnection(_conString)
		Dim cmd As New SqlClient.SqlCommand()
		cmd.Connection = con
		cmd.CommandType = CommandType.Text

		cmd.CommandText = "select distinct
jobtable.JobId,
jobtable.Title,
jobtable.Salary,
jobtable.[Description],
jobtable.DatePosted,
jobtable.DeadlineDate,
CategoryTable.CategoryName,
LocationTable.LocationName,
HouseOwnerTable.UserName,
jobtable.vacant
from jobtable
inner join  jobcategoryassociativetable on JobCategoryAssociativeTable.JobId=jobtable.JobId 
inner join CategoryTable on CategoryTable.CategoryId=jobcategoryassociativetable.CategoryId
inner join HouseOwnerTable on HouseOwnerTable.HOId=jobtable.HOId
inner join JobLocationAssociativeTable on JobLocationAssociativeTable.JobId=JobTable.JobId
inner join LocationTable on LocationTable.LocationId=JobLocationAssociativeTable.LocationId
where jobtable.jobId=@jobid;"
		cmd.Parameters.AddWithValue("@jobid", jobid)
		Dim reader As SqlClient.SqlDataReader
		con.Open()
		reader = cmd.ExecuteReader()
		Dim str As String = ""
		If reader.HasRows Then
			While reader.Read
				HiddenFieldCourseId.Value = reader(0)
				LabelTitle.Text = reader(1)
				LabelSalary.Text = reader(2)
				LabelDescription.Text = reader(3)
				LabelCourseName.Text = LabelTitle.Text
				LabelDatePosted.Text = reader(4)
				LabelDatedead.Text = reader(5)
				str += ", " & reader(6).ToString
				LabelLocation.Text = reader(7)
				CheckBoxvacant.Checked = reader(9)
			End While
		End If
		str = str.Remove(0, 2)
		LabelCategoryName.Text = str
		reader.Close()
		con.Close()
	End Sub


	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsNothing(Session("HOId")) Then
			jobid = Request.QueryString("id")
			showCourseDetails()
		Else Response.Redirect("~/HouseOwner/HOLogin.aspx")
		End If
	End Sub



	Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
		Dim courseid As Integer = Request.QueryString("id")
		Response.Redirect("~/HouseOwner/UpdateJob.aspx?id=" & courseid)
	End Sub
End Class