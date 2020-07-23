Imports System.Web.Optimization

Public Class Global_asax
    Inherits HttpApplication

    Sub Application_Start(sender As Object, e As EventArgs)
        ' Fires when the application is started
        Application("TotalOnlineUsers ") = 0

        RouteConfig.RegisterRoutes(RouteTable.Routes)
        BundleConfig.RegisterBundles(BundleTable.Bundles)
    End Sub
    Private Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        Application.Lock()
        Dim count As Integer = CType(Application("TotalOnlineUsers "), Integer)
        Application("TotalOnlineUsers ") = count + 1
        Application.UnLock()
    End Sub
    Private Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        Application.Lock()
        Dim count As Integer = CType(Application("TotalOnlineUsers "), Integer)
        Application("TotalOnlineUsers ") = count - 1
        Application.UnLock()
    End Sub
End Class