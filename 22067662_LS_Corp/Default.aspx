<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_22067662_LS_Corp.Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="mb-6 text-4xl font-bold text-[#6B1F29]">Dashboard</h2>
    <div class="gap-6 mb-6 grid grid-cols-5">
        <div class="p-6 text-white rounded-lg bg-[#8E2937] shadow-lg">
            <h3 class="text-lg font-semibold">Total Users</h3>
            <asp:DropDownList runat="server" DataSourceID="SqlDataSource5" DataTextField="TotalUsers" DataValueField="TotalUsers"
                CssClass="bg-transparent text-white appearance-none border-none text-3xl font-bold outline-none" Enabled="False">
            </asp:DropDownList>
        </div>
        <div class="p-6 text-white rounded-lg bg-[#8E2937] shadow-lg">
            <h3 class="text-lg font-semibold">Total Projects</h3>
            <asp:DropDownList runat="server" DataSourceID="SqlDataSource5" DataTextField="TotalProjects" DataValueField="TotalProjects"
                CssClass="bg-transparent text-white appearance-none border-none text-3xl font-bold outline-none" Enabled="False">
            </asp:DropDownList>
        </div>
        <div class="p-6 text-white rounded-lg bg-[#8E2937] shadow-lg">
            <h3 class="text-lg font-semibold">Total Tasks</h3>
            <asp:DropDownList runat="server" DataSourceID="SqlDataSource5" DataTextField="TotalTasks" DataValueField="TotalTasks"
                CssClass="bg-transparent text-white appearance-none border-none text-3xl font-bold outline-none" Enabled="False">
            </asp:DropDownList>
        </div>
        <div class="p-6 text-white rounded-lg bg-[#8E2937] shadow-lg">
            <h3 class="text-lg font-semibold">Total SubTasks</h3>
            <asp:DropDownList runat="server" DataSourceID="SqlDataSource5" DataTextField="TotalSubTasks" DataValueField="TotalSubTasks"
                CssClass="bg-transparent text-white appearance-none border-none text-3xl font-bold outline-none" Enabled="False">
            </asp:DropDownList>
        </div>
        <div class="p-6 text-white rounded-lg bg-[#8E2937] shadow-lg">
            <h3 class="text-lg font-semibold">Total Resources</h3>
            <asp:DropDownList runat="server" DataSourceID="SqlDataSource5" DataTextField="TotalResources" DataValueField="TotalResources"
                CssClass="bg-transparent text-white appearance-none border-none text-3xl font-bold outline-none" Enabled="False">
            </asp:DropDownList>
        </div>
    </div>
    <div class="gap-6 mb-6 grid grid-cols-2">
        <div class="p-6 rounded-lg border-2 border-[#6B1F29] shadow-lg">
            <h2 class="mb-4 text-xl font-semibold text-[#6B1F29] underline">Top Performers</h2>
            <div class="mb-4">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource8" DataTextField="PROJECT_NAME"
                    DataValueField="PROJECT_ID"
                    CssClass="py-1 px-2 border-gray-500 rounded border shadow-sm focus:border-[#B54555] focus:ring-[#B54555]">
                </asp:DropDownList>
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID" DataSourceID="SqlDataSource2"
                CssClass="divide-gray-200 min-w-full divide-y truncate text-center"
                HeaderStyle-CssClass="bg-[#F5E6E8] text-lg"
                RowStyle-CssClass="bg-white text-md text-gray-900 hover:bg-gray-50"
                AlternatingRowStyle-CssClass="bg-gray-50 hover:bg-gray-100"
                EmptyDataText="No details found for this project">
                <AlternatingRowStyle CssClass="bg-gray-50 hover:bg-gray-100"></AlternatingRowStyle>
                <Columns>
                    <asp:BoundField DataField="USER_ID" HeaderText="User ID" ReadOnly="True" SortExpression="USER_ID" ItemStyle-CssClass="px-4 py-4" />
                    <asp:BoundField DataField="USER_NAME" HeaderText="Name" SortExpression="USER_NAME" ItemStyle-CssClass="px-4 py-4" />
                    <asp:BoundField DataField="USER_POSITION" HeaderText="Position" SortExpression="USER_POSITION" ItemStyle-CssClass="px-4 py-4 max-w-48 truncate" />
                    <asp:BoundField DataField="COMPLETED_TASKS" HeaderText="Tasks" SortExpression="COMPLETED_TASKS" ItemStyle-CssClass="px-4 py-4" />
                    <asp:BoundField DataField="USER_RANK" HeaderText="Rank" SortExpression="USER_RANK" ItemStyle-CssClass="px-4 py-4" />
                </Columns>
                <HeaderStyle CssClass="bg-[#F5E6E8] text-lg"></HeaderStyle>
                <RowStyle CssClass="bg-white text-md text-gray-900 hover:bg-gray-50"></RowStyle>
            </asp:GridView>
        </div>
        <div class="p-6 rounded-lg border-2 border-[#6B1F29] shadow-lg">
            <h2 class="mb-4 text-xl font-semibold text-[#6B1F29] underline">User Distribution by Position</h2>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource6"
                CssClass="mx-auto" Width="600px" Height="225px" BackColor="#f9fafb" Palette="Chocolate">
                <Series>
                    <asp:Series Name="UserPosition" ChartType="Pie" XValueMember="USER_POSITION" YValueMembers="USER_COUNT"
                        BorderColor="#6B1F29" BorderWidth="2" Label="#PERCENT{P0}" LegendText="#VALX"
                        CustomProperties="PieDrawingStyle=Default">
                        <SmartLabelStyle Enabled="True" />
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea2" BackColor="#f9fafb">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend1" Docking="Right" Alignment="Center" Font="Arial, 12pt" BackColor="#f9fafb">
                    </asp:Legend>
                </Legends>
            </asp:Chart>
        </div>
        <div class="p-6 rounded-lg border-2 border-[#6B1F29] shadow-lg">
            <h2 class="mb-4 text-xl font-semibold text-[#6B1F29] underline">Remaining Days Until Project Due</h2>
            <asp:Chart ID="ChartTimeline" runat="server" DataSourceID="SqlDataSource4" Width="750px" Height="350px" CssClass="mx-auto" BackColor="#f9fafb">
                <Series>
                    <asp:Series Name="RemainingDays" ChartType="Line" XValueMember="PROJECT_NAME" YValueMembers="REMAINING_DAYS"
                        Color="#8E2937" BorderColor="#6B1F29" BorderWidth="2"
                        ToolTip="Project: #VALX\nDays Remaining: #VALY"
                        MarkerStyle="Circle" MarkerSize="8" MarkerColor="#6B1F29" MarkerBorderColor="#8E2937"
                        IsValueShownAsLabel="True" LabelForeColor="#6B1F29" LabelFormat="N0">
                        <SmartLabelStyle Enabled="True" CalloutStyle="Box" CalloutLineColor="#6B1F29" />

                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="#F5E6E8">
                        <AxisX Title="Project Name" LineColor="#6B1F29" Interval="1" IsLabelAutoFit="False" LabelStyle-Font="Arial, 12pt" LabelStyle-Angle="-45">
                            <MajorGrid LineColor="#D3D3D3" />
                            <LabelStyle TruncatedLabels="True" />
                        </AxisX>
                        <AxisY Title="Days Remaining" LineColor="#6B1F29" LabelStyle-Font="Arial, 12pt" Minimum="0">
                            <MajorGrid LineColor="#D3D3D3" />
                        </AxisY>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
        <div class="p-6 rounded-lg border-2 border-[#6B1F29] shadow-lg">
            <h2 class="mb-4 text-xl font-semibold text-[#6B1F29] underline">Task Status by Project</h2>
            <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource8" DataTextField="PROJECT_NAME"
                DataValueField="PROJECT_ID"
                CssClass="py-1 px-2 mb-4 border-gray-500 rounded border shadow-sm focus:border-[#B54555] focus:ring-[#B54555]">
            </asp:DropDownList>
            <asp:Chart ID="ChartTaskStatus" runat="server" DataSourceID="SqlDataSource7"
                CssClass="mx-auto" Width="400px" Height="300px" BackColor="#f9fafb">
                <Series>
                    <asp:Series Name="TaskStatus" ChartType="Column" XValueMember="TASK_STATUS" YValueMembers="TASK_COUNT"
                        Color="#8E2937" BorderColor="#6B1F29" BorderWidth="2"
                        ToolTip="Status: #VALX\nCount: #VALY">
                        <SmartLabelStyle Enabled="True" CalloutStyle="Box" CalloutLineColor="#6B1F29" />
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea3" BackColor="#F5E6E8">
                        <AxisX Title="Task Status" LineColor="#6B1F29" LabelStyle-Font="Arial, 10pt">
                            <MajorGrid LineColor="#D3D3D3" />
                        </AxisX>
                        <AxisY Title="Task Count" LineColor="#6B1F29" LabelStyle-Font="Arial, 8pt">
                            <MajorGrid LineColor="#D3D3D3" />
                        </AxisY>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT u.USER_ID, u.USER_NAME, u.USER_POSITION, 
        COUNT(t.TASK_ID) AS COMPLETED_TASKS,
        RANK() OVER (ORDER BY COUNT(t.TASK_ID) DESC) AS USER_rank
        FROM USERS u
        JOIN USER_PROJECT_TASK upt ON u.USER_ID = upt.USER_ID
        JOIN TASKS t ON upt.TASK_ID = t.TASK_ID
        WHERE t.Task_STATUS = 'Completed' and (upt.PROJECT_ID = :ProjectID)
        GROUP BY u.USER_ID, u.USER_NAME, u.USER_POSITION
        ORDER BY COMPLETED_TASKS DESC
        FETCH FIRST 3 ROWS ONLY">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="ProjectID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT PROJECT_ID, PROJECT_NAME, ROUND(PROJECT_DUE_DATE - SYSDATE) AS REMAINING_DAYS FROM PROJECTS WHERE PROJECT_STATUS = 'Ongoing' AND PROJECT_DUE_DATE >= SYSDATE ORDER BY REMAINING_DAYS ASC FETCH FIRST 7 ROWS ONLY"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT (SELECT COUNT(DISTINCT user_id) FROM users) AS TotalUsers, (SELECT COUNT(DISTINCT project_id) FROM projects) AS TotalProjects, (SELECT COUNT(DISTINCT task_id) FROM tasks) AS TotalTasks, (SELECT COUNT(DISTINCT resource_id) FROM resources) AS TotalResources, (SELECT COUNT(DISTINCT subtask_id) FROM subtasks) AS TotalSubtasks FROM &quot;DUAL&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT USER_POSITION, COUNT(*) AS USER_COUNT FROM USERS GROUP BY USER_POSITION"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="SqlDataSource7_Selecting" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT t.TASK_STATUS, COUNT(*) AS TASK_COUNT
FROM TASKS t
JOIN USER_PROJECT_TASK upt ON t.TASK_ID = upt.TASK_ID
WHERE upt.PROJECT_ID = :ProjectID
GROUP BY t.TASK_STATUS">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="ProjectID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
</asp:Content>


