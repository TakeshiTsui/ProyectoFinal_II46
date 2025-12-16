<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Admin.aspx.vb" Inherits="ProyectoFinal_II46.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    body {
        background: linear-gradient(135deg, #4a90e2, #50c9c3);
        min-height: 100vh;
        margin: 0;
        padding: 0;
    }

    .admin-container {
        max-width: 650px;
        margin: 70px auto;
        padding: 40px;
        border-radius: 18px;
        background: rgba(255, 255, 255, 0.92);
        backdrop-filter: blur(6px);
        box-shadow: 0 8px 30px rgba(0,0,0,0.25);
        text-align: center;
        animation: fadeIn 0.7s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-15px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .admin-container h2 {
        font-weight: 700;
        margin-bottom: 20px;
        color: #333;
        letter-spacing: .5px;
    }

    .admin-user {
        font-size: 1.4rem;
        font-weight: 600;
        color: #222;
    }

    .admin-email {
        font-size: 1.15rem;
        color: #444;
    }

    .admin-buttons {
        margin-top: 35px;
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    .admin-button {
        padding: 14px;
        border-radius: 12px;
        font-size: 1.15rem;
        font-weight: 600;
        text-decoration: none;
        color: white;
        transition: 0.25s;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    }

    .admin-button:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 18px rgba(0,0,0,0.20);
    }

    .btn-clientes { background: #4a90e2; }
    .btn-entregas { background: #28a745; }
    .btn-paquetes { background: #f39c12; }
    .btn-historial {background: #b200ff;}
    .btn-repartidores { background: #e74c3c; }

</style>

<div class="admin-container">
    <h2>Panel de Administración</h2>

    <asp:Label ID="lblUsuario" runat="server" CssClass="admin-user d-block"></asp:Label>
    <asp:Label ID="lblEmail" runat="server" CssClass="admin-email d-block mt-2"></asp:Label>

    <div class="admin-buttons">
        <a href="FormCliente.aspx" class="admin-button btn-clientes"> Gestión de Clientes</a>
        <a href="FormEntrega.aspx" class="admin-button btn-entregas"> Gestión de Entregas</a>
        <a href="FormPaquete.aspx" class="admin-button btn-paquetes"> Gestión de Paquetes</a>
        <a href="MisEntregas.aspx" class="admin-button btn-historial"> Historial de Entregas</a>
        <a href="FormRepartidor.aspx" class="admin-button btn-repartidores">Gestión de Repartidores</a>
    </div>
</div>

</asp:Content>
