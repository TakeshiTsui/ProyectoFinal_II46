Imports ProyectoFinal_II46.Utils.SwalUtils
Public Class FormPaquete2
    Inherits System.Web.UI.Page
    Public paquete As New Paquete()
    Protected dbHelper As New BdPaquete()
    Protected bdcliente As New BdCliente()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            cargarCliente()
            ddlCliente.Visible = False
            txtIdClientes.Visible = False
            txtNombrePaquete.Visible = False
            txtDescripcion.Visible = False
            txtPrecio.Visible = False
            txtPeso.Visible = False
            txtFechaEnvio.Visible = False
            'txtEstado.Visible = False
            ddlEstado.Visible = False
            txtDestino.Visible = False
            btnGuardar.Visible = False
            btnActualizar.Visible = False
            btnBorrar.Visible = False
            btnCancelar.Visible = False
            CType(GvPaquete.Columns(0), CommandField).ShowSelectButton = False
            CType(GvPaquete.Columns(11), CommandField).ShowDeleteButton = False
            GvPaquete.DataBind()
        End If
    End Sub
    Public Sub cargarCliente()
        ddlCliente.DataSource = bdcliente.listarClientes()
        ddlCliente.DataTextField = "NombreCompleto"
        ddlCliente.DataValueField = "IdCliente"
        ddlCliente.Items.Insert(0, New ListItem("--Seleccione un cliente--", "0"))
        ddlEstado.Items.Insert(0, New ListItem("--Seleccione un estado--", ""))
        ddlCliente.DataBind()
    End Sub
    Protected Sub btnCrear_Click(sender As Object, e As EventArgs)
        ddlCliente.Visible = True
        txtIdClientes.Visible = True
        txtNombrePaquete.Visible = True
        txtDescripcion.Visible = True
        txtPrecio.Visible = True
        txtPeso.Visible = True
        txtFechaEnvio.Visible = True
        'txtEstado.Visible = True
        ddlEstado.Visible = True
        txtDestino.Visible = True
        btnGuardar.Visible = True
        btnActualizar.Visible = True
        btnBorrar.Visible = True
        btnCancelar.Visible = True
        CType(GvPaquete.Columns(0), CommandField).ShowSelectButton = True
        CType(GvPaquete.Columns(11), CommandField).ShowDeleteButton = True
        GvPaquete.DataBind()
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Try
            If txtNombrePaquete.Text = "" Or txtDescripcion.Text = "" Or txtPrecio.Text = "" Or txtPeso.Text = "" Or txtFechaEnvio.Text = "" Or ddlEstado.SelectedValue = "" Or txtDestino.Text = "" Then
                ShowErrorMessage(Me, "Error", "❌ Por favor, complete todos los campos antes de guardar.")
                Return
            End If
            paquete.Nombrepaquete = txtNombrePaquete.Text
            paquete.IdCliente = Convert.ToInt32(txtIdClientes.Text)
            paquete.Descripcion = txtDescripcion.Text
            paquete.Precio = Convert.ToDecimal(txtPrecio.Text)
            paquete.Peso = Convert.ToDecimal(txtPeso.Text)
            paquete.FechaEnvio = Convert.ToDateTime(txtFechaEnvio.Text)
            paquete.Estado = ddlEstado.Text
            paquete.Destino = txtDestino.Text
            If dbHelper.create(paquete) = True Then
                ShowSuccessMessage(Me, "Guardado", "✅ Paquete guardado correctamente.")
                txtIdClientes.Text = ""
                txtNombrePaquete.Text = ""
                txtDescripcion.Text = ""
                txtPrecio.Text = ""
                txtPeso.Text = ""
                txtFechaEnvio.Text = ""
                ddlEstado.Text = ""
                txtDestino.Text = ""
            Else
                ShowErrorMessage(Me, "Error", "❌ Error al guardar el paquete.")
            End If

            GvPaquete.DataBind()
        Catch ex As Exception
            ShowErrorMessage(Me, "Error", "❌ Error al guardar el paquete: " & ex.Message)
        End Try
    End Sub

    Protected Sub btnActualizar_Click(sender As Object, e As EventArgs)
        Try
            If txtNombrePaquete.Text = "" Or txtDescripcion.Text = "" Or txtPrecio.Text = "" Or txtPeso.Text = "" Or txtFechaEnvio.Text = "" Or ddlEstado.SelectedValue = "" Or txtDestino.Text = "" Then
                ShowErrorMessage(Me, "Error", "❌ Por favor, complete todos los campos antes de actualizar.")
                Return
            End If
            Dim paquete As New Paquete With {
                .IdCliente = Convert.ToInt32(txtIdClientes.Text),
                .Nombrepaquete = txtNombrePaquete.Text,
                .Descripcion = txtDescripcion.Text,
                .Precio = txtPrecio.Text,
                .Peso = txtPeso.Text,
                .FechaEnvio = Convert.ToDateTime(txtFechaEnvio.Text),
                .Estado = ddlEstado.SelectedValue,
                .Destino = txtDestino.Text,
                .IdPaquete = Editando.Value()
            }

            If dbHelper.update(paquete) Then
                ShowSuccessMessage(Me, "Actualizado", "✅ Datos del paquete actualizado correctamente.")
            Else
                ShowErrorMessage(Me, "Error", "❌ Error al actualizar el paquete.")
            End If

            GvPaquete.DataBind()
            GvPaquete.EditIndex = -1
            btnGuardar.Enabled = True
        Catch ex As Exception
            ShowErrorMessage(Me, "Error", "❌ Error: " & ex.Message)
        End Try
    End Sub

    Protected Sub btnBorrar_Click(sender As Object, e As EventArgs)
        btnGuardar.Visible = True
        limpiarFormulario()
        Editando.Value = " "
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs)
        txtIdClientes.Visible = False
        txtNombrePaquete.Visible = False
        txtDescripcion.Visible = False
        txtPrecio.Visible = False
        txtPeso.Visible = False
        txtFechaEnvio.Visible = False
        ddlEstado.Visible = False
        txtDestino.Visible = False
        btnGuardar.Visible = False
        btnActualizar.Visible = False
        btnBorrar.Visible = False
        btnCancelar.Visible = False
        CType(GvPaquete.Columns(0), CommandField).ShowSelectButton = False
        CType(GvPaquete.Columns(11), CommandField).ShowDeleteButton = False 'ajusta el índice según tu GridView
        GvPaquete.DataBind()
    End Sub

    Protected Sub GvPaquete_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Dim id As Integer = Convert.ToInt32(GvPaquete.DataKeys(e.RowIndex).Value)
            dbHelper.delete(id)
            e.Cancel = True
            GvPaquete.DataBind()
            ShowSuccessMessage(Me, "Eliminado", "✅ Paquete eliminado correctamente.")
        Catch ex As Exception
            ShowErrorMessage(Me, "Error", "❌ Error al eliminar el paquete: " & ex.Message)
        End Try
    End Sub

    Protected Sub GvPaquete_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        GvPaquete.EditIndex = -1
        GvPaquete.DataBind()
    End Sub

    Protected Sub GvPaquete_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            btnGuardar.Enabled = False
            Dim row As GridViewRow = GvPaquete.SelectedRow
            Dim id As Integer = Convert.ToInt32(GvPaquete.DataKeys(row.RowIndex).Value)
            txtIdClientes.Text = row.Cells(2).Text
            txtNombrePaquete.Text = row.Cells(4).Text
            txtDescripcion.Text = row.Cells(5).Text
            txtPrecio.Text = row.Cells(6).Text
            txtPeso.Text = row.Cells(7).Text
            txtFechaEnvio.Text = CDate(row.Cells(8).Text).ToString("yyyy-MM-dd")
            ddlEstado.Text = row.Cells(9).Text
            txtDestino.Text = row.Cells(10).Text
            Editando.Value = id.ToString()
        Catch ex As Exception
            ShowErrorMessage(Me, "Error", "Error al seleccionar el paquete: " & ex.Message)
        End Try
    End Sub
    Protected Sub limpiarFormulario()
        btnActualizar.Visible = False
        btnGuardar.Visible = True
        btnCancelar.Visible = False
        txtIdClientes.Text = ""
        txtNombrePaquete.Text = ""
        txtDescripcion.Text = ""
        txtPrecio.Text = ""
        txtPeso.Text = ""
        txtFechaEnvio.Text = ""
        ddlEstado.Text = ""
        txtDestino.Text = ""
    End Sub

    Protected Sub btnEntrega_Click(sender As Object, e As EventArgs)
        Response.Redirect("FormEntregas2.aspx")
    End Sub
End Class