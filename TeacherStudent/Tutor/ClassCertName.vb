Public Class ClassCertName

	Private TutorId As Integer
	Private CertificationName As String
	Private certificateNameInUse As Boolean

	Public Property CertificationName1 As String
		Get
			Return CertificationName
		End Get
		Set(value As String)
			CertificationName = value
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

	Public Property TutorId1 As Integer
		Get
			Return TutorId
		End Get
		Set(value As Integer)
			TutorId = value
		End Set
	End Property
End Class
