﻿Public Class Task11
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		TextBox1.Attributes.Add("onblur", "document.getElementById('TextBox2').value = document.getElementById('TextBox1').value")
	End Sub

End Class