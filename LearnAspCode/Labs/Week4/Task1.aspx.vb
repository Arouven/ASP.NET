

Imports System.Web.Script.Serialization
Public Class Task14
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub


    Dim url As String
    Dim secretKey As String = "SECRET_KEY_HERE"
    Dim recaptcha_response = Request.Form("g-recaptcha-response")
        Label1.Text = ""

        url = String.Format("https://www.google.com/recaptcha/api/siteverify?secret=" & secretKey & "&response=" & recaptcha_response)
        Dim client As New Net.WebClient()
    Dim stream As IO.Stream = client.OpenRead(url)
    Dim reader As New IO.StreamReader(stream)
    Dim jsonData As String = reader.ReadToEnd
    Dim JsonResults As Object = New JavaScriptSerializer().Deserialize(Of Object)(jsonData)

    If JsonResults("success") = True Then

            'Submit request
            'For testing only
            '----------------------------------------------------------------------
            Label1.Text = "<br/>"
            Label1.Text &= "success: " & JsonResults("success") & "<br/>"
            Label1.Text &= "score: " & JsonResults("score") & "<br/>"
            Label1.Text &= "action: " & JsonResults("action") & "<br/>"
            Label1.Text &= "challenge_ts: " & JsonResults("challenge_ts") & "<br/>"
            '----------------------------------------------------------------------

        Else

            'Stop submit
            'For testing only
            '----------------------------------------------------------------------
            Label1.Text &= "success: " & JsonResults("success") & "<br/>"
            Label1.Text &= "errorcodes: " & JsonResults("error-codes") & "<br/>"
            'For testing only
            '----------------------------------------------------------------------

        End If

        reader.Close()  

End Class