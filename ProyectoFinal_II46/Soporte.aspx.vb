Imports ProyectoFinal_II46.Utils.SwalUtils
Public Class Soporte
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs)
        txtAsunto.Text = ""
        txtMensaje.Text = ""
        ShowSuccessMessage(Me, "Exito", "Mensaje enviado con éxito.")
    End Sub
End Class