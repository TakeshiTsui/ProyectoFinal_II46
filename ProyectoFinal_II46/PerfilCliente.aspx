<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="PerfilCliente.aspx.vb" Inherits="ProyectoFinal_II46.PerfilCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .perfil-container {
            max-width: 650px;
            margin: 60px auto;
            padding: 35px;
            border-radius: 20px;
            background: #ffffff;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .perfil-title {
            font-weight: 700;
            text-align: center;
            margin-bottom: 20px;
        }
        .perfil-info {
            font-size: 1.1rem;
            margin-bottom: 15px;
        }
        .perfil-label {
            font-weight: 600;
            color: #333;
        }
    </style>
    <div class="perfil-container">
        <h3 class="perfil-title"> Mi Perfil</h3>
        <p class="text-muted text-center"> Revisa y actualiza tu información personal</p>
        <div class="row g-3">
            <div class="col-md-6">
                <label class="perfil-label">Nombre:</label>
                <asp:TextBox ID="txtNombre" runat ="server" cssclass="form-control perfil-info"/>
            </div>
            <div class="col-md-6">
                <label class="perfil-label">Apellido:</label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control perfil-info" />
            </div>
            <div class="col-md-6">
                <label class="perfil-label">Telefono:</label>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control perfil-info" />
            </div>
            <div class="col-md-6">
                <label class="perfil-label">Correo Electrónico:</label>
                <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control perfil-info" />
            </div>
            <div class="col-12">
                <label class="perfil-label">Dirección:</label>
                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control perfil-info" />
            </div>
            <div class="text-bg-danger-end mt-4">
                <asp:Button ID="txtActualizar" Text ="Guardar Cambios" cssclass="btn btn-primary px-4" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
