<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormPaquete.aspx.vb" Inherits="ProyectoFinal_II46.FormPaquete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    body {
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        min-height: 100vh;
        margin: 0;
        padding: 0;
    }

    .card-custom {
        border-radius: 12px;
        padding: 25px;
        background: #f8fafc;
        box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        border-left: 5px solid #0d6efd;
    }
    .section-title {
        font-weight: bold;
        margin-top: 25px;
        border-bottom: 2px solid #e0e0e0;
        padding-bottom: 6px;
    }
    .btn-hover-move {
        transition: transform 0.3s ease, box-shadow 0.2s;
    }
    .btn-hover-move:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.12);
    }
    .paquetes-container {
        max-width: 1500px;
        margin: 60px auto;
        padding: 35px;
        background: #ffffff;
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
    }
</style>
<asp:HiddenField ID="Editando" runat="server" />
<div class="container mt-4 mb-4">
    <div class="card-custom">
        <h3 class="text-primary">📦 Registro de Paquetes - RapidiTico</h3>
        <p class="text-muted">Complete la información del paquete antes de guardarlo.</p>
        <asp:Button ID="btnCrear" runat="server" CssClass="btn btn-success btn-hover-move mb-3" Text="Nuevo Paquete" OnClick="btnCrear_Click" />
        <h5 class="section-title">Información General</h5>
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Cliente</label>
                <asp:DropDownList ID="ddlCliente" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="col-md-6">
                <label class="form-label">ID Cliente</label>
                <asp:TextBox ID="txtIdClientes" CssClass="form-control" PlaceHolder="N° de Cliente" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label class="form-label">Nombre del Paquete</label>
                <asp:TextBox ID="txtNombrePaquete" CssClass="form-control" PlaceHolder="Nombre del Paquete" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label class="form-label">Descripción</label>
                <asp:TextBox ID="txtDescripcion" CssClass="form-control" PlaceHolder="Descripción" runat="server"></asp:TextBox>
            </div>
        </div>
        <h5 class="section-title">Precio y Envío</h5>
        <div class="row g-3">
            <div class="col-md-4">
                <label class="form-label">Precio</label>
                <asp:TextBox ID="txtPrecio" CssClass="form-control" PlaceHolder="Precio" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Peso</label>
                <asp:TextBox ID="txtPeso" CssClass="form-control" Placeholder="Peso" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Fecha de Envío</label>
                <asp:TextBox ID="txtFechaEnvio" CssClass="form-control" Placeholder="Fecha de envío" TextMode="Date" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label class="form-label">Estado del Paquete</label>
                <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Pendiente" Value="Pendiente"></asp:ListItem>
                    <asp:ListItem Text="Registrado" Value="Registrado"></asp:ListItem>
                    <asp:ListItem Text="En Bodega" Value="En Bodega"></asp:ListItem>
                    <asp:ListItem Text="En Preparación" Value="En Preparacion"></asp:ListItem>
                    <asp:ListItem Text="Listo para Envío" Value="Listo para Envio"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-6">
                <label class="form-label">Dirección de Envío</label>
                <asp:TextBox ID="txtDestino" CssClass="form-control" PlaceHolder="Dirección de envío" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="mt-4 d-flex gap-2">
            <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Guardar" OnClick="btnGuardar_Click" />
            <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-warning btn-hover-move" Text="Actualizar" OnClick="btnActualizar_Click" />
            <asp:Button ID="btnBorrar" runat="server" CssClass="btn btn-danger btn-hover-move" Text="Borrar" OnClick="btnBorrar_Click" />
            <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-secondary btn-hover-move" Text="Cancelar" OnClick="btnCancelar_Click" />
        </div>
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-success mt-3"></asp:Label>
    </div>
</div>
<asp:GridView ID="GvPaquete"
    CssClass="paquetes-container table table-striped table-bordered table-hover mt-4"
    runat="server" AutoGenerateColumns="False"
    DataKeyNames="IdCliente" DataSourceID="SqlDataSource5"
    OnRowDeleting="GvPaquete_RowDeleting"
    OnRowCancelingEdit="GvPaquete_RowCancelingEdit"
    OnRowUpdating="GvPaquete_RowUpdating"
    OnSelectedIndexChanged="GvPaquete_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="true" ControlStyle-CssClass="btn btn-success" />
        <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="btn btn-primary" />
        <asp:BoundField DataField="IdPaquete" HeaderText="ID" ReadOnly="True" />
        <asp:BoundField DataField="IdCliente" HeaderText="Cliente" ReadOnly="True" />
        <asp:BoundField DataField="NombrePaquete" HeaderText="Paquete" />
        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
        <asp:BoundField DataField="Precio" HeaderText="Precio" />
        <asp:BoundField DataField="Peso" HeaderText="Peso" />
        <asp:BoundField DataField="FechaEnvio" HeaderText="Fecha Envío" />
        <asp:BoundField DataField="Estado" HeaderText="Estado" />
        <asp:BoundField DataField="Destino" HeaderText="Destino" />
        <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="btn btn-danger" />
    </Columns>
</asp:GridView>

<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoFinal_II46ConnectionString %>" ProviderName="<%$ ConnectionStrings:ProyectoFinal_II46ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Paquete]"></asp:SqlDataSource>

</asp:Content>
