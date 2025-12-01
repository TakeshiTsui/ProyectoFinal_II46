Public Class Entrega
    Inherits Paquete
    Private _idEntrega As Integer
    Private _idPaquetes As Integer
    Private _idRepartidor As Integer
    Private _fechaEntrega As Date
    Private _observaciones As String
    Public Sub New()
        MyBase.New()
    End Sub
    Public Sub New(idEntrega As Integer, idPaquete As Integer, idRepartidor As Integer, fechaEntrega As Date, observaciones As String, paquete As Paquete)
        MyBase.New(paquete.IdPaquete, paquete.Idcliente, paquete.Nombrepaquete, paquete.Descripcion, paquete.Precio, paquete.Peso, paquete.FechaEnvio, paquete.Estado, paquete.Destino)
        Me.IdEntrega = idEntrega
        Me.IdPaquete = idPaquete
        Me.IdRepartidor = idRepartidor
        Me.FechaEntrega = fechaEntrega
        Me.Observaciones = observaciones
    End Sub
    Public Sub New(idEntrega As Integer, idPaquete As Integer, idRepartidor As Integer, fechaEntrega As Date, observaciones As String)
        Me.IdEntrega = idEntrega
        Me.IdPaquete = idPaquete
        Me.IdRepartidor = idRepartidor
        Me.FechaEntrega = fechaEntrega
        Me.Observaciones = observaciones
    End Sub
    Public Property IdEntrega As Integer
        Get
            Return _idEntrega
        End Get
        Set(value As Integer)
            _idEntrega = value
        End Set
    End Property

    Public Property IdPaquetes As Integer
        Get
            Return _idPaquetes
        End Get
        Set(value As Integer)
            _idPaquetes = value
        End Set
    End Property

    Public Property IdRepartidor As Integer
        Get
            Return _idRepartidor
        End Get
        Set(value As Integer)
            _idRepartidor = value
        End Set
    End Property

    Public Property FechaEntrega As Date
        Get
            Return _fechaEntrega
        End Get
        Set(value As Date)
            _fechaEntrega = value
        End Set
    End Property

    Public Property Observaciones As String
        Get
            Return _observaciones
        End Get
        Set(value As String)
            _observaciones = value
        End Set
    End Property

End Class
