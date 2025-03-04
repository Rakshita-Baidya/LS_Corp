<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Milestones.aspx.cs" Inherits="_22067662_LS_Corp.Milestones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Milestones
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="mb-8 text-4xl font-bold text-[#6B1F29]">Dashboard</h2>
    <div class="p-6 mb-8 w-max rounded-lg border-2 border-[#6B1F29] shadow-lg">
        <h2 class="mb-6 text-xl font-semibold text-[#6B1F29] underline">Top Performers</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID" DataSourceID="SqlDataSource2" CssClass="divide-gray-200 min-w-full divide-y truncate text-center"
            HeaderStyle-CssClass="bg-[#F5E6E8] text-lg"
            RowStyle-CssClass="bg-white text-md text-gray-900 hover:bg-gray-50"
            AlternatingRowStyle-CssClass="bg-gray-50 hover:bg-gray-100">
            <Columns>
                <asp:BoundField DataField="USER_ID" HeaderText="User ID" ReadOnly="True" SortExpression="USER_ID" ItemStyle-CssClass="px-6 py-4" />
                <asp:BoundField DataField="USER_NAME" HeaderText="Name" SortExpression="USER_NAME" ItemStyle-CssClass="px-6 py-4" />
                <asp:BoundField DataField="USER_POSITION" HeaderText="Position" SortExpression="USER_POSITION" ItemStyle-CssClass="px-6 py-4" />
                <asp:BoundField DataField="COMPLETED_TASKS" HeaderText="Comp. Tasks" SortExpression="COMPLETED_TASKS" ItemStyle-CssClass="px-6 py-4" />
                <asp:BoundField DataField="USER_RANK" HeaderText="Rank" SortExpression="USER_RANK" ItemStyle-CssClass="px-6 py-4" />
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT u.USER_ID, u.USER_NAME, u.USER_POSITION, 
        COUNT(t.TASK_ID) AS COMPLETED_TASKS,
        RANK() OVER (ORDER BY COUNT(t.TASK_ID) DESC) AS USER_rank
        FROM USERS u
        JOIN USER_PROJECT_TASK upt ON u.USER_ID = upt.USER_ID
        JOIN TASKS t ON upt.TASK_ID = t.TASK_ID
        WHERE t.Task_STATUS = 'Completed'
        GROUP BY u.USER_ID, u.USER_NAME, u.USER_POSITION
        ORDER BY COMPLETED_TASKS DESC
        FETCH FIRST 3 ROWS ONLY"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
</asp:Content>
