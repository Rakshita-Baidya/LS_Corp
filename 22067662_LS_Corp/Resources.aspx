<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Resources.aspx.cs" Inherits="_22067662_LS_Corp.Resources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Resources List</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="mb-8 text-4xl font-bold text-[#6B1F29]">Resource Management</h2>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="RESOURCE_ID" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging" CssClass="mb-8 w-1/2">
        <InsertItemTemplate>
            <div class="gap-4 p-6 grid grid-cols-1 rounded border-2 border-[#6B1F29]">
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">Resource ID:</label>
                    <asp:TextBox ID="RESOURCE_IDTextBox" runat="server" Text='<%# Bind("RESOURCE_ID") %>' CssClass="w-full rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">Name:</label>
                    <asp:TextBox ID="RESOURCE_NAMETextBox" runat="server" Text='<%# Bind("RESOURCE_NAME") %>' CssClass="w-full rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">Description:</label>
                    <asp:TextBox ID="RESOURCE_DESCRIPTIONTextBox" runat="server" Text='<%# Bind("RESOURCE_DESCRIPTION") %>' CssClass="w-full rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">
                        Type:
           <asp:TextBox ID="RESOURCE_TYPETextBox" runat="server" Text='<%# Bind("RESOURCE_TYPE") %>' CssClass="w-full rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-x-4 pt-4 flex">
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="text-white px-4 py-2 rounded-sm bg-[#8E2937] hover:bg-[#6B1F29]" />
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="bg-gray-200 text-gray-700 px-4 py-2 rounded-sm hover:bg-gray-300" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
        </ItemTemplate>
    </asp:FormView>
    <div class="p-6 mb-8 rounded-lg border-2 border-[#6B1F29] shadow-lg">

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

</asp:Content>
