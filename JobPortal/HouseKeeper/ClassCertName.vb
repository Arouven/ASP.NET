Public Class ClassCertName
  Private HKId As Integer
  Private CertificateName As String
  Private certificateNameInUse As Boolean

  Public Property HKId1 As Integer
    Get
      Return HKId
    End Get
    Set(value As Integer)
      HKId = value
    End Set
  End Property

  Public Property CertificateName1 As String
    Get
      Return CertificateName
    End Get
    Set(value As String)
      CertificateName = value
    End Set
  End Property

  Public Property CertificateNameInUse1 As Boolean
    Get
      Return certificateNameInUse
    End Get
    Set(value As Boolean)
      certificateNameInUse = value
    End Set
  End Property
End Class