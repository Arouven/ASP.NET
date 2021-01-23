Public Class ClassCategoryName
	Private CategoryName As String
	Private CategoryNameInUse As Boolean

	Public Property CategoryName1 As String
		Get
			Return CategoryName
		End Get
		Set(value As String)
			CategoryName = value
		End Set
	End Property

	Public Property CategoryNameInUse1 As Boolean
		Get
			Return CategoryNameInUse
		End Get
		Set(value As Boolean)
			CategoryNameInUse = value
		End Set
	End Property
End Class
