<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.vb" Inherits="ProyectoFinal_II46.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <style>
     .login-container {
         max-width: 420px;
         margin: 40px auto;
     }

     .login-card {
         border-radius: 12px;
         padding: 30px;
         background: #ffffff;
         box-shadow: 0 4px 16px rgba(0,0,0,0.15);
     }

     h2 {
         text-align: center;
         margin-bottom: 20px;
         font-weight: 600;
     }

     .form-group label {
         font-weight: 500;
     }

     .btn-primary {
         width: 100%;
         padding: 10px;
         font-size: 16px;
         border-radius: 8px;
     }

     #lblMensaje {
         display: block;
         text-align: center;
         margin-bottom: 12px;
         font-weight: 600;
     }
 </style>

 <div class="login-container">
     <div class="login-card">

         <h2>Iniciar Sesión</h2>

         <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>

         <div class="form-group">
             <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label>
             <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox>
         </div>

         <div class="form-group mt-2">
             <asp:Label ID="lblPassword" runat="server" Text="Contraseña:"></asp:Label>
             <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
         </div>

         <asp:Button ID="btnLogin" 
                     runat="server" 
                     Text="Iniciar Sesión" 
                     OnClick="btnLogin_Click" 
                     CssClass="btn btn-primary mt-3" />

     </div>
 </div>

</asp:Content>
