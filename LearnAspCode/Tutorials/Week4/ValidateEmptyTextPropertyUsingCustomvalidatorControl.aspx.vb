Public Class ValidateEmptyTextPropertyUsingCustomvalidatorControl
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Sub valProductCode_ServerValidate(ByVal source As Object, ByVal args As ServerValidateEventArgs)
		If args.Value.Length = 4 Then
			args.IsValid = True
		Else
			args.IsValid = False
		End If
	End Sub

End Class