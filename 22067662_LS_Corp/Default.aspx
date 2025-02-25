<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_22067662_LS_Corp.TopPerformer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top Performer</title>

    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body class="bg-gray-50">
    <form id="form1" runat="server">
        <div class="flex min-h-screen">
            <div class="w-52 fixed h-full bg-[#8E2937]">
                <div class="p-4 border-b-2 border-[#6B1F29]">
                    <h1 class="text-white text-xl font-bold">LS Corporation</h1>
                </div>
                <asp:Menu ID="Menu1" runat="server"
                    CssClass="space-y-1 p-4 flex flex-col"
                    StaticMenuItemStyle-CssClass="text-white px-4 py-3 w-44 rounded-md text-lg font-medium hover:bg-[#6B1F29]"
                    StaticSelectedStyle-CssClass="bg-[#47151B]">
                    <Items>
                        <asp:MenuItem NavigateUrl="/Default.aspx" Text="Dashboard" Value="Default"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="/Users.aspx" Text="Users" Value="Users"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="/Projects.aspx" Text="Projects" Value="Projects"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="/Tasks.aspx" Text="Tasks" Value="Tasks"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="/Resources.aspx" Text="Resources" Value="Resources"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="/Comments.aspx" Text="Comments" Value="Comments"></asp:MenuItem>
                    </Items>
                </asp:Menu>
            </div>

            <div class="ml-52 p-8 flex-1">
                <div class="bg-white p-6 mb-8 rounded-lg border-2 border-[#6B1F29] shadow-lg">
                    <h2 class="mb-6 text-2xl font-bold text-[#6B1F29]">Dashboard</h2>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" ReadOnly="True" SortExpression="USER_ID" />
                            <asp:BoundField DataField="USER_NAME" HeaderText="USER_NAME" SortExpression="USER_NAME" />
                            <asp:BoundField DataField="USER_POSITION" HeaderText="USER_POSITION" SortExpression="USER_POSITION" />
                            <asp:BoundField DataField="COMPLETED_TASKS" HeaderText="COMPLETED_TASKS" SortExpression="COMPLETED_TASKS" />
                            <asp:BoundField DataField="USER_RANK" HeaderText="USER_RANK" SortExpression="USER_RANK" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
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
    </form>
</body>
</html>
