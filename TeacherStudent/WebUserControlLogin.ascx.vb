Public Class WebUserControlLogin
	Inherits System.Web.UI.UserControl

	Public Property Username() As String
		Get
			Return TextBoxUsernameLog.Text
		End Get
		Set(value As String)
			TextBoxUsernameLog.Text = value
		End Set
	End Property
	Public Property Password() As String
		Get
			Return TextBoxPasswordLog.Text
		End Get
		Set(value As String)
			TextBoxPasswordLog.Attributes("value") = value
		End Set
	End Property
	Public Property Remember() As Boolean
		Get
			Return RememberMe.Checked
		End Get
		Set(Value As Boolean)
			RememberMe.Checked = Value
		End Set
	End Property
	'Public Property Username() As String
	'	Get
	'		Return TextBoxUsernameLog.Text
	'	End Get
	'	Set(value As String)
	'		TextBoxUsernameLog.Text = value
	'	End Set
	'End Property


	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

End Class

