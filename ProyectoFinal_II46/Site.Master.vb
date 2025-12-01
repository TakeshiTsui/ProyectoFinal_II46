Public Class SiteMaster
    Inherits MasterPage
    Protected Autenticado As Integer = 0
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Dim Usuario As Usuario = Session("Usuario")
        If Usuario IsNot Nothing Then
            Autenticado = CInt(Usuario.Rol)
        Else
            Autenticado = 0
        End If
        btnLogOut.Visible = Autenticado > 0
    End Sub

    Protected Sub btnLogOut_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Session.Abandon()
        Response.Redirect("Login.aspx")
    End Sub
End Class