Public Class ClassUserName
	Private UserName As String
	Private UserNameInUse As Boolean

	Public Property UserName1 As String
		Get
			Return UserName
		End Get
		Set(value As String)
			UserName = value
		End Set
	End Property

	Public Property UserNameInUse1 As Boolean
		Get
			Return UserNameInUse
		End Get
		Set(value As Boolean)
			UserNameInUse = value
		End Set
	End Property
End Class

