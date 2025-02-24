<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resources.aspx.cs" Inherits="_22067662_LS_Corp.Resources" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Resources</title>
    
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RESOURCE_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="RESOURCE_ID" HeaderText="RESOURCE_ID" ReadOnly="True" SortExpression="RESOURCE_ID" />
                    <asp:BoundField DataField="RESOURCE_NAME" HeaderText="RESOURCE_NAME" SortExpression="RESOURCE_NAME" />
                    <asp:BoundField DataField="RESOURCE_DESCRIPTION" HeaderText="RESOURCE_DESCRIPTION" SortExpression="RESOURCE_DESCRIPTION" />
                    <asp:BoundField DataField="RESOURCE_TYPE" HeaderText="RESOURCE_TYPE" SortExpression="RESOURCE_TYPE" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;RESOURCES&quot; WHERE &quot;RESOURCE_ID&quot; = :RESOURCE_ID" InsertCommand="INSERT INTO &quot;RESOURCES&quot; (&quot;RESOURCE_ID&quot;, &quot;RESOURCE_NAME&quot;, &quot;RESOURCE_DESCRIPTION&quot;, &quot;RESOURCE_TYPE&quot;) VALUES (:RESOURCE_ID, :RESOURCE_NAME, :RESOURCE_DESCRIPTION, :RESOURCE_TYPE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;RESOURCE_ID&quot;, &quot;RESOURCE_NAME&quot;, &quot;RESOURCE_DESCRIPTION&quot;, &quot;RESOURCE_TYPE&quot; FROM &quot;RESOURCES&quot;" UpdateCommand="UPDATE &quot;RESOURCES&quot; SET &quot;RESOURCE_NAME&quot; = :RESOURCE_NAME, &quot;RESOURCE_DESCRIPTION&quot; = :RESOURCE_DESCRIPTION, &quot;RESOURCE_TYPE&quot; = :RESOURCE_TYPE WHERE &quot;RESOURCE_ID&quot; = :RESOURCE_ID">
            <DeleteParameters>
                <asp:Parameter Name="RESOURCE_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="RESOURCE_ID" Type="Decimal" />
                <asp:Parameter Name="RESOURCE_NAME" Type="String" />
                <asp:Parameter Name="RESOURCE_DESCRIPTION" Type="String" />
                <asp:Parameter Name="RESOURCE_TYPE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="RESOURCE_NAME" Type="String" />
                <asp:Parameter Name="RESOURCE_DESCRIPTION" Type="String" />
                <asp:Parameter Name="RESOURCE_TYPE" Type="String" />
                <asp:Parameter Name="RESOURCE_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="RESOURCE_ID" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging">
            <InsertItemTemplate>
                RESOURCE_ID:
                <asp:TextBox ID="RESOURCE_IDTextBox" runat="server" Text='<%# Bind("RESOURCE_ID") %>' />
                <br />
                RESOURCE_NAME:
                <asp:TextBox ID="RESOURCE_NAMETextBox" runat="server" Text='<%# Bind("RESOURCE_NAME") %>' />
                <br />
                RESOURCE_DESCRIPTION:
                <asp:TextBox ID="RESOURCE_DESCRIPTIONTextBox" runat="server" Text='<%# Bind("RESOURCE_DESCRIPTION") %>' />
                <br />
                RESOURCE_TYPE:
                <asp:TextBox ID="RESOURCE_TYPETextBox" runat="server" Text='<%# Bind("RESOURCE_TYPE") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
