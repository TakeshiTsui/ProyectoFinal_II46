Imports System.Data.SqlClient

Public Class BdCliente
    Private ReadOnly connectionString As String = ConfigurationManager.ConnectionStrings("ProyectoFinal_II46ConnectionString").ConnectionString
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

            Using connection As New SqlConnection(connectionString)
                Using command As New SqlCommand(sql, connection)
                    command.Parameters.AddRange(parametros.ToArray())
                    connection.Open()
                    command.ExecuteNonQuery()
                End Using
            End Using
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function
    Public Function delete(id As Integer) As String
        Try
            Dim sql As String = "DELETE FROM Cliente WHERE IdCliente = @IdCliente"
            Using connection As New SqlConnection(connectionString)
                Using command As New SqlCommand(sql, connection)
                    command.Parameters.AddWithValue("@IdCliente", id)
                    connection.Open()
                    command.ExecuteNonQuery()
                End Using
            End Using
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

            Using connection As New SqlConnection(connectionString)
                Using command As New SqlCommand(sql, connection)
                    command.Parameters.AddRange(parametros.ToArray())
                    connection.Open()
                    command.ExecuteNonQuery()
                End Using
            End Using
            Return "Cliente actualizado correctamente."
        Catch ex As Exception
            Return "Error al actualizar el cliente: " & ex.Message
        End Try
    End Function

End Class
