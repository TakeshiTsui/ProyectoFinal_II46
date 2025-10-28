Public Class Repartidor
    Private _idRepartidor As Integer
    Private _nombre As String
    Private _apellido As String
    Private _telefono As String
    Private _vehiculo As String
    Private _placaVehiculo As String
    Public Property IdRepartidor As Integer
        Get
            Return _idRepartidor
        End Get
        Set(value As Integer)
            _idRepartidor = value
        End Set
    End Property

    Public Property Nombre As String
        Get
            Return _nombre
        End Get
        Set(value As String)
            _nombre = value
        End Set
    End Property

    Public Property Apellido As String
        Get
            Return _apellido
        End Get
        Set(value As String)
            _apellido = value
        End Set
    End Property

    Public Property Telefono As String
        Get
            Return _telefono
        End Get
        Set(value As String)
            _telefono = value
        End Set
    End Property

    Public Property Vehiculo As String
        Get
            Return _vehiculo
        End Get
        Set(value As String)
            _vehiculo = value
        End Set
    End Property

    Public Property PlacaVehiculo As String
        Get
            Return _placaVehiculo
        End Get
        Set(value As String)
            _placaVehiculo = value
        End Set
    End Property
    Public Sub New()

    End Sub
    Public Sub New(idRepartidor As Integer, nombre As String, apellido As String, telefono As String, vehiculo As String, placaVehiculo As String)
        Me.IdRepartidor = idRepartidor
        Me.Nombre = nombre
        Me.Apellido = apellido
        Me.Telefono = telefono
        Me.Vehiculo = vehiculo
        Me.PlacaVehiculo = placaVehiculo
    End Sub
End Class
