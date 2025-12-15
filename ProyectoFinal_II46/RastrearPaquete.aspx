<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="RastrearPaquete.aspx.vb" Inherits="ProyectoFinal_II46.RastrearPaquete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .tracking-container {
            max-width: 700px;
            margin: 70px auto;
            padding: 40px;
            border-radius: 18px;
            background: white;
            box-shadow: 0 8px 28px rgba(0,0,0,0.25);
            text-align: center;
        }
    </style>
    <div class="tracking-container">
        <h3 class="fw-bold text-center"> Rastrear Paquete</h3>
        <p class="text-muted text-center">Ingresa el número de tu paquete para ver su estado</p>
        <asp:TextBox ID="txtNumeroPaquete" runat="server" CssClass="form-control mb-3" placeholder="N° de Paquete" />
        <asp:Button ID="btnRastrear" Text="Rastrear" CssClass="btn btn-primary w-100" runat="server" onclick="btnRastrear_Click" />
        <asp:Label ID="lblEstado" runat="server" CssClass="mt-4 d-block text-center"></asp:Label>
    
        <asp:Panel ID="pnlResultado" runat="server" visible="true" >
            <p><strong>Estado:</strong> <asp:label ID="lblEstadoP" runat="server" /></p>
            <p><strong>Destino:</strong> <asp:Label ID="lblDestino" runat="server" /></p>
            <p><strong>Fecha Estimada de Entrega:</strong> <asp:Label ID="lblFecha" runat="server" /></p>
        </asp:Panel>

    
    </div>
    
</asp:Content>
