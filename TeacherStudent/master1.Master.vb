

Public Class master1
	Inherits System.Web.UI.MasterPage





	Private ReadOnly _conString As String
	Public Sub New()
		_conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("TeacherStudentDBConnectionString").ConnectionString
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


		If Session("StudentUsername") = Nothing Or Session("TutorUsername") = Nothing Or Session("AdminUsername") = Nothing Then
			btnlogout.Style.Add("display", "none")
			pnlmanage.Visible = True
			Adminlinknav.Style.Add("display", "none")
			tutorlinknav.Style.Add("display", "none")
			studentlinknav.Style.Add("display", "none")
			guestlinknav.Style.Add("display", "block")
		End If



		If (Not IsNothing(Session("StudentUsername"))) Then
			btnlogout.Style.Add("display", "block")
			pnlmanage.Visible = False
			Adminlinknav.Style.Add("display", "none")
			tutorlinknav.Style.Add("display", "none")
			studentlinknav.Style.Add("display", "block")
			guestlinknav.Style.Add("display", "none")
		End If
		If (Not IsNothing(Session("TutorUsername"))) Then
			btnlogout.Style.Add("display", "block")
			pnlmanage.Visible = False
			Adminlinknav.Style.Add("display", "none")
			tutorlinknav.Style.Add("display", "block")
			studentlinknav.Style.Add("display", "none")
			guestlinknav.Style.Add("display", "none")
		End If
		If (Not IsNothing(Session("AdminUsername"))) Then
			btnlogout.Style.Add("display", "block")
			pnlmanage.Visible = False
			Adminlinknav.Style.Add("display", "block")
			tutorlinknav.Style.Add("display", "none")
			studentlinknav.Style.Add("display", "none")
			guestlinknav.Style.Add("display", "none")
		End If





	End Sub
	Protected Sub btnlgout_Click(sender As Object, e As EventArgs)
		lgout()
	End Sub
	Private Sub lgout()
		If (Not IsNothing(Session("StudentUsername")) Or Not IsNothing(Session("TutorUsername")) Or Not IsNothing(Session("AdminUsername"))) Then
			'Remove all session
			Session.RemoveAll()
			'Destroy all Session objects
			Session.Abandon()
			'Redirect to homepage or login page
			Response.Redirect("~/Home.aspx")
		End If
	End Sub

End Class


