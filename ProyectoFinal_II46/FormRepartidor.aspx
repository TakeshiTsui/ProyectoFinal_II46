<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormRepartidor.aspx.vb" Inherits="ProyectoFinal_II46.FormRepartidor" MaintainScrollPositionOnPostBack="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .btn-hover-move {
        transition: transform 0.5s ease, box-shadow 0.2s;
    }

        .btn-hover-move:hover {
            transform: translateY(-4px) scale(1.04);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
        }
</style>
<asp:HiddenField ID="Editando" runat="server" />
<div class="container d-flex flex-column mb-3 gap-2">
    <section>
        <h1> Mensajeria RapidiTico 🇨🇷</h1>
        <h5> Ingrese datos del repartidor</h5>
    </section>
    <asp:Button ID="btnCrear" runat="server" CssClass="btn btn-success" Text="Crear Nuevo Repartidor" OnClick="btnCrear_Click" />   
    <asp:TextBox ID="txtNombre" CssClass="form-control" Placeholder="Nombre" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtApellido" CssClass="form-control" Placeholder="Apellido" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtTelefono" CssClass="form-control" Placeholder="Teléfono" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtVehiculo" CssClass="form-control" Placeholder="Vehículo" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtPlacaVehiculo" CssClass="form-control" Placeholder="Placa del Vehículo" runat="server"></asp:TextBox>
    <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Guardar" OnClick="btnGuardar_Click" />
    <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Actualizar" OnClick="btnActualizar_Click" />
    <asp:Button ID="btnBorrar" runat="server" CssClass="btn btn-danger" Text="Borrar" OnClick="btnBorrar_Click" />
    <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-secondary" Text="Cancelar" OnClick="btnCancelar_Click" />
    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
</div>
<asp:GridView ID="GvRepartidores" CssClass="table table-striped table-hover table-success" runat="server" AutoGenerateColumns="False"
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
