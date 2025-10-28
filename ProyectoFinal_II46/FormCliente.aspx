<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormCliente.aspx.vb" Inherits="ProyectoFinal_II46.FormCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
        .btn-hover-move {
            transition: transform 0.5s ease, box-shadow 0.2s;
        }

            .btn-hover-move:hover {
                transform: translateY(-4px) scale(1.04);
                box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
            }
    </style>
    <asp:HiddenField ID="Editando" runat="server"/>
    <div class="container d-flex flex-column mb-3 gap-2">
    <asp:TextBox ID="txtNombre" CssClass="form-control" PlaceHolder="Nombre" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtApellido" CssClass="form-control" PlaceHolder="Apellido" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtEdad" CssClass="form-control" PlaceHolder="Edad" runat="server"></asp:TextBox>
    <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Guardar" OnClick="btnGuardar_Click" />
    <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Actualizar" OnClick="btnActualizar_Click" />
    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
        </div>
    <asp:GridView ID="GvPersonas" CssClass="table table-striped table-hover table-success" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSource" 
        OnRowDeleting="GvPersonas_RowDeleting"
        OnRowEditing="GvPersonas_RowEditing"
        OnRowCancelingEdit="GvPersonas_RowCancelingEdit"
        OnRowUpdating="GvPersonas_RowUpdating" 
        OnSelectedIndexChanged="GvPersonas_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="btn btn-success" />
            <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" />
            <asp:BoundField DataField="ID" HeaderText="ID" visible="false" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
            <asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad" />
            <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger"/>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:II-46ConnectionString %>" ProviderName="<%$ ConnectionStrings:II-46ConnectionString.ProviderName %>" SelectCommand="SELECT [ID], [Nombre], [Apellido], [Edad] FROM [Persona]"></asp:SqlDataSource>

</asp:Content>
