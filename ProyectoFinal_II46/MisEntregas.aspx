<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MisEntregas.aspx.vb" Inherits="ProyectoFinal_II46.MisEntregas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }
        .entregas-container {
            max-width: 1140px;
            margin: 60px auto;
            padding: 35px;
            border-radius: 20px;
            background: #ffffff;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
    </style>
    
    <div class="entregas-container">
        <h3 class="fw-bold mb-3">📋 Historial de Entregas</h3>
        <p class="text-muted">Consulta el estado de tus envíos</p>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label">Estado de la Entrega</label>
                <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-select" AutoPostBack="true">
                    <asp:ListItem Text="--Todos los estados--" Value=" " />
                    <asp:ListItem Text="Pendiente" Value="Pendiente" />
                    <asp:ListItem Text="En Camino" Value="En Camino" />
                    <asp:ListItem Text="Entregado" Value="Entregado" />
                    <asp:ListItem Text="Cancelado" Value="Cancelado" />
                </asp:DropDownList>
            </div>
        </div>
        
        <asp:GridView ID="gvMisEntregas" runat="server" CssClass="table table-hover table-striped aling-middle" AutoGenerateColumns="False" DataKeyNames="IdPaquete" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                <asp:BoundField DataField="IdPaquete" HeaderText="IdPaquete" InsertVisible="False" ReadOnly="True" SortExpression="IdPaquete" Visible="false" />
                <asp:BoundField DataField="NombrePaquete" HeaderText="Nombre del Paquete" SortExpression="NombrePaquete" />
                <asp:BoundField DataField="FechaEnvio" HeaderText="Fecha de Envio" SortExpression="FechaEnvio" />
                <asp:BoundField DataField="Destino" HeaderText="Destino" SortExpression="Destino" />
                <asp:BoundField DataField="FechaEntrega" HeaderText="Fecha de Entrega" SortExpression="FechaEntrega" />
                <asp:BoundField DataField="EstadoEntrega" HeaderText="Estado del Paquete" SortExpression="EstadoEntrega" />
                </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoFinal_II46ConnectionString %>" SelectCommand="SELECT Cliente.Nombre, Cliente.Apellido, Paquete.IdPaquete, Paquete.NombrePaquete, Paquete.FechaEnvio, Paquete.Destino, Entrega.FechaEntrega, Entrega.EstadoEntrega FROM Cliente AS Cliente INNER JOIN Paquete AS Paquete ON Cliente.IdCliente = Paquete.IdCliente INNER JOIN Entrega AS Entrega ON Paquete.IdPaquete = Entrega.IdPaquete WHERE (@Estado IS NULL OR @Estado = '' or Entrega.EstadoEntrega = @Estado)">
            <SelectParameters>
               <asp:ControlParameter Name="Estado" ControlID="ddlEstado" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>

        </asp:SqlDataSource>
    </div>

</asp:Content>
