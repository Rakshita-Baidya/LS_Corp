<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_22067662_LS_Corp.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="mb-8 text-4xl font-bold text-[#6B1F29]">Dashboard</h2>
    <div class=" grid-col-2 gap-6 grid">
        <div class="p-6 rounded-lg border-2 border-[#6B1F29] shadow-lg">
            <h2 class="mb-6 text-xl font-semibold text-[#6B1F29] underline">Top Performers</h2>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID">
            </asp:DropDownList>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID" DataSourceID="SqlDataSource2" CssClass="divide-gray-200 min-w-full divide-y truncate text-center"
                HeaderStyle-CssClass="bg-[#F5E6E8] text-lg"
                RowStyle-CssClass="bg-white text-md text-gray-900 hover:bg-gray-50"
                AlternatingRowStyle-CssClass="bg-gray-50 hover:bg-gray-100">
<AlternatingRowStyle CssClass="bg-gray-50 hover:bg-gray-100"></AlternatingRowStyle>
                <Columns>
                    <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" ReadOnly="True" SortExpression="USER_ID" ItemStyle-CssClass="px-6 py-4" />
                    <asp:BoundField DataField="USER_NAME" HeaderText="USER_NAME" SortExpression="USER_NAME" ItemStyle-CssClass="px-6 py-4" />
                    <asp:BoundField DataField="USER_POSITION" HeaderText="USER_POSITION" SortExpression="USER_POSITION" ItemStyle-CssClass="px-6 py-4" />
                    <asp:BoundField DataField="COMPLETED_TASKS" HeaderText="COMPLETED_TASKS" SortExpression="COMPLETED_TASKS" ItemStyle-CssClass="px-6 py-4" />
                    <asp:BoundField DataField="USER_RANK" HeaderText="USER_RANK" SortExpression="USER_RANK" ItemStyle-CssClass="px-6 py-4" />
                </Columns>

<HeaderStyle CssClass="bg-[#F5E6E8] text-lg"></HeaderStyle>

<RowStyle CssClass="bg-white text-md text-gray-900 hover:bg-gray-50"></RowStyle>
            </asp:GridView>
        </div>

        <div class="p-6 rounded-lg border-2 border-[#6B1F29] shadow-lg">
            <canvas id="projectStatusChart" width="500" height="300"></canvas>
        </div>
    </div>
    <asp:HiddenField ID="hfChartData" runat="server" />

    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            const chartDataField = document.getElementById('<%= hfChartData.ClientID %>');
            const chartData = JSON.parse(chartDataField.value || '{"labels": [], "data": []}');

            const ctx = document.getElementById('projectStatusChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: chartData.labels,
                    datasets: [{
                        label: 'Number of Projects',
                        data: chartData.data, 
                        backgroundColor: '#8E2937',
                        borderColor: '#6B1F29',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Number of Projects',
                                font: { size: 14, weight: 'bold' },
                                color: '#6B1F29'
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Project Status',
                                font: { size: 14, weight: 'bold' },
                                color: '#6B1F29'
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            labels: {
                                color: '#6B1F29'
                            }
                        }
                    }
                }
            });
        });
    </script>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT u.USER_ID, u.USER_NAME, u.USER_POSITION, 
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
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot;, &quot;PROJECT_START_DATE&quot;, &quot;PROJECT_DUE_DATE&quot;, &quot;PROJECT_STATUS&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
</asp:Content>


