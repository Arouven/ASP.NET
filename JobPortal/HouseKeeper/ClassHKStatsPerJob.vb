Public Class ClassHKStatsPerJob
	Private JobId As Integer
	Private HKId As Integer
	Private Pending As Boolean
	Private Applied As Boolean
	Private Accept As Boolean

  Public Property JobId1 As Integer
    Get
      Return JobId
    End Get
    Set(value As Integer)
      JobId = value
    End Set
  End Property

  Public Property HKId1 As Integer
    Get
      Return HKId
    End Get
    Set(value As Integer)
      HKId = value
    End Set
  End Property

  Public Property Pending1 As Boolean
    Get
      Return Pending
    End Get
    Set(value As Boolean)
      Pending = value
    End Set
  End Property

  Public Property Applied1 As Boolean
    Get
      Return Applied
    End Get
    Set(value As Boolean)
      Applied = value
    End Set
  End Property

  Public Property Accept1 As Boolean
    Get
      Return Accept
    End Get
    Set(value As Boolean)
      Accept = value
    End Set
  End Property
End Class

