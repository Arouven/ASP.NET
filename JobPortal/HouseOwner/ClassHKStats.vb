Public Class ClassHKStats
	Private JobId As Integer
	Private TotalHKInJob As Integer
	Private TotalHKInJobPending As Integer
	Private TotalHKInJobRejected As Integer

  Public Property JobId1 As Integer
    Get
      Return JobId
    End Get
    Set(value As Integer)
      JobId = value
    End Set
  End Property

  Public Property TotalHKInJob1 As Integer
    Get
      Return TotalHKInJob
    End Get
    Set(value As Integer)
      TotalHKInJob = value
    End Set
  End Property

  Public Property TotalHKInJobPending1 As Integer
    Get
      Return TotalHKInJobPending
    End Get
    Set(value As Integer)
      TotalHKInJobPending = value
    End Set
  End Property

  Public Property TotalHKInJobRejected1 As Integer
    Get
      Return TotalHKInJobRejected
    End Get
    Set(value As Integer)
      TotalHKInJobRejected = value
    End Set
  End Property
End Class

