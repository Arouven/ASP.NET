Public Class ClassLocationName
  Private LocationName As String
  Private LocationNameInUse As Boolean

  Public Property LocationName1 As String
    Get
      Return LocationName
    End Get
    Set(value As String)
      LocationName = value
    End Set
  End Property

  Public Property LocationNameInUse1 As Boolean
    Get
      Return LocationNameInUse
    End Get
    Set(value As Boolean)
      LocationNameInUse = value
    End Set
  End Property
End Class
