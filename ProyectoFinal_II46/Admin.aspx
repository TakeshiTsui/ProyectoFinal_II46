<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Admin.aspx.vb" Inherits="ProyectoFinal_II46.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .admin-container {
        max-width: 650px;
        margin: 40px auto;
        padding: 30px;
        border-radius: 12px;
        background: #ffffff;
        box-shadow: 0 4px 14px rgba(0,0,0,0.18);
        text-align: center;
    }

    .admin-container h2 {
        font-weight: 600;
        margin-bottom: 20px;
    }

    .admin-user {
        font-size: 1.25rem;
        font-weight: 500;
    }

    .admin-email {
        font-size: 1.1rem;
        color: #555;
    }

    .admin-buttons {
        margin-top: 30px;
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .admin-buttons a {
        padding: 12px;
        border-radius: 8px;
        font-size: 1.05rem;
        font-weight: 500;
        text-decoration: none;
        color: white;
    }

    .btn-blue { background: #007bff; }
    .btn-green { background: #28a745; }
    .btn-orange { background: #fd7e14; }
    .btn-red { background: #dc3545; }

    .btn-blue:hover,
    .btn-green:hover,
    .btn-orange:hover,
    .btn-red:hover {
        opacity: 0.88;
    }
</style>

<div class="admin-container">
    <h2>Panel de Administración</h2>

    <asp:Label ID="lblUsuario" runat="server" CssClass="admin-user d-block" Text="Usuario"></asp:Label>
    <asp:Label ID="lblEmail" runat="server" CssClass="admin-email d-block mt-2"></asp:Label>

    <div class="admin-buttons">
        <a href="FormCliente.aspx" class="btn-blue">Clientes</a>
        <a href="FormEntrega.aspx" class="btn-green">Entregas</a>
        <a href="FormPaquete.aspx" class="btn-orange">Paquete</a>
        <a href="FormRepartidor.aspx" class="btn-red">Repartidores</a>
    </div>
</div>

</asp:Content>
