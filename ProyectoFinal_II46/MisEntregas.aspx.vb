Public Class MisEntregas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnFiltrar_Click(sender As Object, e As EventArgs)
        gvMisEntregas.DataBind()
    End Sub
End Class