<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="_22067662_LS_Corp.Comments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Comments</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="COMMENT_ID" DataSourceID="SqlDataSource1" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="COMMENT_ID" HeaderText="COMMENT_ID" ReadOnly="True" SortExpression="COMMENT_ID" />
                <asp:BoundField DataField="COMMENT_MESSAGE" HeaderText="COMMENT_MESSAGE" SortExpression="COMMENT_MESSAGE" />
                <asp:BoundField DataField="COMMENT_DATETIME" HeaderText="COMMENT_DATETIME" SortExpression="COMMENT_DATETIME" />
                <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID" SortExpression="TASK_ID" />
                <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" SortExpression="USER_ID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;COMMENTS&quot; WHERE &quot;COMMENT_ID&quot; = :COMMENT_ID" InsertCommand="INSERT INTO &quot;COMMENTS&quot; (&quot;COMMENT_ID&quot;, &quot;COMMENT_MESSAGE&quot;, &quot;COMMENT_DATETIME&quot;, &quot;USER_ID&quot;, &quot;TASK_ID&quot;) VALUES (:COMMENT_ID, :COMMENT_MESSAGE, :COMMENT_DATETIME, :USER_ID, :TASK_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COMMENT_ID&quot;, &quot;COMMENT_MESSAGE&quot;, &quot;COMMENT_DATETIME&quot;, &quot;USER_ID&quot;, &quot;TASK_ID&quot; FROM &quot;COMMENTS&quot;" UpdateCommand="UPDATE &quot;COMMENTS&quot; SET &quot;COMMENT_MESSAGE&quot; = :COMMENT_MESSAGE, &quot;COMMENT_DATETIME&quot; = :COMMENT_DATETIME, &quot;USER_ID&quot; = :USER_ID, &quot;TASK_ID&quot; = :TASK_ID WHERE &quot;COMMENT_ID&quot; = :COMMENT_ID">
            <DeleteParameters>
                <asp:Parameter Name="COMMENT_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COMMENT_ID" Type="Decimal" />
                <asp:Parameter Name="COMMENT_MESSAGE" Type="String" />
                <asp:Parameter Name="COMMENT_DATETIME" Type="DateTime" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="COMMENT_MESSAGE" Type="String" />
                <asp:Parameter Name="COMMENT_DATETIME" Type="DateTime" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
                <asp:Parameter Name="COMMENT_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="COMMENT_ID" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging">
            
            <InsertItemTemplate>
                COMMENT_ID:
                <asp:TextBox ID="COMMENT_IDTextBox" runat="server" Text='<%# Bind("COMMENT_ID") %>' />
                <br />
                COMMENT_MESSAGE:
                <asp:TextBox ID="COMMENT_MESSAGETextBox" runat="server" Text='<%# Bind("COMMENT_MESSAGE") %>' />
                <br />
                TASK_ID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASK_NAME" DataValueField="TASK_ID" SelectedValue='<%# Bind("TASK_ID") %>'>
                </asp:DropDownList>
                <br />
                COMMENT_DATETIME:
                <asp:TextBox ID="COMMENT_DATETIMETextBox" runat="server" Text='<%# Bind("COMMENT_DATETIME") %>' />
                <br />
                USER_ID:<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="USER_NAME" DataValueField="USER_ID" SelectedValue='<%# Bind("USER_ID") %>'>
                </asp:DropDownList>
&nbsp;<br />&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_NAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
    </form>
</body>
</html>
