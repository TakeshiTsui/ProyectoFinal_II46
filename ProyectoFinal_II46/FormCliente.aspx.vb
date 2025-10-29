Public Class FormCliente
    Inherits System.Web.UI.Page
    Public Cliente As New Cliente()
    Protected BdHelper As New BdCliente()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtNombre.Visible = False
            txtApellido.Visible = False
            txtTelefono.Visible = False
            txtDireccion.Visible = False
            txtCorreo.Visible = False
            btnGuardar.Visible = False
            btnActualizar.Visible = False
            btnBorrar.Visible = False
            btnCancelar.Visible = False
            CType(GvClientes.Columns(0), CommandField).ShowSelectButton = False
            CType(GvClientes.Columns(1), CommandField).ShowEditButton = False
            CType(GvClientes.Columns(8), CommandField).ShowDeleteButton = False 'ajusta el índice según tu GridView
            GvClientes.DataBind()
        End If
    End Sub
    Protected Sub btnCrear_Click(sender As Object, e As EventArgs)
        txtNombre.Visible = True
        txtApellido.Visible = True
        txtTelefono.Visible = True
        txtDireccion.Visible = True
        txtCorreo.Visible = True
        btnGuardar.Visible = True
        btnActualizar.Visible = True
        btnBorrar.Visible = True
        btnCancelar.Visible = True
        CType(GvClientes.Columns(0), CommandField).ShowSelectButton = True
        CType(GvClientes.Columns(1), CommandField).ShowEditButton = True
        CType(GvClientes.Columns(8), CommandField).ShowDeleteButton = True 'ajusta el índice según tu GridView
        GvClientes.DataBind()
    End Sub
    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Try
            Cliente.Nombre = txtNombre.Text
            Cliente.Apellido = txtApellido.Text
            Cliente.Telefono = txtTelefono.Text
            Cliente.Direccion = txtDireccion.Text
            Cliente.Correo = txtCorreo.Text

            If BdHelper.create(Cliente) = True Then
                lblMensaje.Text = "✅ Cliente guardado correctamente."
                ' Limpiar campos
                txtNombre.Text = ""
                txtApellido.Text = ""
                txtTelefono.Text = ""
                txtDireccion.Text = ""
                txtCorreo.Text = ""
            Else
                lblMensaje.Text = "⚠️ Error al guardar el cliente."
            End If

            GvClientes.DataBind()
        Catch ex As Exception
            lblMensaje.Text = "❌ Error: " & ex.Message
        End Try
    End Sub


    Protected Sub btnActualizar_Click(sender As Object, e As EventArgs)
        Try

            Dim cliente As New Cliente With {
                .Idcliente = Convert.ToInt32(Editando.Value),
                .Nombre = txtNombre.Text,
                .Apellido = txtApellido.Text,
                .Telefono = txtTelefono.Text,
                .Direccion = txtDireccion.Text,
                .Correo = txtCorreo.Text
            }

            BdHelper.update(cliente)

            GvClientes.DataBind()
            GvClientes.EditIndex = -1
            lblMensaje.Text = "✅ Cliente actualizado correctamente."
            btnGuardar.Enabled = True
        Catch ex As Exception
            lblMensaje.Text = "❌ Error al actualizar el cliente: " & ex.Message
        End Try
    End Sub

    Protected Sub GvClientes_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Dim id As Integer = Convert.ToInt32(GvClientes.DataKeys(e.RowIndex).Value)
            BdHelper.delete(id)
            e.Cancel = True
            GvClientes.DataBind()
        Catch ex As Exception
            lblMensaje.Text = "Error al eliminar la persona: " & ex.Message
        End Try
    End Sub
    Protected Sub GvClientes_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        GvClientes.EditIndex = -1
        GvClientes.DataBind()
    End Sub

    Protected Sub GvClientes_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Try
            Dim id As Integer = Convert.ToInt32(GvClientes.DataKeys(e.RowIndex).Value)
            Dim cliente As New Cliente With {
                .Idcliente = id,
                .Nombre = e.NewValues("Nombre").ToString(),
                .Apellido = e.NewValues("Apellido").ToString(),
                .Telefono = e.NewValues("Telefono").ToString(),
                .Direccion = e.NewValues("Direccion").ToString(),
                .Correo = e.NewValues("Correo").ToString()
            }
            BdHelper.update(cliente)
            GvClientes.EditIndex = -1
            GvClientes.DataBind()
            lblMensaje.Text = "✅ Cliente actualizado correctamente."
        Catch ex As Exception
            lblMensaje.Text = "❌ Error al actualizar el cliente: " & ex.Message
        End Try
    End Sub

    Protected Sub GvClientes_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            btnGuardar.Enabled = False
            Dim row As GridViewRow = GvClientes.SelectedRow
            Dim id As Integer = Convert.ToInt32(GvClientes.DataKeys(row.RowIndex).Value)
            txtNombre.Text = row.Cells(3).Text
            txtApellido.Text = row.Cells(4).Text
            txtTelefono.Text = row.Cells(5).Text
            txtDireccion.Text = row.Cells(6).Text
            txtCorreo.Text = row.Cells(7).Text
            Editando.Value = id.ToString()
        Catch ex As Exception
            lblMensaje.Text = "❌ Error al seleccionar cliente: " & ex.Message
        End Try
    End Sub

    Protected Sub btnBorrar_Click(sender As Object, e As EventArgs)
        btnGuardar.Enabled = True
        txtNombre.Text = ""
        txtApellido.Text = ""
        txtTelefono.Text = ""
        txtDireccion.Text = ""
        txtCorreo.Text = ""
        Editando.Value = ""

    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs)
        txtNombre.Visible = False
        txtApellido.Visible = False
        txtTelefono.Visible = False
        txtDireccion.Visible = False
        txtCorreo.Visible = False
        btnGuardar.Visible = False
        btnActualizar.Visible = False
        btnBorrar.Visible = False
        btnCancelar.Visible = False
        CType(GvClientes.Columns(0), CommandField).ShowSelectButton = False
        CType(GvClientes.Columns(1), CommandField).ShowEditButton = False
        CType(GvClientes.Columns(8), CommandField).ShowDeleteButton = False 'ajusta el índice según tu GridView
        GvClientes.DataBind()
    End Sub
End Class