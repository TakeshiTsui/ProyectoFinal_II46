<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormCliente.aspx.vb" Inherits="ProyectoFinal_II46.FormCliente" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background: linear-gradient(135deg, #f4a261, #e76f51);
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        .form-card {
            max-width: 900px;
            margin: 40px auto;
            padding: 30px;
            border-radius: 14px;
            background: #ffffff;
            box-shadow: 0 8px 24px rgba(0,0,0,0.15);
        }
        form.title{
            font-weight: 700;
            letter-spacing: 0.5px;
        }
        .form-control{
            border-radius: 10px;
            padding: 10px 14px;
            transition: border-color .3s, box-shadow .3s;
        }
        .form-control:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 0 0.15rem rgba(13,110,253,.25)
        }
        .btn-hover-move {
            border-radius: 10px;
            transition: transform 0.5s ease, box-shadow 0.2s;
        }

            .btn-hover-move:hover {
                transform: translateY(-3px) scale(1.04);
                box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
            }
        .mensaje {
            font-weight: 600;
            margin-top: 12px;
            text-align: center;
        }
        .table{
            margin-top: 30px;
            border-radius: 12px;
            overflow: hidden;
        }
        .clientes-container {
            max-width: 1500px;
            margin: 60px auto;
            padding: 35px;
            border-radius: 20px;
            background: #ffffff;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
    </style>
    <asp:HiddenField ID="Editando" runat="server" />
    <div class="text-center mb-4">
        <h2 class="fw-bold">Mensajería RapidiTico 🇨🇷</h2>
        <p class="text-muted">👤 Gestión de Clientes</p>

        <div class="d-flex justify-content-center mb-4">
            <asp:Button ID="btnCrear" runat="server" CssClass="btn btn-success btn-hover-move px-4" Text="Crear Nuevo Cliente" OnClick="btnCrear_Click" />
        </div>

    </div>
    <div class="row g-3">
        <div class="col-md-6">
            <asp:TextBox ID="txtNombre" CssClass="form-control" PlaceHolder="Nombre" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtApellido" CssClass="form-control" PlaceHolder="Apellido" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtTelefono" CssClass="form-control" Placeholder="Teléfono" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtDireccion" CssClass="form-control" Placeholder="Dirección" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtCorreo" CssClass="form-control" Placeholder="Correo electrónico" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="d-flex justify-content-end gap-2 mt-4 flex-wrap">
        <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Guardar" OnClick="btnGuardar_Click" />
        <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-warning btn-hover-move" Text="Actualizar" OnClick="btnActualizar_Click" />
        <asp:Button ID="btnBorrar" runat="server" CssClass="btn btn-danger btn-hover-move" Text="Borrar" OnClick="btnBorrar_Click" />
        <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-secondary btn-hover-move" Text="Cancelar" OnClick="btnCancelar_Click" />
    </div>
        <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>

    <asp:GridView ID="GvClientes" CssClass="clientes-container table table-striped table-hover align-middle" runat="server" AutoGenerateColumns="False"
        DataKeyNames="IdCliente" DataSourceID="SqlDataSource3"
        OnRowDeleting="GvClientes_RowDeleting"
        OnRowCancelingEdit="GvClientes_RowCancelingEdit"
        OnRowUpdating="GvClientes_RowUpdating"
        OnSelectedIndexChanged="GvClientes_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="true" ControlStyle-CssClass="btn btn-success" />
            <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="btn btn-primary" />
            <asp:BoundField DataField="IdCliente" HeaderText="IdCliente" ReadOnly="True" SortExpression="IdCliente" InsertVisible="False" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
            <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
            <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
            <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="btn btn-danger"/>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoFinal_II46ConnectionString %>" ProviderName="<%$ ConnectionStrings:ProyectoFinal_II46ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Cliente]"></asp:SqlDataSource>
</asp:Content>
