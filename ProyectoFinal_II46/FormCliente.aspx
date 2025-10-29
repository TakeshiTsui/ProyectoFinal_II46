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
        <section>
            <h1> Mensajeria RapidiTico 🇨🇷</h1>
            <h5> Inserte datos del cliente</h5>
        </section>
        <asp:Button ID="btnCrear" runat="server" CssClass="btn btn-success btn-hover-move" Text="Crear Nuevo Cliente" OnClick="btnCrear_Click" />
        <asp:TextBox ID="txtNombre" CssClass="form-control" PlaceHolder="Nombre" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtApellido" CssClass="form-control" PlaceHolder="Apellido" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtTelefono" CssClass="form-control" Placeholder="Teléfono" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtDireccion" CssClass="form-control" Placeholder="Dirección" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtCorreo" CssClass="form-control" Placeholder="Correo electrónico" runat="server"></asp:TextBox>
        <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Guardar" OnClick="btnGuardar_Click" />
        <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Actualizar" OnClick="btnActualizar_Click" />
        <asp:Button ID="btnBorrar" runat="server" CssClass="btn btn-danger" Text="Borrar" OnClick="btnBorrar_Click" />
        <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
    </div>
    <asp:GridView ID="GvClientes" CssClass="table table-striped table-hover table-success" runat="server" AutoGenerateColumns="False"
        DataKeyNames="IdCliente" DataSourceID="SqlDataSource3"
        OnRowDeleting="GvClientes_RowDeleting"
        OnRowCancelingEdit="GvClientes_RowCancelingEdit"
        OnRowUpdating="GvClientes_RowUpdating"
        OnSelectedIndexChanged="GvClientes_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="btn btn-success" />
            <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" />
            <asp:BoundField DataField="IdCliente" HeaderText="IdCliente" ReadOnly="True" SortExpression="IdCliente" InsertVisible="False" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
            <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
            <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
            <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger"/>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoFinal_II46ConnectionString %>" ProviderName="<%$ ConnectionStrings:ProyectoFinal_II46ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Cliente]"></asp:SqlDataSource>
</asp:Content>
