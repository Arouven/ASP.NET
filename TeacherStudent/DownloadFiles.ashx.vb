Imports System.Web
Imports System.Web.Services

Public Class DownloadFiles
	Implements System.Web.IHttpHandler

	Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        Dim stream As IO.Stream = Nothing
        Try
            Dim FileLocation As String = HttpContext.Current.Request.QueryString("file")
            stream = New IO.FileStream(FileLocation, IO.FileMode.Open, IO.FileAccess.Read, IO.FileShare.Read)
            Dim bytesToRead As Long = stream.Length
            HttpContext.Current.Response.ContentType = "application/octet-stream"
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" & IO.Path.GetFileName(FileLocation))

            While bytesToRead > 0

                If HttpContext.Current.Response.IsClientConnected Then
                    Dim buffer As Byte() = New Byte(9999) {}
                    Dim length As Integer = stream.Read(buffer, 0, 10000)
                    HttpContext.Current.Response.OutputStream.Write(buffer, 0, length)
                    HttpContext.Current.Response.Flush()
                    bytesToRead = bytesToRead - length
                Else
                    bytesToRead = -1
                End If
            End While

        Catch
            Throw
        Finally
            If stream IsNot Nothing Then stream.Close()
        End Try

    End Sub

	ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
		Get
			Return False
		End Get
	End Property

End Class