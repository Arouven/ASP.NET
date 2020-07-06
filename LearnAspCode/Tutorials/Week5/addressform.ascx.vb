Public Class addressform
	Inherits System.Web.UI.UserControl


	Public Property Street() As String
		Get
			Return txtStreet.Text
		End Get
		Set(ByVal Value As String)
			txtStreet.Text = Value
		End Set
	End Property
	Public Property City() As String
		Get
			Return txtCity.Text
		End Get
		Set(ByVal Value As String)
			txtCity.Text = Value
		End Set
	End Property
	Public Property State() As String
		Get
			Return txtState.Text
		End Get
		Set(ByVal Value As String)
			txtState.Text = Value
		End Set
	End Property
	Public Property PostCode() As String
		Get
			Return txtPostalCode.Text
		End Get
		Set(ByVal Value As String)
			txtPostalCode.Text = Value
		End Set
	End Property

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

End Class