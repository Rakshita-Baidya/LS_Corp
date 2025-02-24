<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopPerformer.aspx.cs" Inherits="_22067662_LS_Corp.TopPerformer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top Performer</title>

    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT u.USER_ID, u.USER_NAME, u.USER_POSITION, 
        COUNT(t.TASK_ID) AS COMPLETED_TASKS,
        RANK() OVER (ORDER BY COUNT(t.TASK_ID) DESC) AS USER_rank
    FROM USERS u
    JOIN USER_PROJECT_TASK upt ON u.USER_ID = upt.USER_ID
    JOIN TASKS t ON upt.TASK_ID = t.TASK_ID
    WHERE t.Task_STATUS = 'Completed'
    GROUP BY u.USER_ID, u.USER_NAME, u.USER_POSITION
    ORDER BY COMPLETED_TASKS DESC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
    </form>
</body>
</html>
