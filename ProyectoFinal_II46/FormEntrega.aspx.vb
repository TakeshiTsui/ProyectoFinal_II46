Imports ProyectoFinal_II46.Utils.SwalUtils
Public Class FormEntrega
    Inherits System.Web.UI.Page
    Public entrega As New Entrega()
    Protected BdHelper As New BdEntrega()
    Protected BdPaquete As New BdPaquete()
    Protected BdRepartidor As New BdRepartidor()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargarDatos()
            ddlPaquete.Visible = False
            ddlRepartidor.Visible = False
            txtIdPaquete.Visible = False
            txtIdRepartidor.Visible = False
            txtFechaEntrega.Visible = False
            ddlEstadoEntrega.Visible = False
            txtObservaciones.Visible = False
            btnGuardar.Visible = False
            btnActualizar.Visible = False
            btnBorrar.Visible = False
            btnCancelar.Visible = False
            CType(GvEntregas.Columns(0), CommandField).ShowSelectButton = False
            CType(GvEntregas.Columns(1), CommandField).ShowEditButton = False
            CType(GvEntregas.Columns(8), CommandField).ShowDeleteButton = False 'ajusta el índice según tu GridView
            GvEntregas.DataBind()
        End If
    End Sub
    Public Sub CargarDatos()
        ddlPaquete.DataSource = BdPaquete.listarPaquetes()
        ddlPaquete.DataTextField = "PaqueteC"
        ddlPaquete.DataValueField = "IdPaquete"
        ddlPaquete.DataBind()
        ddlPaquete.Items.Insert(0, New ListItem("--Seleccione un paquete--", "0"))
        ddlRepartidor.DataSource = BdRepartidor.listarRepartidores()
        ddlRepartidor.DataTextField = "NombreCompleto"
        ddlRepartidor.DataValueField = "IdRepartidor"
        ddlRepartidor.DataBind()
        ddlRepartidor.Items.Insert(0, New ListItem("--Seleccione un repartidor--", "0"))
    End Sub
    Protected Sub btnCrear_Click(sender As Object, e As EventArgs)
        ddlPaquete.Visible = True
        ddlRepartidor.Visible = True
        txtIdPaquete.Visible = True
        txtIdRepartidor.Visible = True
        txtFechaEntrega.Visible = True
        ddlEstadoEntrega.Visible = True
        txtObservaciones.Visible = True
        btnGuardar.Visible = True
        btnActualizar.Visible = True
        btnBorrar.Visible = True
        btnCancelar.Visible = True
        CType(GvEntregas.Columns(0), CommandField).ShowSelectButton = True
        CType(GvEntregas.Columns(1), CommandField).ShowEditButton = True
        CType(GvEntregas.Columns(8), CommandField).ShowDeleteButton = True 'ajusta el índice según tu GridView
        GvEntregas.DataBind()
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Try
            entrega.IdPaquete = txtIdPaquete.Text
            entrega.IdRepartidor = txtIdRepartidor.Text
            entrega.FechaEntrega = txtFechaEntrega.Text
            entrega.EstadoEntrega = ddlEstadoEntrega.SelectedValue
            entrega.Observaciones = txtObservaciones.Text
            If BdHelper.create(entrega) = True Then
                ShowSuccessMessage(Me, "Guardado", "✅ Entrega guardada correctamente.")
                limpiarCampos()
                GvEntregas.DataBind()
            Else
                ShowErrorMessage(Me, "Error", "❌ Error al guardar la entrega.")
            End If
        Catch ex As Exception
            ShowErrorMessage(Me, "Error", "❌ Error al guardar la entrega: " & ex.Message)
            Return
        End Try
    End Sub

    Protected Sub btnActualizar_Click(sender As Object, e As EventArgs)
        Try
            Dim entrega As New Entrega With {
                .IdEntrega = Convert.ToInt32(Editando.Value),
                .IdPaquete = txtIdPaquete.Text,
                .IdRepartidor = txtIdRepartidor.Text,
                .FechaEntrega = Convert.ToDateTime(txtFechaEntrega.Text),
                .EstadoEntrega = ddlEstadoEntrega.SelectedValue,
                .Observaciones = txtObservaciones.Text
            }
            If BdHelper.update(entrega) = True Then
                ShowSuccessMessage(Me, "Actualizado", "✅ Entrega actualizada correctamente.")
                limpiarCampos()
                btnGuardar.Enabled = True
                Editando.Value = ""
                GvEntregas.DataBind()
            Else
                ShowErrorMessage(Me, "Error", "❌ Error al actualizar la entrega.")
            End If
        Catch ex As Exception
            ShowErrorMessage(Me, "Error", "❌ Error al actualizar la entrega: " & ex.Message)
            Return
        End Try
    End Sub

    Protected Sub btnBorrar_Click(sender As Object, e As EventArgs)
        btnGuardar.Enabled = True
        limpiarCampos()
        Editando.Value = ""
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs)
        ddlPaquete.Visible = False
        ddlRepartidor.Visible = False
        txtIdPaquete.Visible = False
        txtIdRepartidor.Visible = False
        txtFechaEntrega.Visible = False
        ddlEstadoEntrega.Visible = False
        txtObservaciones.Visible = False
        btnGuardar.Visible = False
        btnActualizar.Visible = False
        btnBorrar.Visible = False
        btnCancelar.Visible = False
        CType(GvEntregas.Columns(0), CommandField).ShowSelectButton = False
        CType(GvEntregas.Columns(1), CommandField).ShowEditButton = False
        CType(GvEntregas.Columns(8), CommandField).ShowDeleteButton = False 'ajusta el índice según tu GridView
        GvEntregas.DataBind()
    End Sub

    Protected Sub btnFiltrar_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnHistorial_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub GvEntregas_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)

    End Sub

    Protected Sub GvEntregas_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Try
            Dim idEntrega As Integer = Convert.ToInt32(GvEntregas.DataKeys(e.RowIndex).Value)
            Dim entrega As New Entrega With {
                .IdEntrega = idEntrega,
                .IdPaquete = Convert.ToInt32(e.NewValues("IdPaquete")),
                .IdRepartidor = Convert.ToInt32(e.NewValues("IdRepartidor")),
                .FechaEntrega = Convert.ToDateTime(e.NewValues("FechaEntrega")),
                .EstadoEntrega = e.NewValues("EstadoEntrega").ToString(),
                .Observaciones = e.NewValues("Observaciones").ToString()
            }
            BdHelper.update(entrega)
            GvEntregas.EditIndex = -1
            GvEntregas.DataBind()
            ShowSuccessMessage(Me, "Actualizado", "✅ Datos de la entrega actualizados correctamente.")
        Catch ex As Exception
            ShowErrorMessage(Me, "Error", "❌ Error al actualizar la entrega: " & ex.Message)
        End Try
    End Sub

    Protected Sub GvEntregas_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        GvEntregas.EditIndex = -1
        GvEntregas.DataBind()
    End Sub

    Protected Sub GvEntregas_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            btnGuardar.Enabled = False
            Dim row As GridViewRow = GvEntregas.SelectedRow
            Dim idEntrega As Integer = Convert.ToInt32(GvEntregas.DataKeys(row.RowIndex).Value)
            txtIdPaquete.Text = row.Cells(3).Text
            txtIdRepartidor.Text = row.Cells(4).Text
            txtFechaEntrega.Text = CDate(row.Cells(5).Text).ToString("yyyy-MM-dd")
            ddlEstadoEntrega.SelectedValue = row.Cells(6).Text
            txtObservaciones.Text = row.Cells(7).Text
            Editando.Value = idEntrega.ToString()
        Catch ex As Exception
            ShowErrorMessage(Me, "Error", "Error al seleccionar la entrega: " & ex.Message)
        End Try
    End Sub
    Public Sub limpiarCampos()
        ddlPaquete.SelectedIndex = 0
        ddlRepartidor.SelectedIndex = 0
        txtFechaEntrega.Text = ""
        ddlEstadoEntrega.SelectedIndex = 0
        txtObservaciones.Text = ""
    End Sub
End Class