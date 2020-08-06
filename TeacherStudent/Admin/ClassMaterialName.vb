Public Class ClassMaterialName
	Private MaterialName As String
	Private MaterialNameInUse As Boolean

	Public Property MaterialName1 As String
		Get
			Return MaterialName
		End Get
		Set(value As String)
			MaterialName = value
		End Set
	End Property

	Public Property MaterialNameInUse1 As Boolean
		Get
			Return MaterialNameInUse
		End Get
		Set(value As Boolean)
			MaterialNameInUse = value
		End Set
	End Property
End Class
