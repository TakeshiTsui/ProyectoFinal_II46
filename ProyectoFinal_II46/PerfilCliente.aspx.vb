Imports ProyectoFinal_II46.Utils.SwalUtils
Public Class PerfilCliente
    Inherits System.Web.UI.Page
    Protected BdHelper As New BdCliente()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        cargarDatosCliente()
        txtNombre.ReadOnly = True
        txtApellido.ReadOnly = True
        txtTelefono.ReadOnly = True
        txtDireccion.ReadOnly = True
        txtCorreo.ReadOnly = True
    End Sub

    Public Sub cargarDatosCliente()
        Try
            Dim usuario As Usuario = CType(Session("Usuario"), Usuario)
            If usuario Is Nothing Then
                Response.Redirect("Home.aspx")
            End If

            Dim BdCliente As New BdCliente()
            Dim cliente As Cliente = BdCliente.ObtenerCliente(usuario.Email)
            Editando.Value = cliente.Idcliente.ToString
            txtNombre.Text = cliente.Nombre
            txtApellido.Text = cliente.Apellido
            txtTelefono.Text = cliente.Telefono
            txtDireccion.Text = cliente.Direccion
            txtCorreo.Text = cliente.Correo
        Catch ex As Exception
            Return
        End Try
    End Sub

    Protected Sub BtnActualizar_Click(sender As Object, e As EventArgs)
        txtNombre.ReadOnly = False
        txtApellido.ReadOnly = False
        txtTelefono.ReadOnly = False
        txtDireccion.ReadOnly = False
        txtCorreo.ReadOnly = False
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Try
            Dim cliente As New Cliente
            cliente.Idcliente = Convert.ToInt32(Editando.Value)
            cliente.Nombre = txtNombre.Text
            cliente.Apellido = txtApellido.Text
            cliente.Telefono = txtTelefono.Text
            cliente.Direccion = txtDireccion.Text
            cliente.Correo = txtCorreo.Text

            Dim mensaje = BdHelper.update(cliente)
            ShowSuccessMessage(Me, "Actualizado", mensaje)
        Catch ex As Exception
            ShowErrorMessage(Me, "Error", "❌ Error al actualizar el cliente: " & ex.Message)
        End Try
    End Sub
End Class