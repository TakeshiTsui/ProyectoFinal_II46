Imports ProyectoFinal_II46.Utils

Public Class Registro
    Inherits System.Web.UI.Page
    Protected dbHelper As New dbLogin()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnRegistrar_Click(sender As Object, e As EventArgs)
        If txtUsuario.Text = "" Or txtEmail.Text = "" Or txtPassword.Text = "" Or txtConfirmarPassword.Text = "" Then
            SwalUtils.ShowErrorMessage(Me, "Error de registro", "Por favor, complete todos los campos antes de registrarse.")
            Return
        End If
        If txtEmail.Text.Contains("@") = False Or txtEmail.Text.Contains(".") = False Then
            SwalUtils.ShowErrorMessage(Me, "Error de registro", "Por favor, ingrese un correo electrónico válido.")
            Return
        End If
        Dim NombreUsuario = txtUsuario.Text
        Dim Password = txtConfirmarPassword.Text
        Dim PasswordC = txtConfirmarPassword.Text
        If Password <> PasswordC Then
            SwalUtils.ShowErrorMessage(Me, "Error de registro", "No coindiden la contraseña, introduzca nuevamente")
            Return
        End If
        Dim encrypter As New Simple3Ds("MiClaveDeEncriptacion123") ' Clave de encriptación
        Dim Pass As String = encrypter.EncryptData(Password) ' Encriptar la contraseña
        Dim usuario As Usuario = New Usuario(NombreUsuario, Pass, txtEmail.Text)
        Dim mensaje = dbHelper.RegisterUser(usuario)
        If mensaje.Contains("Error") Then
            SwalUtils.ShowErrorMessage(Me, "Error", mensaje)
        Else
            SwalUtils.ShowSuccessMessage(Me, "Exito", mensaje)
        End If
    End Sub
End Class