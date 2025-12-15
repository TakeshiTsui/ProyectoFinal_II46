Public Class PerfilCliente
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        cargarDatosCliente()
    End Sub

    Public Sub cargarDatosCliente()
        Try
            Dim cliente As Cliente = CType(Session("Cliente"), Cliente)
            If cliente Is Nothing Then
                Response.Redirect("Home.aspx")
                Return
            End If
            txtNombre.Text = cliente.Nombre
            txtApellido.Text = cliente.Apellido
            txtTelefono.Text = cliente.Telefono
            txtDireccion.Text = cliente.Direccion
            txtCorreo.Text = cliente.Correo
        Catch ex As Exception
            Return
        End Try
    End Sub

End Class