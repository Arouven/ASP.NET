﻿Public Class SettingFocusAndUsingAutoCompleteWithTheTextBoxControl
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		txtFirstName.Focus()
	End Sub

End Class