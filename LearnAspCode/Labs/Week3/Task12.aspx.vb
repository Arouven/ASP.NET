Public Class Task12
	Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim date1 As String = TextBox3.Text
        Dim date2 As String = TextBox3.Text

        If date1 = DateTime.Now Or date2 = DateTime.Now Then
            Label5.Text = "Step 2 - Neither Date cannot be todays date"
        ElseIf date1 < DateTime.Now Or date2 < DateTime.Now Then
            Label5.Text = "Step 2 - Neither Date cannot be in the past"
        ElseIf date1 > date2 Then
            Label5.Text = "Step 2 - Departure Date cannot be after Return Date"
        ElseIf date2 > date1 Then
            Label5.Text = "Step 2 - Departure Date cannot be after Return Date"
        Else
            MultiView1.ActiveViewIndex = 2
            Label8.Text = "Number of Adults " & TextBox1.Text
            Label9.Text = "Number of Children " & TextBox2.Text
            Label10.Text = "Date of Departure " & TextBox3.Text
            Label11.Text = "Date of Return " & TextBox4.Text
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If TextBox1.Text.Length = 0 Or TextBox2.Text.Length = 0 Then
            Label2.Text = "Step 1 - Number of adult or Number of child cannot be empty "
            MultiView1.ActiveViewIndex = 0
        Else
            MultiView1.ActiveViewIndex = 1
        End If
    End Sub

End Class