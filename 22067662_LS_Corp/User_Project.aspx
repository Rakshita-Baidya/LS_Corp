<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Project.aspx.cs" Inherits="_22067662_LS_Corp.User_Project" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:DropDownList ID="DropDownList8" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="USER_NAME" DataValueField="USER_ID">
        </asp:DropDownList>
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_PROJECT_ID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <%--<asp:BoundField DataField="USER_PROJECT_ID" HeaderText="USER_PROJECT_ID" ReadOnly="True" SortExpression="USER_PROJECT_ID" />--%>
                <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" SortExpression="USER_ID" />
                <asp:TemplateField HeaderText="Username">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="USER_NAME" Enabled="false" DataValueField="USER_ID" SelectedValue='<%# Bind("USER_ID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" SortExpression="PROJECT_ID" />
                <asp:TemplateField HeaderText="Project Name">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="PROJECT_NAME" Enabled="false" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Project Start Date">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource3" DataTextField="PROJECT_START_DATE" Enabled="false" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("USER_ID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Project End Date">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource3" DataTextField="PROJECT_DUE_DATE" Enabled="false" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Project Status">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource3" DataTextField="PROJECT_STATUS" Enabled="false" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;USER_PROJECT&quot; WHERE &quot;USER_PROJECT_ID&quot; = :USER_PROJECT_ID" InsertCommand="INSERT INTO &quot;USER_PROJECT&quot; (&quot;USER_PROJECT_ID&quot;, &quot;PROJECT_ID&quot;, &quot;USER_ID&quot;) VALUES (:USER_PROJECT_ID, :PROJECT_ID, :USER_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_PROJECT_ID&quot;, &quot;PROJECT_ID&quot;, &quot;USER_ID&quot; FROM &quot;USER_PROJECT&quot; WHERE (&quot;USER_ID&quot; = :USER_ID)" UpdateCommand="UPDATE &quot;USER_PROJECT&quot; SET &quot;PROJECT_ID&quot; = :PROJECT_ID, &quot;USER_ID&quot; = :USER_ID WHERE &quot;USER_PROJECT_ID&quot; = :USER_PROJECT_ID">
            <DeleteParameters>
                <asp:Parameter Name="USER_PROJECT_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USER_PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList8" Name="USER_ID" PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
                <asp:Parameter Name="USER_PROJECT_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="USER_PROJECT_ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                USER_PROJECT_ID:
                <asp:TextBox ID="USER_PROJECT_IDTextBox" runat="server" Text='<%# Bind("USER_PROJECT_ID") %>' />
                <br />
                PROJECT_ID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'>
                </asp:DropDownList>
                <br />
                USER_ID:
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="USER_NAME" DataValueField="USER_ID" SelectedValue='<%# Bind("USER_ID") %>'>
                </asp:DropDownList>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot;, &quot;PROJECT_START_DATE&quot;, &quot;PROJECT_DUE_DATE&quot;, &quot;PROJECT_STATUS&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
    </form>
</body>
</html>
