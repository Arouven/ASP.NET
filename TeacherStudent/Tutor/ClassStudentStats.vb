Public Class ClassStudentStats
	Private CourseId As Integer
	Private TotalStudentInCourse As Integer
	Private TotalStudentInCoursePending As Integer
	Private TotalStudentInCourseRejected As Integer

	Public Property CourseId1 As Integer
		Get
			Return CourseId
		End Get
		Set(value As Integer)
			CourseId = value
		End Set
	End Property

	Public Property TotalStudentInCourse1 As Integer
		Get
			Return TotalStudentInCourse
		End Get
		Set(value As Integer)
			TotalStudentInCourse = value
		End Set
	End Property

	Public Property TotalStudentInCoursePending1 As Integer
		Get
			Return TotalStudentInCoursePending
		End Get
		Set(value As Integer)
			TotalStudentInCoursePending = value
		End Set
	End Property

	Public Property TotalStudentInCourseRejected1 As Integer
		Get
			Return TotalStudentInCourseRejected
		End Get
		Set(value As Integer)
			TotalStudentInCourseRejected = value
		End Set
	End Property
End Class

