Imports System.Data.SqlClient

Public Class BdPaquete
    Public ReadOnly connectionString As String = ConfigurationManager.ConnectionStrings("ProyectoFinal_II46ConnectionString").ConnectionString
    Public ReadOnly DbHelper As New DbHelper() 'clase para mejorar conexion y manejo de errores
    Public Function create(paquete As Paquete) As Boolean
        Try
            Dim sql As String = "INSERT INTO Paquete (IdCliente, NombrePaquete, Descripcion, Precio, Peso, FechaEnvio, Estado, Destino)
                                 VALUES (@IdCliente, @NombrePaquete, @Descripcion, @Precio, @Peso, @FechaEnvio, @Estado,@Destino)"

            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@IdCliente", paquete.IdClientes),
                New SqlParameter("@NombrePaquete", paquete.Nombrepaquete),
                New SqlParameter("@Descripcion", paquete.Descripcion),
                New SqlParameter("@Precio", paquete.Precio),
                New SqlParameter("@Peso", paquete.Peso),
                New SqlParameter("@FechaEnvio", paquete.FechaEnvio),
                New SqlParameter("@Estado", paquete.Estado),
                New SqlParameter("@Destino", paquete.Destino)
            }

            DbHelper.ExecuteNonQuery(sql, parametros)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function
    Public Function delete(id As Integer) As String
        Try
            Dim sql As String = "DELETE FROM Paquete WHERE IdPaquete = @IdPaquete"

            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@IdPaquete", id)
            }

            DbHelper.ExecuteNonQuery(sql, parametros)
            Return "Paquete eliminado correctamente."
        Catch ex As Exception
            Return "Error al eliminar el paquete: " & ex.Message
        End Try
    End Function
    Public Function update(paquete As Paquete) As String
        Try
            Dim sql As String =
                "UPDATE Paquete SET 
                    IdClientes = @IdClientes,
                    NombrePaquete = @NombrePaquete,
                    Descripcion = @Descripcion,
                    Precio = @Precio,
                    Peso = @Peso,
                    FechaEnvio = @FechaEnvio,
                    Estado = @Estado,
                    Destino = @Destino
                 WHERE IdPaquete = @IdPaquete"

            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@IdPaquete", paquete.IdPaquete),
                New SqlParameter("@NombrePaquete", paquete.Nombrepaquete),
                New SqlParameter("@Descripcion", paquete.Descripcion),
                New SqlParameter("@Precio", paquete.Precio),
                New SqlParameter("@Peso", paquete.Peso),
                New SqlParameter("@FechaEnvio", paquete.FechaEnvio),
                New SqlParameter("@Estado", paquete.Estado),
                New SqlParameter("@Destino", paquete.Destino)
            }

            DbHelper.ExecuteNonQuery(sql, parametros)
            Return "Paquete actualizado correctamente."
        Catch ex As Exception
            Return "Error al actualizar el paquete: " & ex.Message
        End Try
    End Function
End Class
