Imports System.Data.SqlClient

Public Class BdEntrega
    Public ReadOnly connectionString As String = ConfigurationManager.ConnectionStrings("ProyectoFinal_II46ConnectionString").ConnectionString
    Public ReadOnly DbHelper As New DbHelper() 'clase para mejorar conexion y manejo de errores
    Public Function create(entrega As Entrega) As Boolean
        Try
            Dim sql As String = "INSERT INTO Entrega (IdPaquete, IdRepartidor, FechaEntrega, Observaciones)
                                 VALUES (@IdPaquete, @IdRepartidor, @FechaEntrega, @Observaciones)"
            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@IdPaquete", entrega.IdPaquetes),
                New SqlParameter("@IdRepartidor", entrega.IdRepartidor),
                New SqlParameter("@FechaEntrega", entrega.FechaEntrega),
                New SqlParameter("@Observaciones", entrega.Observaciones)
            }
            DbHelper.ExecuteNonQuery(sql, parametros)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function delete(id As Integer) As String
        Try
            Dim sql As String = "DELETE FROM Entrega WHERE IdEntrega = @IdEntrega"
            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@IdEntrega", id)
            }
            DbHelper.ExecuteNonQuery(sql, parametros)
            Return "Entrega eliminada correctamente."
        Catch ex As Exception
            Return "Error al eliminar la entrega: " & ex.Message
        End Try
    End Function

    Public Function update(entrega As Entrega) As Boolean
        Try
            Dim sql As String =
                "UPDATE Entrega SET 
                    IdPaquete = @IdPaquete,
                    IdRepartidor = @IdRepartidor,
                    FechaEntrega = @FechaEntrega,
                    Observaciones = @Observaciones
                 WHERE IdEntrega = @IdEntrega"
            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@IdPaquete", entrega.IdPaquetes),
                New SqlParameter("@IdRepartidor", entrega.IdRepartidor),
                New SqlParameter("@FechaEntrega", entrega.FechaEntrega),
                New SqlParameter("@Observaciones", entrega.Observaciones),
                New SqlParameter("@IdEntrega", entrega.IdEntrega)
            }
            DbHelper.ExecuteNonQuery(sql, parametros)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function filtraporentrega(Estado As String) As DataTable
        Try
            Dim sql As String = "SELECT e.IdEntrega, e.IdPaquete, e.IdRepartidor, e.FechaEntrega, e.Observaciones,
                                 p.NombrePaquete, p.Descripcion, p.Precio, p.Peso, p.FechaEnvio, p.Estado, p.Destino
                                 FROM Entrega e
                                 JOIN Paquete p ON e.IdPaquete = p.IdPaquete
                                 WHERE p.Estado = @Estado"
            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@Estado", Estado)
            }
            Return DbHelper.ExecuteQuery(sql, parametros)
        Catch ex As Exception
            Return New DataTable()
        End Try
    End Function
    Public Function HistorialRepartidor(idRepartidor As Integer) As DataTable
        Try
            Dim sql As String = "SELECT e.IdEntrega, e.IdPaquete, e.IdRepartidor, e.FechaEntrega, e.Observaciones,
                                 p.NombrePaquete, p.Descripcion, p.Precio, p.Peso, p.FechaEnvio, p.Estado, p.Destino
                                 FROM Entrega e
                                 JOIN Paquete p ON e.IdPaquete = p.IdPaquete
                                 WHERE e.IdRepartidor = @IdRepartidor"
            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@IdRepartidor", idRepartidor)
            }
            Return DbHelper.ExecuteQuery(sql, parametros)
        Catch ex As Exception
            Return New DataTable()
        End Try
    End Function
    Public Function listarPaquetes() As DataTable
        Try
            Dim sql As String = "SELECT IdPaquete, NombrePaquete FROM Paquete"
            Return DbHelper.ExecuteQuery(sql, Nothing)
        Catch ex As Exception
            Return New DataTable()
        End Try
    End Function
    Public Function listarRepartidores() As DataTable
        Try
            Dim sql As String = "SELECT IdRepartidor, NombreRepartidor FROM Repartidor"
            Return DbHelper.ExecuteQuery(sql, Nothing)
        Catch ex As Exception
            Return New DataTable()
        End Try
    End Function
End Class
