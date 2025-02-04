<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tasks.aspx.cs" Inherits="_22067662_LS_Corp.Tasks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TASK_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID" ReadOnly="True" SortExpression="TASK_ID" />
                <asp:BoundField DataField="TASK_NAME" HeaderText="TASK_NAME" SortExpression="TASK_NAME" />
                <asp:BoundField DataField="TASK_START_DATE" HeaderText="TASK_START_DATE" SortExpression="TASK_START_DATE" />
                <asp:BoundField DataField="TASK_DUE_DATE" HeaderText="TASK_DUE_DATE" SortExpression="TASK_DUE_DATE" />
                <asp:BoundField DataField="TASK_STATUS" HeaderText="TASK_STATUS" SortExpression="TASK_STATUS" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TASKS&quot; WHERE &quot;TASK_ID&quot; = :TASK_ID" InsertCommand="INSERT INTO &quot;TASKS&quot; (&quot;TASK_ID&quot;, &quot;TASK_NAME&quot;, &quot;TASK_START_DATE&quot;, &quot;TASK_DUE_DATE&quot;, &quot;TASK_STATUS&quot;) VALUES (:TASK_ID, :TASK_NAME, :TASK_START_DATE, :TASK_DUE_DATE, :TASK_STATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_NAME&quot;, &quot;TASK_START_DATE&quot;, &quot;TASK_DUE_DATE&quot;, &quot;TASK_STATUS&quot; FROM &quot;TASKS&quot;" UpdateCommand="UPDATE &quot;TASKS&quot; SET &quot;TASK_NAME&quot; = :TASK_NAME, &quot;TASK_START_DATE&quot; = :TASK_START_DATE, &quot;TASK_DUE_DATE&quot; = :TASK_DUE_DATE, &quot;TASK_STATUS&quot; = :TASK_STATUS WHERE &quot;TASK_ID&quot; = :TASK_ID">
            <DeleteParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="TASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_STATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="TASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_STATUS" Type="String" />
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="TASK_ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                TASK_ID:
                <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' />
                <br />
                TASK_NAME:
                <asp:TextBox ID="TASK_NAMETextBox" runat="server" Text='<%# Bind("TASK_NAME") %>' />
                <br />
                TASK_START_DATE:
                <asp:TextBox ID="TASK_START_DATETextBox" runat="server" Text='<%# Bind("TASK_START_DATE") %>' />
                <br />
                TASK_DUE_DATE:
                <asp:TextBox ID="TASK_DUE_DATETextBox" runat="server" Text='<%# Bind("TASK_DUE_DATE") %>' />
                <br />
                TASK_STATUS:
                <asp:TextBox ID="TASK_STATUSTextBox" runat="server" Text='<%# Bind("TASK_STATUS") %>' />
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
