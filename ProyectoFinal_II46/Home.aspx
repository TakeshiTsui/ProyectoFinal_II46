<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Home.aspx.vb" Inherits="ProyectoFinal_II46.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    body {
        background: linear-gradient(135deg, #4a90e2, #50c9c3);
        min-height: 100vh;
    }

    .home-container {
        max-width: 700px;
        margin: 70px auto;
        padding: 40px;
        border-radius: 20px;
        background: rgba(255, 255, 255, 0.95);
        box-shadow: 0 8px 30px rgba(0,0,0,0.25);
        text-align: center;
        animation: fadeIn 0.6s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-12px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .welcome-title {
        font-weight: 700;
        color: #1d3557;
    }

    .welcome-subtitle {
        color: #555;
        margin-bottom: 25px;
    }

    /* Botones */
    .home-buttons {
        margin-top: 35px;
        display: flex;
        flex-direction: row ;
        gap: 16px;
    }

    .home-btn {
        padding: 16px;
        font-size: 1.15rem;
        border-radius: 14px;
        font-weight: 600;
        background: #ffffff;
        border: none;
        text-decoration: none;
        color: white;
        transition: transform .25s, box-shadow .25s;
        box-shadow: 0 6px 16px rgba(0,0,0,0.18);
    }

    .home-button:hover {
        transform: translateY(-4px);
        box-shadow: 0 6px 18px rgba(0,0,0,0.25);
    }
    .btn-rastreo { background: #c62525; }
    .btn-paquete { background: #2a9d8f; }
    .btn-historial { background: #457b9d; }
    .btn-perfil  { background: #6c757d; }
    .btn-soporte { background: #f4a261; }

</style>

<div class="home-container">
    <h2 class="welcome-title">¡Bienvenido a RapidiTico 🇨🇷!</h2>
    <p class="welcome-subtitle">Gestiona tus envíos de forma rápida, segura y sencilla </p>
    <asp:Label ID="lblUsuario" runat="server" CssClass="fw-bold d-block" Text="Usuario"></asp:Label>
    <asp:Label ID="lblEmail" runat="server" CssClass="text-muted d-block mb-3"></asp:Label>
    <div class="home-buttons">
        <a href="RastrearPaquete.aspx" class="home-btn btn-rastreo"> Rastrear mi paquete </a>
        <a href="FormPaquete2.aspx" class="home-btn btn-paquete"> Registrar nuevo paquete </a>
        <a href="MisEntregas.aspx" class="home-btn btn-historial"> Ver estado de mis entregas </a>
        <a href="PerfilCliente.aspx" class="home-btn btn-perfil"> Mi información personal </a>
        <a href="Soporte.aspx" class="home-btn btn-soporte"> Soporte y contacto </a>
        </div>
</div>

</asp:Content>
