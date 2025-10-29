﻿Public Class FormRepartidor
    Inherits System.Web.UI.Page
    Public Repartidor As New Repartidor()
    Protected BdHelper As New BdRepartidor()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtNombre.Visible = False
            txtApellido.Visible = False
            txtTelefono.Visible = False
            txtVehiculo.Visible = False
            txtPlacaVehiculo.Visible = False
            btnGuardar.Visible = False
            btnActualizar.Visible = False
            btnBorrar.Visible = False
            btnCancelar.Visible = False
            CType(GvRepartidores.Columns(0), CommandField).ShowSelectButton = False
            CType(GvRepartidores.Columns(1), CommandField).ShowEditButton = False
            CType(GvRepartidores.Columns(8), CommandField).ShowDeleteButton = False 'ajusta el índice según tu GridView
            GvRepartidores.DataBind()
        End If
    End Sub
    Protected Sub btnCrear_Click(sender As Object, e As EventArgs)
        txtNombre.Visible = True
        txtApellido.Visible = True
        txtTelefono.Visible = True
        txtVehiculo.Visible = True
        txtPlacaVehiculo.Visible = True
        btnGuardar.Visible = True
        btnActualizar.Visible = True
        btnBorrar.Visible = True
        btnCancelar.Visible = True
        CType(GvRepartidores.Columns(0), CommandField).ShowSelectButton = True
        CType(GvRepartidores.Columns(1), CommandField).ShowEditButton = True
        CType(GvRepartidores.Columns(8), CommandField).ShowDeleteButton = True 'ajusta el índice según tu GridView
        GvRepartidores.DataBind()
    End Sub
    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs)
        txtNombre.Visible = False
        txtApellido.Visible = False
        txtTelefono.Visible = False
        txtVehiculo.Visible = False
        txtPlacaVehiculo.Visible = False
        btnGuardar.Visible = False
        btnActualizar.Visible = False
        btnBorrar.Visible = False
        btnCancelar.Visible = False
        CType(GvRepartidores.Columns(0), CommandField).ShowSelectButton = False
        CType(GvRepartidores.Columns(1), CommandField).ShowEditButton = False
        CType(GvRepartidores.Columns(8), CommandField).ShowDeleteButton = False 'ajusta el índice según tu GridView
        GvRepartidores.DataBind()
        lblMensaje.Text = ""
    End Sub
    Protected Sub GvRepartidores_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Dim idRepartidor As Integer = Convert.ToInt32(GvRepartidores.DataKeys(e.RowIndex).Value)
            BdHelper.delete(idRepartidor)
            e.Cancel = True
            GvRepartidores.DataBind()
        Catch ex As Exception
            lblMensaje.Text = "Error al eliminar la persona: " & ex.Message
        End Try
    End Sub
    Protected Sub GvRepartidores_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        GvRepartidores.EditIndex = -1
        GvRepartidores.DataBind()
    End Sub

    Protected Sub GvRepartidores_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Try
            Dim id As Integer = Convert.ToInt32(GvRepartidores.DataKeys(e.RowIndex).Value)
            Dim repartidor As New Repartidor With {
                .IdRepartidor = id,
                .Nombre = e.NewValues("Nombre").ToString(),
                .Apellido = e.NewValues("Apellido").ToString(),
                .Telefono = e.NewValues("Telefono").ToString(),
                .Vehiculo = e.NewValues("Vehiculo").ToString(),
                .PlacaVehiculo = e.NewValues("PlacaVehiculo").ToString()
            }
            BdHelper.update(repartidor)
            GvRepartidores.EditIndex = -1
            GvRepartidores.DataBind()
            lblMensaje.Text = "✅ Datos del repartidor actualizado correctamente."
        Catch ex As Exception
            lblMensaje.Text = "❌ Error al actualizar el cliente: " & ex.Message
        End Try
    End Sub

    Protected Sub GvRepartidores_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            btnGuardar.Enabled = False
            Dim row As GridViewRow = GvRepartidores.SelectedRow
            Dim id As Integer = Convert.ToInt32(GvRepartidores.DataKeys(row.RowIndex).Value)
            txtNombre.Text = row.Cells(3).Text
            txtApellido.Text = row.Cells(4).Text
            txtTelefono.Text = row.Cells(5).Text
            txtVehiculo.Text = row.Cells(6).Text
            txtPlacaVehiculo.Text = row.Cells(7).Text
            Editando.Value = id.ToString()
        Catch ex As Exception
            lblMensaje.Text = "❌ Error al seleccionar cliente: " & ex.Message
        End Try
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Try
            Repartidor.Nombre = txtNombre.Text
            Repartidor.Apellido = txtApellido.Text
            Repartidor.Telefono = txtTelefono.Text
            Repartidor.Vehiculo = txtVehiculo.Text
            Repartidor.PlacaVehiculo = txtPlacaVehiculo.Text

            If BdHelper.create(Repartidor) = True Then
                lblMensaje.Text = "✅ Cliente guardado correctamente."
                ' Limpiar campos
                txtNombre.Text = ""
                txtApellido.Text = ""
                txtTelefono.Text = ""
                txtVehiculo.Text = ""
                txtPlacaVehiculo.Text = ""
            Else
                lblMensaje.Text = "⚠️ Error al guardar el cliente."
            End If

            GvRepartidores.DataBind()
        Catch ex As Exception
            lblMensaje.Text = "❌ Error: " & ex.Message
        End Try
    End Sub

    Protected Sub btnActualizar_Click(sender As Object, e As EventArgs)
        Try
            Dim repartidor As New Repartidor With {
                .IdRepartidor = Convert.ToInt32(Editando.Value),
                .Nombre = txtNombre.Text,
                .Apellido = txtApellido.Text,
                .Telefono = txtTelefono.Text,
                .Vehiculo = txtVehiculo.Text,
                .PlacaVehiculo = txtPlacaVehiculo.Text
            }

            BdHelper.update(repartidor)

            GvRepartidores.DataBind()
            GvRepartidores.EditIndex = -1
            lblMensaje.Text = "✅ Cliente actualizado correctamente."
            btnGuardar.Enabled = True
        Catch ex As Exception
            lblMensaje.Text = "❌ Error al actualizar el cliente: " & ex.Message
        End Try
    End Sub

    Protected Sub btnBorrar_Click(sender As Object, e As EventArgs)
        btnGuardar.Enabled = True
        txtNombre.Text = ""
        txtApellido.Text = ""
        txtTelefono.Text = ""
        txtVehiculo.Text = ""
        txtPlacaVehiculo.Text = ""
        Editando.Value = ""
        lblMensaje.Text = ""
    End Sub

End Class