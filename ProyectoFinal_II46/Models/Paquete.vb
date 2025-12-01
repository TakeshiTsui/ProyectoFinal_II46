Public Class Paquete
    Inherits Cliente
    Private _idPaquete As Integer
    Private _idCliente As Integer
    Private _nombrepaquete As String
    Private _descripcion As String
    Private _precio As Decimal
    Private _Peso As Decimal
    Private _fechaEnvio As Date
    Private _estado As String
    Private _destino As String
    Public Sub New()
        MyBase.New()
    End Sub
    Public Sub New(idPaquete As Integer, nombrepaquete As String, descripcion As String, precio As Decimal, peso As Decimal, fechaEnvio As Date, idCliente As Integer, estado As String, destino As String, cliente As Cliente)
        MyBase.New(cliente.Idcliente, cliente.Nombre, cliente.Apellido, cliente.Telefono, cliente.Direccion, cliente.Correo)
        Me.IdPaquete = idPaquete
        Me.Idcliente = idCliente
        Me.Descripcion = descripcion
        Me.Nombrepaquete = nombrepaquete
        Me.Precio = precio
        Me.Peso = peso
        Me.FechaEnvio = fechaEnvio
        Me.Estado = estado
        Me.Destino = destino
    End Sub
    Public Sub New(idPaquete As Integer, idClientes As Integer, nombrepaquete As String, descripcion As String, precio As Decimal, peso As Decimal, fechaEnvio As Date, estado As String, destino As String)
        Me.IdPaquete = idPaquete
        Me.IdClientes = idClientes
        Me.Nombrepaquete = nombrepaquete
        Me.Descripcion = descripcion
        Me.Precio = precio
        Me.Peso = peso
        Me.FechaEnvio = fechaEnvio
        Me.Estado = estado
        Me.Destino = destino
    End Sub

    Public Property IdPaquete As Integer
        Get
            Return _idPaquete
        End Get
        Set(value As Integer)
            _idPaquete = value
        End Set
    End Property

    Public Property IdClientes As Integer
        Get
            Return _idCliente
        End Get
        Set(value As Integer)
            _idCliente = value
        End Set
    End Property
    Public Property Nombrepaquete As String
        Get
            Return _nombrepaquete
        End Get
        Set(value As String)
            _nombrepaquete = value
        End Set
    End Property

    Public Property Descripcion As String
        Get
            Return _descripcion
        End Get
        Set(value As String)
            _descripcion = value
        End Set
    End Property
    Public Property Precio As Decimal
        Get
            Return _precio
        End Get
        Set(value As Decimal)
            _precio = value
        End Set
    End Property

    Public Property Peso As Decimal
        Get
            Return _Peso
        End Get
        Set(value As Decimal)
            _Peso = value
        End Set
    End Property

    Public Property FechaEnvio As Date
        Get
            Return _fechaEnvio
        End Get
        Set(value As Date)
            _fechaEnvio = value
        End Set
    End Property

    Public Property Estado As String
        Get
            Return _estado
        End Get
        Set(value As String)
            _estado = value
        End Set
    End Property
    Public Property Destino As String
        Get
            Return _destino
        End Get
        Set(value As String)
            _destino = value
        End Set
    End Property
End Class
