<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormEntrega.aspx.vb" Inherits="ProyectoFinal_II46.FormEntrega" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .btn-hover-move {
        transition: transform 0.5s ease, box-shadow 0.3s;
    }

    .btn-hover-move:hover {
        transform: translateY(-3px) scale(1.03);
        box-shadow: 0 6px 15px rgba(0,0,0,0.15);
    }

    .card-custom {
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.07);
        padding: 20px;
        margin-bottom: 20px;
    }

    .section-title {
        font-weight: 600;
        margin-bottom: 15px;
    }
</style>

<asp:HiddenField ID="Editando" runat="server" />

<div class="container">

    <!-- Titulo principal -->
    <div class="text-center mb-4">
        <h2 class="fw-bold">Mensajería RapidiTico 🇨🇷</h2>
        <h4 class="text-secondary">Registro de Entregas</h4>
    </div>
    <div class="card card-custom">
        <h5 class="section-title">Datos de la Entrega</h5>
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Seleccione Paquete</label>
                <asp:DropDownList ID="ddlPaquete" CssClass="form-control" runat="server"></asp:DropDownList></div>
            <div class="col-md-6">
                <label class="form-label">Seleccione Repartidor</label>
                <asp:DropDownList ID="ddlRepartidor" CssClass="form-control" runat="server"></asp:DropDownList></div>
            <div class="col-md-6">
                <label class="form-label">ID del Paquete</label>
                <asp:TextBox ID="txtIdPaquete" CssClass="form-control" runat="server" />
            </div>
            <div class="col-md-6">
                <label class="form-label">ID del Repartidor</label>
                <asp:TextBox ID="txtIdRepartidor" CssClass="form-control" runat="server" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Fecha de Entrega</label>
                <asp:TextBox ID="txtFechaEntrega" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label class="form-label">Estado de la Entrega</label>
                <asp:DropDownList ID="ddlEstadoEntrega" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Seleccione estado" Value="" />
                    <asp:ListItem Text="Pendiente" Value="Pendiente" />
                    <asp:ListItem Text="En Camino" Value="En Camino" />
                    <asp:ListItem Text="Entregado" Value="Entregado" />
                    <asp:ListItem Text="Cancelado" Value="Cancelado" />
                </asp:DropDownList>
            </div>
            <div class="col-12">
                <label class="form-label">Observaciones</label>
                <asp:TextBox ID="txtObservaciones" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="mt-4 d-flex gap-2 flex-wrap">
            <asp:Button ID="btnCrear" runat="server" CssClass="btn btn-success btn-hover-move" Text="Ingresar Nueva Entrega" OnClick="btnCrear_Click" />
            <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Guardar" OnClick="btnGuardar_Click" />
            <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Actualizar" OnClick="btnActualizar_Click" />
            <asp:Button ID="btnBorrar" runat="server" CssClass="btn btn-danger btn-hover-move" Text="Borrar" OnClick="btnBorrar_Click" />
            <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-secondary btn-hover-move" Text="Cancelar" OnClick="btnCancelar_Click" />
        </div>
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-success fw-bold mt-3"></asp:Label>
    </div>
    <div class="card card-custom">
        <h5 class="section-title">Listado de Entregas</h5>
        <asp:GridView ID="GvEntregas"
            CssClass="table table-striped table-hover table-success"
            runat="server"
            AutoGenerateColumns="False"
            DataSourceID="SqlDataSource4"
            OnRowDeleting="GvEntregas_RowDeleting"
            OnRowUpdating="GvEntregas_RowUpdating"
            OnRowCancelingEdit="GvEntregas_RowCancelingEdit"
            OnSelectedIndexChanged="GvEntregas_SelectedIndexChanged"
            DataKeyNames="IdEntrega">
            <Columns>
                <asp:CommandField ShowSelectButton="true" ControlStyle-CssClass="btn btn-success btn-sm" />
                <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="btn btn-primary btn-sm" />
                <asp:BoundField DataField="IdEntrega" HeaderText="IdEntrega" Visible="false" />
                <asp:BoundField DataField="IdPaquete" HeaderText="Paquete" />
                <asp:BoundField DataField="IdRepartidor" HeaderText="Repartidor" />
                <asp:BoundField DataField="FechaEntrega" HeaderText="Fecha" />
                <asp:BoundField DataField="EstadoEntrega" HeaderText="Estado" />
                <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" />
                <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="btn btn-danger btn-sm" />
            </Columns>
        </asp:GridView>
    </div>
    <div class="card card-custom">
        <h5 class="section-title">Filtrar Entregas</h5>
        <div class="row g-3">
            <div class="col-md-6">
                <asp:DropDownList ID="ddlEstadoFiltro" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Seleccione estado" Value="" />
                    <asp:ListItem Text="Pendiente" Value="Pendiente" />
                    <asp:ListItem Text="En Camino" Value="En Camino" />
                    <asp:ListItem Text="Entregado" Value="Entregado" />
                    <asp:ListItem Text="Cancelado" Value="Cancelado" />
                </asp:DropDownList>
            </div>
            <div class="col-md-6 d-flex gap-2">
                <asp:Button ID="btnFiltrar" runat="server" CssClass="btn btn-info btn-hover-move" Text="Filtrar" OnClick="btnFiltrar_Click" />
                <asp:Button ID="btnHistorial" runat="server" CssClass="btn btn-warning btn-hover-move" Text="Ver Historial" OnClick="btnHistorial_Click" />
            </div>
        </div>
    </div>
    <div class="card card-custom">
        <h5 class="section-title">Historial del Repartidor</h5>
        <asp:GridView ID="GvHistorial" CssClass="table table-striped table-hover table-info"
                      runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="IdEntrega" HeaderText="Entrega" />
                <asp:BoundField DataField="IdPaquete" HeaderText="Paquete" />
                <asp:BoundField DataField="FechaEntrega" HeaderText="Fecha" />
                <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" />
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
        ConnectionString="<%$ ConnectionStrings:ProyectoFinal_II46ConnectionString %>" ProviderName="<%$ ConnectionStrings:ProyectoFinal_II46ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Entrega]">
    </asp:SqlDataSource>
</div>
</asp:Content>
