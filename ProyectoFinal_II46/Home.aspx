<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Home.aspx.vb" Inherits="ProyectoFinal_II46.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .home-container {
        max-width: 600px;
        margin: 40px auto;
        padding: 25px;
        border-radius: 12px;
        background: #ffffff;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        text-align: center;
    }

    .home-container h3 {
        font-weight: 600;
        margin-bottom: 10px;
    }

    .home-container .email {
        font-size: 1.1rem;
        margin-top: 5px;
        color: #555;
    }

    /* Estilos para botones */
    .home-buttons {
        margin-top: 25px;
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .home-buttons a {
        padding: 12px;
        font-size: 1.05rem;
        border-radius: 8px;
        font-weight: 500;
    }
</style>

<div class="home-container">
    <asp:Label ID="lblUsuario" runat="server" CssClass="h3 d-block" Text="Usuario"></asp:Label>
    <asp:Label ID="lblEmail" runat="server" CssClass="email d-block"></asp:Label>

    <!-- Botones de navegación -->
    <div class="home-buttons">

        <a href="FormCliente.aspx" class="btn btn-primary w-100">
            Clientes
        </a>

        <a href="FormEntrega.aspx" class="btn btn-secondary w-100">
            Entregas
        </a>

        <a href="FormPaquete.aspx" class="btn btn-info text-white w-100">
           Paquetes
        </a>

        <a href="FormRepartidor.aspx" class="btn btn-info text-white w-100">
            Repartidores
        </a>
    </div>

</div>

</asp:Content>
