Public Class Cliente
    Private _idcliente As Integer
    Private _nombre As String
    Private _apellido As String
    Private _telefono As String
    Private _direccion As String
    Private _correo As String
    Public Property Idcliente As Integer
        Get
            Return _idcliente
        End Get
        Set(value As Integer)
            _idcliente = value
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
    Public Property Direccion As String
        Get
            Return _direccion
        End Get
        Set(value As String)
            _direccion = value
        End Set
    End Property
    Public Property Correo As String
        Get
            Return _correo
        End Get
        Set(value As String)
            _correo = value
        End Set
    End Property

    Public Sub New()

    End Sub

    Public Sub New(idcliente As Integer, nombre As String, apellido As String, telefono As String, direccion As String, correo As String)
        Me.Idcliente = idcliente
        Me.Nombre = nombre
        Me.Apellido = apellido
        Me.Telefono = telefono
        Me.Direccion = direccion
        Me.Correo = correo
    End Sub
End Class
