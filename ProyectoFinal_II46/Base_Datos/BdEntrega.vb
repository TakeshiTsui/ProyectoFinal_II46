Imports System.Data.SqlClient

Public Class BdEntrega
    Public ReadOnly connectionString As String = ConfigurationManager.ConnectionStrings("ProyectoFinal_II46ConnectionString").ConnectionString
    Public ReadOnly DbHelper As New DbHelper() 'clase para mejorar conexion y manejo de errores
    Public Function create(entrega As Entrega) As Boolean
        Try
            Dim sql As String = "INSERT INTO Entrega (IdPaquete, IdRepartidor, FechaEntrega, EstadoEntrega,Observaciones)
                                 VALUES (@IdPaquete, @IdRepartidor, @FechaEntrega, @EstadoEntrega,@Observaciones)"
            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@IdPaquete", entrega.IdPaquete),
                New SqlParameter("@IdRepartidor", entrega.IdRepartidor),
                New SqlParameter("@FechaEntrega", entrega.FechaEntrega),
                New SqlParameter("@EstadoEntrega", entrega.EstadoEntrega),
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
                    EstadoEntrega = @EstadoEntrega,
                    Observaciones = @Observaciones
                 WHERE IdEntrega = @IdEntrega"
            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@IdPaquete", entrega.IdPaquete),
                New SqlParameter("@IdRepartidor", entrega.IdRepartidor),
                New SqlParameter("@FechaEntrega", entrega.FechaEntrega),
                New SqlParameter("@EstadoEntrega", entrega.EstadoEntrega),
                New SqlParameter("@Observaciones", entrega.Observaciones),
                New SqlParameter("@IdEntrega", entrega.IdEntrega)
            }
            DbHelper.ExecuteNonQuery(sql, parametros)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function
End Class
