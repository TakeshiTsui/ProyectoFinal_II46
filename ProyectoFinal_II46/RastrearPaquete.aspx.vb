Imports ProyectoFinal_II46.Utils.SwalUtils
Public Class RastrearPaquete
    Inherits System.Web.UI.Page
    Protected Bdhelper As New BdPaquete()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnRastrear_Click(sender As Object, e As EventArgs)
        Try
            If txtNumeroPaquete.Text = "" Then
                ShowErrorMessage(Me, "Error", "Debe ingresar un numero de paquete.")
                Return
            End If
            Dim paquete As New Paquete()
            paquete.IdPaquete = txtNumeroPaquete.Text
            Dim dt As DataTable = Bdhelper.rastrear(paquete)
            If dt.Rows.Count > 0 Then
                lblEstadoP.Text = dt.Rows(0)("Estado").ToString
                lblDestino.Text = dt.Rows(0)("Destino").ToString
                lblFecha.Text = Convert.ToDateTime(dt.Rows(0)("FechaEnvio")).ToShortDateString
            Else
                ShowErrorMessage(Me, "Error", "Paquete no encontrado, verifique nuevamente")
            End If
        Catch ex As Exception

        End Try
    End Sub

End Class