Imports System.Data.SqlClient

Public Class BdCliente
    Private ReadOnly connectionString As String = ConfigurationManager.ConnectionStrings("ProyectoFinal_II46ConnectionString").ConnectionString
    Private ReadOnly dbhelper As New DbHelper() 'clase para mejorar conexion y manejo de errores
    Public Function create(cliente As Cliente) As Boolean
        Try
            Dim sql As String = "INSERT INTO Cliente (Nombre, Apellido, Telefono, Direccion, Correo) 
                                 VALUES (@Nombre, @Apellido, @Telefono, @Direccion, @Correo)"
            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@Nombre", cliente.Nombre),
                New SqlParameter("@Apellido", cliente.Apellido),
                New SqlParameter("@Telefono", cliente.Telefono),
                New SqlParameter("@Direccion", cliente.Direccion),
                New SqlParameter("@Correo", cliente.Correo)
            }
            dbhelper.ExecuteNonQuery(sql, parametros)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function
    Public Function delete(id As Integer) As String
        Try
            Dim sql As String = "DELETE FROM Cliente WHERE IdCliente = @IdCliente"
            Dim Parametros As New List(Of SqlParameter) From {
            New SqlParameter("@IdCliente", id)
            }
            dbhelper.ExecuteNonQuery(sql, Parametros)
            Return "Cliente eliminado correctamente."
        Catch ex As Exception
            Return "Error al eliminar el cliente: " & ex.Message
        End Try
    End Function
    Public Function update(cliente As Cliente) As String
        Try
            Dim sql As String = "UPDATE Cliente 
                                 SET Nombre = @Nombre, 
                                     Apellido = @Apellido, 
                                     Telefono = @Telefono, 
                                     Direccion = @Direccion, 
                                     Correo = @Correo 
                                 WHERE IdCliente = @IdCliente"

            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@IdCliente", cliente.Idcliente),
                New SqlParameter("@Nombre", cliente.Nombre),
                New SqlParameter("@Apellido", cliente.Apellido),
                New SqlParameter("@Telefono", cliente.Telefono),
                New SqlParameter("@Direccion", cliente.Direccion),
                New SqlParameter("@Correo", cliente.Correo)
            }
            dbhelper.ExecuteNonQuery(sql, parametros)
            Return "Cliente actualizado correctamente."
        Catch ex As Exception
            Return "Error al actualizar el cliente: " & ex.Message
        End Try
    End Function
    Public Function listarClientes() As DataTable
        Try
            Dim sql As String = "SELECT *, CONCAT(IdCliente, ' ', Nombre, ' ', Apellido, ' ') NombreCompleto FROM Cliente"
            Return dbhelper.ExecuteQuery(sql, Nothing)
        Catch ex As Exception
            Return New DataTable()
        End Try
    End Function
    Public Function ObtenerCliente(email As String) As Cliente
        Try
            Dim sql As String = "SELECT C.* FROM Cliente C INNER JOIN Usuarios U ON U.Email = C.Correo WHERE Email = @Email"
            Dim parametros As New List(Of SqlParameter) From {
             New SqlParameter("@Email", email)
            }
            Dim dt As DataTable = dbhelper.ExecuteQuery(sql, parametros)
            If dt.Rows.Count = 0 Then
                Return Nothing
            End If
            Dim c As New Cliente()
            c.Idcliente = Convert.ToInt32(dt.Rows(0)("idCliente"))
            c.Nombre = dt.Rows(0)("Nombre").ToString
            c.Apellido = dt.Rows(0)("Apellido").ToString
            c.Telefono = dt.Rows(0)("Telefono").ToString
            c.Direccion = dt.Rows(0)("Direccion").ToString
            c.Correo = dt.Rows(0)("Correo").ToString
            Return c
        Catch ex As Exception
            Return Nothing
        End Try
    End Function
End Class
