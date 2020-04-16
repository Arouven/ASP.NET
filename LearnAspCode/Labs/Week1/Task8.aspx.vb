Public Class Task8
	Inherits System.Web.UI.Page

	Private Shared mytextbox As String

	Private Sub updater(ByRef myinput As String)
		mytextbox = mytextbox + myinput
		TextBox1.Text = mytextbox
	End Sub

	Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
		updater(Button1.Text)
	End Sub

	Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
		updater(Button2.Text)
	End Sub

	Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
		updater(Button3.Text)
	End Sub

	Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
		updater(Button4.Text)
	End Sub

	Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
		updater(Button5.Text)
	End Sub

	Protected Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
		updater(Button6.Text)
	End Sub

	Protected Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
		updater(Button7.Text)
	End Sub

	Protected Sub Button8_Click(sender As Object, e As EventArgs) Handles Button8.Click
		updater(Button8.Text)
	End Sub

	Protected Sub Button9_Click(sender As Object, e As EventArgs) Handles Button9.Click
		updater(Button9.Text)
	End Sub

	Protected Sub Button10_Click(sender As Object, e As EventArgs) Handles Button10.Click
		updater(Button10.Text)
	End Sub

	Protected Sub Button11_Click(sender As Object, e As EventArgs) Handles Button11.Click
		updater(Button11.Text)
	End Sub

	Protected Sub Button12_Click(sender As Object, e As EventArgs) Handles Button12.Click
		updater(Button12.Text)
	End Sub

	Protected Sub Button13_Click(sender As Object, e As EventArgs) Handles Button13.Click
		updater(Button13.Text)
	End Sub

	Protected Sub Button14_Click(sender As Object, e As EventArgs) Handles Button14.Click
		updater(Button14.Text)
	End Sub

	Protected Sub Button15_Click(sender As Object, e As EventArgs) Handles Button15.Click
		updater(Button15.Text)
	End Sub

	Protected Sub Button16_Click(sender As Object, e As EventArgs) Handles Button16.Click
		Try
			Dim equation As String = mytextbox.Replace("X", "*")
			Dim result = New DataTable().Compute(equation, Nothing)
			mytextbox = result.ToString
			TextBox1.Text = CStr(Math.Round(CDbl(mytextbox), 2))
		Catch ex As Exception
			mytextbox = ""
			TextBox1.Text = CStr("Exception occur")
		End Try
	End Sub
End Class