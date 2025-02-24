<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Milestones.aspx.cs" Inherits="_22067662_LS_Corp.Milestones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Milestones</title>
    
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID">
            </asp:DropDownList>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="MILESTONE_ID" HeaderText="MILESTONE_ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                    <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" SortExpression="PROJECT_ID" />
                    <asp:TemplateField HeaderText="Project Name">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="PROJECT_NAME" Enabled="false" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MILESTONE_NAME" HeaderText="MILESTONE_NAME" SortExpression="MILESTONE_NAME" />
                    <asp:BoundField DataField="MILESTONE_DATE" HeaderText="MILESTONE_DATE" SortExpression="MILESTONE_DATE" />
                    <asp:BoundField DataField="MILESTONE_STATUS" HeaderText="MILESTONE_STATUS" SortExpression="MILESTONE_STATUS" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MILESTONES&quot; WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID" InsertCommand="INSERT INTO &quot;MILESTONES&quot; (&quot;MILESTONE_ID&quot;, &quot;PROJECT_ID&quot;, &quot;MILESTONE_NAME&quot;, &quot;MILESTONE_DATE&quot;, &quot;MILESTONE_STATUS&quot;) VALUES (:MILESTONE_ID, :PROJECT_ID, :MILESTONE_NAME, :MILESTONE_DATE, :MILESTONE_STATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONE_ID&quot;, &quot;PROJECT_ID&quot;, &quot;MILESTONE_NAME&quot;, &quot;MILESTONE_DATE&quot;, &quot;MILESTONE_STATUS&quot; FROM &quot;MILESTONES&quot; WHERE (&quot;PROJECT_ID&quot; = :PROJECT_ID)" UpdateCommand="UPDATE &quot;MILESTONES&quot; SET &quot;PROJECT_ID&quot; = :PROJECT_ID, &quot;MILESTONE_NAME&quot; = :MILESTONE_NAME, &quot;MILESTONE_DATE&quot; = :MILESTONE_DATE, &quot;MILESTONE_STATUS&quot; = :MILESTONE_STATUS WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID">
            <DeleteParameters>
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                <asp:Parameter Name="MILESTONE_DATE" Type="DateTime" />
                <asp:Parameter Name="MILESTONE_STATUS" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="PROJECT_ID" PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                <asp:Parameter Name="MILESTONE_DATE" Type="DateTime" />
                <asp:Parameter Name="MILESTONE_STATUS" Type="String" />
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1">
            
            <InsertItemTemplate>
                MILESTONE_ID:
                <asp:TextBox ID="MILESTONE_IDTextBox" runat="server" Text='<%# Bind("MILESTONE_ID") %>' />
                <br />
                PROJECT_ID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'>
                </asp:DropDownList>
                <br />
                MILESTONE_NAME:
                <asp:TextBox ID="MILESTONE_NAMETextBox" runat="server" Text='<%# Bind("MILESTONE_NAME") %>' />
                <br />
                MILESTONE_DATE:
                <asp:TextBox ID="MILESTONE_DATETextBox" runat="server" Text='<%# Bind("MILESTONE_DATE") %>' />
                <br />
                MILESTONE_STATUS:
                <asp:TextBox ID="MILESTONE_STATUSTextBox" runat="server" Text='<%# Bind("MILESTONE_STATUS") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="SqlDataSource2_Selecting" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
    </form>
</body>
</html>
