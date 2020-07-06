Public Class DetectingWhichRadioButtonControlHasBeenChecked
	Inherits System.Web.UI.Page


	Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)
		If rdlMagazine.Checked Then
			lblResult.Text = rdlMagazine.Text
		End If
		If rdlTelevision.Checked Then
			lblResult.Text = rdlTelevision.Text
		End If
		If rdlOther.Checked Then
			lblResult.Text = rdlOther.Text
		End If
	End Sub


End Class