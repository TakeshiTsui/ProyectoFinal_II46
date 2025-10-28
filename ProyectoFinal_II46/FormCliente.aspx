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
    <asp:HiddenField ID="Editando" runat="server" />
    <div class="container d-flex flex-column mb-3 gap-2">
        <asp:TextBox ID="txtNombre" CssClass="form-control" PlaceHolder="Nombre" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtApellido" CssClass="form-control" PlaceHolder="Apellido" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtTelefono" CssClass="form-control" Placeholder="Teléfono" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtDireccion" CssClass="form-control" Placeholder="Dirección" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtCorreo" CssClass="form-control" Placeholder="Correo electrónico" runat="server"></asp:TextBox>
        <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Guardar" OnClick="btnGuardar_Click" />
        <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Actualizar" OnClick="btnActualizar_Click" />
        <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
    </div>
    <asp:GridView ID="GvClientes" CssClass="table table-striped table-hover table-success" runat="server" AutoGenerateColumns="False"
        DataKeyNames="IdCliente" DataSourceID="SqlDataSource3"
        OnRowDeleting="GvPersonas_RowDeleting"
        OnRowEditing="GvPersonas_RowEditing"
        OnRowCancelingEdit="GvPersonas_RowCancelingEdit"
        OnRowUpdating="GvPersonas_RowUpdating"
        OnSelectedIndexChanged="GvPersonas_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="IdCliente" HeaderText="IdCliente" ReadOnly="True" SortExpression="IdCliente" InsertVisible="False" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
            <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
            <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoFinal_II46ConnectionString %>" ProviderName="<%$ ConnectionStrings:ProyectoFinal_II46ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Cliente]"></asp:SqlDataSource>
</asp:Content>
