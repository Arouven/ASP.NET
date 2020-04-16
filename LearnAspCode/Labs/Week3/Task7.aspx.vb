Public Class Task71
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub
    Private Sub switchcase()
        Dim random As Random = New Random()
        Dim imageselect As Integer
        imageselect = random.Next(1, 5)

        Select Case imageselect
            Case 1
                Image1.ImageUrl = "https://vignette.wikia.nocookie.net/thecornerclub/images/e/e1/Blast_500x500-1-.jpg"
            Case 2
                Image1.ImageUrl = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/35302887-bf5b-4c46-a9e0-fc72c65ffb50/d2zaii3-22e60a2b-a164-44bd-a487-cb16589a4799.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwic3ViIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsImF1ZCI6WyJ1cm46c2VydmljZTpmaWxlLmRvd25sb2FkIl0sIm9iaiI6W1t7InBhdGgiOiIvZi8zNTMwMjg4Ny1iZjViLTRjNDYtYTllMC1mYzcyYzY1ZmZiNTAvZDJ6YWlpMy0yMmU2MGEyYi1hMTY0LTQ0YmQtYTQ4Ny1jYjE2NTg5YTQ3OTkuanBnIn1dXX0.jLeKafRT-txwDF-TnpepYcKB-dBwPO46ZusNDTRejS8"
            Case 3
                Image1.ImageUrl = "https://inspirationfeed.com/wp-content/uploads/2010/06/Evolution_by_will_yen-500x500.png"
            Case 4
                Image1.ImageUrl = "http://vignette1.wikia.nocookie.net/thebatmanfanon/images/2/2f/Batman_rect-500x500.jpg/revision/latest?cb=20120408073139"
            Case 5
                Image1.ImageUrl = "https://farm9.staticflickr.com/8644/16517781789_6ed90c5678.jpg"
        End Select

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        switchcase()
    End Sub

End Class