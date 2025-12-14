<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Soporte.aspx.vb" Inherits="ProyectoFinal_II46.Soporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        support-box {
            max-width: 700px;
            margin: 60px auto;
            padding: 40px;
            border-radius: 16px;
            background: white;
            box-shadow: 0 8px 28px rgba(0,0,0,0.25);
            text-align: center;
        }
    </style>

    <div class="support-box">
        <h3 class="fw-bold text-center"> Soporte Rapiditico</h3>
        <p class="text-muted text-center">¿Tienes algún problema con tu envío? Escríbenos</p>
    </div>
    <asp:TextBox id="txtAsunto" runat="server" cssclass="form-control mb-3" placeholder="Asunto" />
    <asp:TextBox ID="txtMensaje" runat="server" CssClass="form-control mb-3" textmode="MultiLine" rows="4" placeholder="Describe tu problema...." />
    <asp:Button id="btnEnviar" Text="Enviar mensaje" cssclass="btn btn-warning w-100" runat="server" />
</asp:Content>
