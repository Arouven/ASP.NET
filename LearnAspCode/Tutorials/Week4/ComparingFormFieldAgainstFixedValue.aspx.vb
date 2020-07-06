Public Class ComparingFormFieldAgainstFixedValue
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		cmpDate.ValueToCompare = DateTime.Now.ToString("d")
	End Sub

End Class