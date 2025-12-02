Imports System.Data.SqlClient

Public Class BdRepartidor
    Private ReadOnly connectionString As String = ConfigurationManager.ConnectionStrings("ProyectoFinal_II46ConnectionString").ConnectionString
    Private ReadOnly DbHelper As New DbHelper() 'clase para mejorar conexion y manejo de errores
    Public Function create(repartidor As Repartidor) As Boolean
        Try
            Dim sql As String = "INSERT INTO Repartidor (Nombre, Apellido, Telefono, Vehiculo, PlacaVehiculo) 
                               VALUES (@Nombre, @Apellido, @Telefono, @Vehiculo, @PlacaVehiculo)"
            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@Nombre", repartidor.Nombre),
                New SqlParameter("@Apellido", repartidor.Apellido),
                New SqlParameter("@Telefono", repartidor.Telefono),
                New SqlParameter("@Vehiculo", repartidor.Vehiculo),
                New SqlParameter("@PlacaVehiculo", repartidor.PlacaVehiculo)
            }
            DbHelper.ExecuteNonQuery(sql, parametros)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function
    Public Function update(repartidor As Repartidor)
        Try
            Dim sql As String = "UPDATE Repartidor 
                               SET Nombre = @Nombre, Apellido = @Apellido, Telefono = @Telefono, 
                                   Vehiculo = @Vehiculo, PlacaVehiculo = @PlacaVehiculo
                               WHERE IdRepartidor = @IdRepartidor"
            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@IdRepartidor", repartidor.IdRepartidor),
                New SqlParameter("@Nombre", repartidor.Nombre),
                New SqlParameter("@Apellido", repartidor.Apellido),
                New SqlParameter("@Telefono", repartidor.Telefono),
                New SqlParameter("@Vehiculo", repartidor.Vehiculo),
                New SqlParameter("@PlacaVehiculo", repartidor.PlacaVehiculo)
            }
            DbHelper.ExecuteNonQuery(sql, parametros)
            Return " ✅ Repartidor actualizado correctamente "
        Catch ex As Exception
            Return "⚠️ Error al actulizar al repartidor, favor intentar nuevamente"
        End Try
    End Function
    Public Function delete(idRepartidor As Integer)
        Try
            Dim sql As String = "DELETE FROM Repartidor WHERE IdRepartidor = @IdRepartidor"
            Dim parametros As New List(Of SqlParameter) From {
            New SqlParameter("@IdRepartidor", idRepartidor)
            }
            DbHelper.ExecuteNonQuery(sql, Parametros)
            Return " ✅ Repartidor eliminado correctamente. "
        Catch ex As Exception
            Return " ⚠️ Error al eliminar el cliente: " & ex.Message
        End Try
    End Function
    Public Function listarRepartidores() As DataTable
        Try
            Dim sql As String = "SELECT *, CONCAT(IdRepartidor, ' ', Nombre, ' ', Apellido, ' ') NombreCompleto FROM Repartidor"
            Return DbHelper.ExecuteQuery(sql, Nothing)
        Catch ex As Exception
            Return New DataTable()
        End Try
    End Function
End Class
