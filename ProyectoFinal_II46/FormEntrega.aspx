<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormEntrega.aspx.vb" Inherits="ProyectoFinal_II46.FormEntrega" %>
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
        <h3> Mensajería RapidiTico 🇨🇷</h3>
        <h5> Registro de Entregas</h5>
    </section>
    <asp:Button ID="btnCrear" runat="server" CssClass="btn btn-success btn-hover-move" Text="Ingresar Nueva Entrega" OnClick="btnCrear_Click" />
    <asp:DropDownList ID="ddlPaquete" CssClass="form-control" runat="server"></asp:DropDownList>
    <asp:DropDownList ID="ddlRepartidor" CssClass="form-control" runat="server"></asp:DropDownList>
    <asp:TextBox ID="txtFechaEntrega" CssClass="form-control" Placeholder="Fecha de Entrega" TextMode="Date" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtObservaciones" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="Observaciones" runat="server"></asp:TextBox>
    <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Guardar" OnClick="btnGuardar_Click" />
    <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-primary btn-hover-move"/>
    <asp:Button ID="btnBorrar" runat="server" CssClass="btn btn-danger" Text="Borrar" OnClick="btnBorrar_Click" />
    <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-secondary" Text="Cancelar" OnClick="btnCancelar_Click" />
    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>

    <hr />
    <h5>Filtrar por Estado del Paquete</h5>

    <asp:DropDownList ID="ddlEstadoFiltro" runat="server" CssClass="form-control">
        <asp:ListItem Text="Todos" Value=""></asp:ListItem>
        <asp:ListItem Text="Pendiente" Value="Pendiente"></asp:ListItem>
        <asp:ListItem Text="En Camino" Value="En Camino"></asp:ListItem>
        <asp:ListItem Text="Entregado" Value="Entregado"></asp:ListItem>
        <asp:ListItem Text="Cancelado" Value="Cancelado"></asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="btnFiltrar" runat="server" CssClass="btn btn-info btn-hover-move" Text="Filtrar" OnClick="btnFiltrar_Click" />
    <asp:Button ID="btnHistorial" runat="server" CssClass="btn btn-warning btn-hover-move" Text="Ver Historial" OnClick="btnHistorial_Click" />

</div>

<asp:GridView ID="GvEntregas" CssClass="table table-striped table-hover table-success" 
              runat="server" AutoGenerateColumns="False"
              OnRowDeleting="GvEntregas_RowDeleting"
              OnRowUpdating="GvEntregas_RowUpdating"
              OnRowCancelingEdit="GvEntregas_RowCancelingEdit"
              OnSelectedIndexChanged="GvEntregas_SelectedIndexChanged"
              DataKeyNames="IdEntrega">

    <Columns>
        <asp:CommandField ShowSelectButton="true" ControlStyle-CssClass="btn btn-success" />
        <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="btn btn-primary" />

        <asp:BoundField DataField="IdEntrega" HeaderText="IdEntrega" ReadOnly="True" />
        <asp:BoundField DataField="IdPaquete" HeaderText="IdPaquete" />
        <asp:BoundField DataField="IdRepartidor" HeaderText="IdRepartidor" />
        <asp:BoundField DataField="FechaEntrega" HeaderText="FechaEntrega" />
        <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" />

        <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="btn btn-danger" />
    </Columns>
</asp:GridView>

<hr />

<h5>Historial del Repartidor</h5>

<asp:GridView ID="GvHistorial" CssClass="table table-striped table-hover table-info"
              runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="IdEntrega" HeaderText="IdEntrega" />
        <asp:BoundField DataField="IdPaquete" HeaderText="Paquete" />
        <asp:BoundField DataField="FechaEntrega" HeaderText="Fecha" />
        <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" />
    </Columns>
</asp:GridView>

</asp:Content>
