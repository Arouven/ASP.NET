Public Class ShowCustomValidatorWithJavaScript
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Protected Sub valComments_ServerValidate(ByVal source As Object, ByVal args As ServerValidateEventArgs)
		If args.Value.Length > 10 Then
			args.IsValid = False
		Else
			args.IsValid = True
		End If
	End Sub

End Class