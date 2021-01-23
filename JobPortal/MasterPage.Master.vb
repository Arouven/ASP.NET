Public Class MasterPage
  Inherits System.Web.UI.MasterPage




  Private ReadOnly _conString As String
  Public Sub New()
    _conString = Web.Configuration.WebConfigurationManager.ConnectionStrings("HOHKDBConnectionString").ConnectionString
  End Sub

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    If Session("HKUsername") = Nothing Or Session("HOUsername") = Nothing Or Session("AdminUsername") = Nothing Then
      btnlogout.Style.Add("display", "none")
      pnlmanage.Visible = True
      Adminlinknav.Style.Add("display", "none")
      tutorlinknav.Style.Add("display", "none")
      studentlinknav.Style.Add("display", "none")
      guestlinknav.Style.Remove("display")
    End If



    If (Not IsNothing(Session("HKUsername"))) Then
      btnlogout.Style.Remove("display")
      pnlmanage.Visible = False
      Adminlinknav.Style.Add("display", "none")
      tutorlinknav.Style.Add("display", "none")
      studentlinknav.Style.Remove("display")
      guestlinknav.Style.Add("display", "none")
    End If
    If (Not IsNothing(Session("HOUsername"))) Then
      btnlogout.Style.Add("display", "block")
      pnlmanage.Visible = False
      Adminlinknav.Style.Add("display", "none")
      tutorlinknav.Style.Remove("display")
      studentlinknav.Style.Add("display", "none")
      guestlinknav.Style.Add("display", "none")
    End If
    If (Not IsNothing(Session("AdminUsername"))) Then
      btnlogout.Style.Remove("display")
      pnlmanage.Visible = False
      Adminlinknav.Style.Remove("display")
      tutorlinknav.Style.Add("display", "none")
      studentlinknav.Style.Add("display", "none")
      guestlinknav.Style.Add("display", "none")
    End If
  End Sub
  Protected Sub btnlgout_Click(sender As Object, e As EventArgs)
    lgout()
  End Sub
  Private Sub lgout()
    If (Not IsNothing(Session("HKUsername")) Or Not IsNothing(Session("HOUsername")) Or Not IsNothing(Session("AdminUsername"))) Then
      Session.RemoveAll()
      Session.Abandon()
      Response.Redirect("~/index.aspx")
    End If
  End Sub

End Class


