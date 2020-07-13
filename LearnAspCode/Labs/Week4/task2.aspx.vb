Public Class task22
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub CVCountryDropDown_ServerValidate(source As Object, args As ServerValidateEventArgs)
        If ddCountry.SelectedValue = -1 Then
            args.IsValid = False
        End If
    End Sub

    Protected Sub PopErroMsg()
        Response.Write("<script language=javascript>alert('" & "Following Errors Occured:\n" & RFVFirstname.ErrorMessage & "\n" & RFVSurname.ErrorMessage & "\n" & RFVUsername.ErrorMessage & "\n" & RFVPassword.ErrorMessage & "\n" & REVPassword.ErrorMessage & "\n" & CVConfirmPassword.ErrorMessage & "\n" & REVEmail.ErrorMessage & "\n" & REVPhonenumber.ErrorMessage & "\n" & REVZipcode.ErrorMessage & "\n" & CVCountryDropDown.ErrorMessage & "')</script>")
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        PopErroMsg()
    End Sub
End Class