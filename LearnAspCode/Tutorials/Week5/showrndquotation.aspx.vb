﻿Public Class showrndquotation
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Label1.Text = "welcome " & Session("username")
	End Sub

End Class