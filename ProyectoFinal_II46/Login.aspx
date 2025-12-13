<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.vb" Inherits="ProyectoFinal_II46.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
            background: linear-gradient(135deg, #4a90e2, #50c9c3);
            min-height: 100vh;
            padding: 0;
            margin: 0;
        }

        .login-container {
            max-width: 420px;
            margin: 80px auto;
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .login-card {
            border-radius: 16px;
            padding: 35px;
            background: #ffffff;
            background: rgba(255, 255, 255, 0.92);
            backdrop-filter: blur(6px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.25);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 700;
            letter-spacing: 1px;
            color: #333;
        }

        .form-group label {
            font-weight: 600;
        }

        .form-control {
            border-radius: 10px;
            padding: 10px 12px;
        }

        .btn-primary {
            width: 100%;
            padding: 12px;
            font-size: 17px;
            border-radius: 10px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: 0.25s;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.2);
        }

        #lblMensaje {
            display: block;
            text-align: center;
            margin-bottom: 15px;
            font-weight: 600;
        }
    </style>


    <div class="login-container">
        <div class="login-card">
            <h2>Iniciar Sesión</h2>
            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>
            <div class="form-group mb-3">
                <asp:Label ID="lblUsuario" runat="server" Text="Usuario:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="Ingrese su usuario"></asp:TextBox>
            </div>
            <div class="form-group mb-3">
                <asp:Label ID="lblPassword" runat="server" Text="Contraseña:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="••••••••"></asp:TextBox>
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Entrar" OnClick="btnLogin_Click" CssClass="btn btn-primary mt-2" />
        </div>
    </div>

</asp:Content>
