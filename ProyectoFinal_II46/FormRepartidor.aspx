<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormRepartidor.aspx.vb" Inherits="ProyectoFinal_II46.FormRepartidor" MaintainScrollPositionOnPostBack="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background: linear-gradient(135deg, #4a90e2, #50c9c3);
            min-height: 100vh;
            padding: 0;
            margin: 0;
        }

        /*Card Principal*/
        .form-card {
            max-width: 900px;
            margin: 40px auto;
            padding: 30px;
            border-radius: 14px;
            background: #ffffff;
            box-shadow: 0 8px 24px rgba(0,0,0,0.15);
        }

        /*Titulo*/
        form.title{
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        /*Inputs*/
        .form-control{
            border-radius: 10px;
            padding: 10px 14px;
            transition: border-color .3s, box-shadow .3s;
        }

        .form-control:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 0 0.15rem rgba(13,110,253,.25)
        }

        /*Animacion de botones*/
        .btn-hover-move {
        transition: transform 0.5s ease, box-shadow 0.2s;
        }

        .btn-hover-move:hover {
            transform: translateY(-4px) scale(1.04);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
        }
        /*Formato de mensajes*/
        .mensaje{
            font-weight: 600;
            margin-top: 10px;
        }
        /*Gridview*/
        .table{
            margin-top: 30px;
            border-radius: 12px;
            overflow: hidden;
        }
        .repartidores-container {
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
        <h2 class="form-title">Mensajería RapidiTico 🇨🇷</h2>
        <h6 class="text-muted mb-0">🛵 Registro y administración de repartidores 🏍</h6>
    </div>
    <div class="d-flex justify-content-center mb-4">
        <asp:Button ID="btnCrear" runat="server" CssClass="btn btn-success btn-hover-move px-4" Text="Crear Nuevo Repartidor" OnClick="btnCrear_Click" />
    </div>
    <div class="row g-3">
        <div class="col-md-6">
            <asp:TextBox ID="txtNombre" CssClass="form-control" Placeholder="Nombre" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtApellido" CssClass="form-control" Placeholder="Apellido" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtTelefono" CssClass="form-control" Placeholder="Teléfono" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtVehiculo" CssClass="form-control" Placeholder="Vehículo" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-12">
            <asp:TextBox ID="txtPlacaVehiculo" CssClass="form-control" Placeholder="Placa del Vehículo" runat="server"></asp:TextBox>
        </div>
    </div>
<div class="d-flex justify-content-end gap-2 mt-4 flex-wrap">
    <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Guardar" OnClick="btnGuardar_Click" />
    <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-warning text-white btn-hover-move" Text="Actualizar" OnClick="btnActualizar_Click" />
    <asp:Button ID="btnBorrar" runat="server" CssClass="btn btn-danger btn-hover-move" Text="Borrar" OnClick="btnBorrar_Click" />
    <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-secondary btn-hover-move" Text="Cancelar" OnClick="btnCancelar_Click" />
</div>
    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>

<asp:GridView ID="GvRepartidores" CssClass="repartidores-container table table-striped table-hover aling-middle" runat="server" AutoGenerateColumns="False"
    DataKeyNames="IdRepartidor" DataSourceID="SqlDataSource3"
    OnRowDeleting="GvRepartidores_RowDeleting"
    OnRowCancelingEdit="GvRepartidores_RowCancelingEdit"
    OnRowUpdating="GvRepartidores_RowUpdating"
    OnSelectedIndexChanged="GvRepartidores_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="False" ControlStyle-CssClass="btn btn-success" />
        <asp:CommandField ShowEditButton="False" ControlStyle-CssClass="btn btn-primary" />
         <asp:BoundField DataField="IdRepartidor" HeaderText="ID" Visible="False" ReadOnly="True" SortExpression="IdRepartidor" />
         <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
         <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
         <asp:BoundField DataField="Telefono" HeaderText="Teléfono" SortExpression="Telefono" />
         <asp:BoundField DataField="Vehiculo" HeaderText="Vehículo" SortExpression="Vehiculo" />
         <asp:BoundField DataField="PlacaVehiculo" HeaderText="Placa" SortExpression="PlacaVehiculo" />
        <asp:CommandField ShowDeleteButton="False" ControlStyle-CssClass="btn btn-danger"/>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoFinal_II46ConnectionString %>" ProviderName="<%$ ConnectionStrings:ProyectoFinal_II46ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Repartidor]"></asp:SqlDataSource>
</asp:Content>
