Public Class ClassStudentStatsPerCourse
    Private CourseId As Integer
    Private StudentId As Integer
	Private Pending As Boolean
	Private Subscribe As Boolean
	Private Accept As Boolean

	Public Property CourseId1 As Integer
		Get
			Return CourseId
		End Get
		Set(value As Integer)
			CourseId = value
		End Set
	End Property

	Public Property StudentId1 As Integer
		Get
			Return StudentId
		End Get
		Set(value As Integer)
			StudentId = value
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

	Public Property Subscribe1 As Boolean
		Get
			Return Subscribe
		End Get
		Set(value As Boolean)
			Subscribe = value
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
