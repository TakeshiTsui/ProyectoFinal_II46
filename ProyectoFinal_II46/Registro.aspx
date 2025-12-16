<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Registro.aspx.vb" Inherits="ProyectoFinal_II46.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .registro-container {
            max-width: 480px;
            margin: 40px auto;
            padding: 30px;
            border-radius: 14px;
            background: #ffffff;
            box-shadow: 0 4px 14px rgba(0,0,0,0.15);
        }

        .registro-container h2 {
            font-weight: 600;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group label {
            font-weight: 500;
            margin-top: 10px;
        }

        #btnRegistrar {
            width: 100%;
            margin-top: 15px;
            padding: 10px;
            font-size: 1.05rem;
        }

        #lblMensaje {
            font-size: 0.95rem;
            font-weight: 600;
            display: block;
            margin-bottom: 10px;
            text-align: center;
        }
    </style>

    <div class="registro-container">

        <h2>👤 Registro de Usuario</h2>

        <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>

        <div class="form-group">
            <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label>
            <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="lblPassword" runat="server" Text="Contraseña:"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="lblConfirmarPassword" runat="server" Text="Confirmar Contraseña:"></asp:Label>
            <asp:TextBox ID="txtConfirmarPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
        </div>

        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" CssClass="btn btn-success" />

    </div>

</asp:Content>
