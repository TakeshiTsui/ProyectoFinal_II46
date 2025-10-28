Public Class Paquete
    Inherits Cliente
    Private _idPaquete As Integer
    Private _idClientes As Integer
    Private _descripcion As String
    Private _Peso As Decimal
    Private _fechaEnvio As Date
    Private _estado As String
    Public Sub New()
        MyBase.New()
    End Sub
    Public Sub New(idPaquete As Integer, descripcion As String, peso As Decimal, fechaEnvio As Date, idCliente As Integer, estado As String, cliente As Cliente)
        MyBase.New(cliente.Idcliente, cliente.Nombre, cliente.Apellido, cliente.Telefono, cliente.Direccion, cliente.Correo)
        Me.IdPaquete = idPaquete
        Me.Idcliente = idCliente
        Me.Descripcion = descripcion
        Me.Peso = peso
        Me.FechaEnvio = fechaEnvio
        Me.Estado = estado
    End Sub
    Public Sub New(idPaquete As Integer, idClientes As Integer, descripcion As String, peso As Decimal, fechaEnvio As Date, estado As String)
        Me.IdPaquete = idPaquete
        Me.IdClientes = idClientes
        Me.Descripcion = descripcion
        Me.Peso = peso
        Me.FechaEnvio = fechaEnvio
        Me.Estado = estado
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
            Return _idClientes
        End Get
        Set(value As Integer)
            _idClientes = value
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
End Class
