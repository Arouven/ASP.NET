Public Class Task111
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub
    Private Sub Calendar1_DayRender(sender As Object, e As DayRenderEventArgs) Handles Calendar1.DayRender
        If (e.Day.IsToday) Then
            e.Cell.BackColor = System.Drawing.Color.Yellow
        ElseIf (e.Day.IsWeekend) Then
            e.Cell.BackColor = System.Drawing.Color.Green
        ElseIf (e.Day.IsSelected) Then
            e.Cell.BackColor = System.Drawing.Color.Orange
        Else
            e.Cell.BackColor = System.Drawing.Color.Blue
        End If
    End Sub

End Class