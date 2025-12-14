<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MisEntregas.aspx.vb" Inherits="ProyectoFinal_II46.MisEntregas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-5">
        <h3 class="fw-bold mb-3">Mis Entregas</h3>
        <p class="text-muted">Consulta el estado de tus envíos</p>

        <asp:GridView ID="gvMisEntregas" runat="server" CssClass="table table-hover table-striped aling-middle" AutoGenerateColumns="true">
            <Columns>
                <asp:BoundField DataField="IdPaquete" HeaderText="N° de Paquete" />
                <asp:BoundField DataField="Destino" HeaderText="Destino" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" />
                <asp:BoundField DataField="FechaEnvio" HeaderText="Fecha de Envío" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="FechaEntrega" HeaderText="Fecha de Entrega" DataFormatString="{0:dd/MM/yyyy}" />
                </Columns>
        </asp:GridView>
    </div>
</asp:Content>
