Public Class rndquotation
	Inherits System.Web.UI.UserControl

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim quotes As New List(Of String)()
		quotes.Add("All paid jobs absorb and degrade the mind -- Aristotle")
		quotes.Add("No evil can happen to a good man, either in life or after death -- Plato")
		quotes.Add("The only good is knowledge and the only evil is ignorance -- Plato")
		Dim rnd As Random = New Random()
		lblQuote.Text = quotes(rnd.Next(quotes.Count))
	End Sub

End Class