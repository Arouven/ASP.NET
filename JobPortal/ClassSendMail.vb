Public Class ClassSendMail
	'vars to changed
	Public Shared ReadOnly email As String = "@gmail.com"
	Public Shared ReadOnly pass As String = ""
	Public Shared ReadOnly MyDomain As String = "https://localhost:44388" 'www.mocoolmaid.com

	'vars Dont touch
	Public Shared ReadOnly HKViewProfileUrl As String = MyDomain & "/HouseKeeper/HKViewProfile"
	Public Shared ReadOnly hoViewHKUrl As String = MyDomain & "/HouseOwner/HOViewsListOfHK"
	Public Shared ReadOnly hoRateHKUrl As String = MyDomain & "/HouseOwner/HORateHK"

	Public Shared ReadOnly HOViewProfileUrl As String = MyDomain & "/HouseOwner/HOViewProfile"
	Public Shared ReadOnly hoProfileUpdateUrl As String = MyDomain & "/HouseOwner/HOUpdateProfile"
	Public Shared ReadOnly hkProfileUpdateUrl As String = MyDomain & "/HouseKeeper/HKUpdateProfile"
	Public Shared ReadOnly hkViewJob As String = MyDomain & "/HouseKeeper/ViewJobDetails"
End Class
