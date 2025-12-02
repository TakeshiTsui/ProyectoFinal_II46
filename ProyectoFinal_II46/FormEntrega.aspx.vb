Public Class FormEntrega
    Inherits System.Web.UI.Page
    Public entrega As New Entrega()
    Protected BdHelper As New BdEntrega()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnCrear_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnBorrar_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnFiltrar_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnHistorial_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub GvEntregas_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)

    End Sub

    Protected Sub GvEntregas_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)

    End Sub

    Protected Sub GvEntregas_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)

    End Sub

    Protected Sub GvEntregas_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub
End Class