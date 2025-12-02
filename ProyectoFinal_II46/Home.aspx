<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Home.aspx.vb" Inherits="ProyectoFinal_II46.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    body {
        background: linear-gradient(135deg, #4a90e2, #50c9c3);
        min-height: 100vh;
        margin: 0;
        padding: 0;
    }

    .home-container {
        max-width: 580px;
        margin: 70px auto;
        padding: 35px;
        border-radius: 18px;
        background: rgba(255, 255, 255, 0.92);
        backdrop-filter: blur(6px);
        box-shadow: 0 8px 30px rgba(0,0,0,0.25);
        text-align: center;
        animation: fadeIn 0.6s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-15px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .home-container h3, 
    .home-container .h3 {
        font-weight: 700;
        margin-bottom: 5px;
        color: #333;
        letter-spacing: 0.5px;
    }

    .home-container .email {
        font-size: 1.15rem;
        margin-top: 5px;
        color: #444;
    }

    /* Botones */
    .home-buttons {
        margin-top: 30px;
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    .home-button {
        padding: 14px;
        font-size: 1.15rem;
        border-radius: 12px;
        font-weight: 600;
        background: #ffffff;
        border: none;
        text-decoration: none;
        color: #333;
        transition: 0.25s;
        box-shadow: 0 4px 12px rgba(0,0,0,0.12);
    }

    .home-button:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 18px rgba(0,0,0,0.20);
    }
    .btn-clientes { background: #4a90e2; color: white; }
    .btn-entregas { background: #7b8cff; color: white; }
    .btn-paquetes { background: #50c9c3; color: white; }
    .btn-repartidores { background: #56d5d1; color: white; }

</style>

<div class="home-container">
    <asp:Label ID="lblUsuario" runat="server" CssClass="h3 d-block" Text="Usuario"></asp:Label>
    <asp:Label ID="lblEmail" runat="server" CssClass="email d-block"></asp:Label>
    <div class="home-buttons">
        <a href="FormCliente.aspx" class="home-button btn-clientes"> Clientes </a>
        <a href="FormEntrega.aspx" class="home-button btn-entregas"> Entregas </a>
        <a href="FormPaquete.aspx" class="home-button btn-paquetes"> Paquetes </a>
        <a href="FormRepartidor.aspx" class="home-button btn-repartidores"> Repartidores </a>
    </div>
</div>

</asp:Content>
