<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormPaquete.aspx.vb" Inherits="ProyectoFinal_II46.FormPaquete" %>
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
        <h3> Mensajeria RapidiTico 🇨🇷</h3>
        <h5> Inserte datos del Paquete</h5>
    </section>
    <asp:Button ID="btnCrear" runat="server" CssClass="btn btn-success btn-hover-move" Text="Ingresar Nuevo Paquete" OnClick="btnCrear_Click" />
    <asp:TextBox ID="txtIdClientes" CssClass="form-control" PlaceHolder="N° de Cliente" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtNombrePaquete" CssClass="form-control" PlaceHolder="Nombre del Paquete" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtDescripcion" CssClass="form-control" PlaceHolder="Descripción del Paquete" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtPrecio" CssClass="form-control" PlaceHolder="Precio" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtPeso" CssClass="form-control" Placeholder="Peso" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtFechaEnvio" CssClass="form-control" Placeholder="Fecha de Envio" TextMode="Date" runat="server"></asp:TextBox>
    <%--<asp:Textbox ID="txtEstado" CssClass="form-control" Placeholder="Estado" runat="server"></asp:Textbox>--%>
    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
        <asp:ListItem Text="Todos" Value=""></asp:ListItem>
        <asp:ListItem Text="Pendiente" Value="Pendiente"></asp:ListItem>
        <asp:ListItem Text="En Camino" Value="En Camino"></asp:ListItem>
        <asp:ListItem Text="Entregado" Value="Entregado"></asp:ListItem>
        <asp:ListItem Text="Cancelado" Value="Cancelado"></asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="txtDestino" CssClass="form-control" PlaceHolder="Dirección de envio" runat="server"></asp:TextBox>
    <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Guardar" OnClick="btnGuardar_Click" />
    <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-primary btn-hover-move" Text="Actualizar" OnClick="btnActualizar_Click" />
    <asp:Button ID="btnBorrar" runat="server" CssClass="btn btn-danger" Text="Borrar" OnClick="btnBorrar_Click" />
    <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-secondary" Text="Cancelar" OnClick="btnCancelar_Click" />
    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
</div>
<asp:GridView ID="GvPaquete" CssClass="table table-striped table-hover table-success" runat="server" AutoGenerateColumns="False"
    DataKeyNames="IdCliente" DataSourceID="SqlDataSource3"
    OnRowDeleting="GvPaquete_RowDeleting"
    OnRowCancelingEdit="GvPaquete_RowCancelingEdit"
    OnRowUpdating="GvPaquete_RowUpdating"
    OnSelectedIndexChanged="GvPaquete_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="true" ControlStyle-CssClass="btn btn-success" />
        <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="btn btn-primary" />
        <asp:BoundField DataField="IdPaquete" HeaderText="IdPaquete" ReadOnly="True" SortExpression="IdPaquete" InsertVisible="False" />
        <asp:BoundField DataField="IdCliente" HeaderText="IdCliente" ReadOnly="True" SortExpression="IdCliente"/>
        <asp:BoundField DataField="NombrePaquete" HeaderText="NombrePaquete" SortExpression="NombrePaquete" />
        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
        <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
        <asp:BoundField DataField="Peso" HeaderText="Peso" SortExpression="Peso" />
        <asp:BoundField DataField="FechaEnvio" HeaderText="FechaEnvio" SortExpression="FechaEnvio" />
        <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
        <asp:BoundField DataField="Destino" HeaderText="Destino" SortExpression="Destino" />
        <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="btn btn-danger"/>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoFinal_II46ConnectionString %>" ProviderName="<%$ ConnectionStrings:ProyectoFinal_II46ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Paquete]"></asp:SqlDataSource>

</asp:Content>
