<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="SubTasks.aspx.cs" Inherits="_22067662_LS_Corp.SubTasks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    SubTasks
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="mb-8 text-4xl font-bold text-[#6B1F29]">SubTasks Management</h2>

    <asp:FormView ID="FormView2" runat="server" DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSource1" CssClass="mb-8 w-1/2">
        <InsertItemTemplate>
            <div class="gap-4 p-6 grid grid-cols-1 rounded border-2 border-[#6B1F29]">
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">SubTask ID:</label>
                    <asp:TextBox ID="SUBTASK_IDTextBox" runat="server" Text='<%# Bind("SUBTASK_ID") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">Task:</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASK_NAME" DataValueField="TASK_ID" SelectedValue='<%# Bind("TASK_ID") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">Name:</label>
                    <asp:TextBox ID="SUBTASK_NAMETextBox" runat="server" Text='<%# Bind("SUBTASK_NAME") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">Start Date:</label>
                    <asp:TextBox ID="SUBTASK_START_DATETextBox" runat="server" TextMode="Date" Text='<%# Bind("SUBTASK_START_DATE") %>' 
                        CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" 
                        min='<%# DateTime.Today.ToString("yyyy-MM-dd") %>'/>
                </div>

                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">Due Date:</label>
                    <asp:TextBox ID="SUBTASK_DUE_DATETextBox" runat="server" TextMode="Date" Text='<%# Bind("SUBTASK_DUE_DATE") %>' 
                        CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" 
                        min='<%# DateTime.Today.AddDays(1).ToString("yyyy-MM-dd") %>'/>
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">Status:</label>
                    <asp:TextBox ID="SUBTASK_STATUSTextBox" runat="server" Text='<%# Bind("SUBTASK_STATUS") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>

                <div class="space-x-4 pt-4 flex">
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="text-white px-4 py-2 rounded bg-[#8E2937] hover:bg-[#6B1F29]" />
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="bg-gray-200 text-gray-700 px-4 py-2 rounded hover:bg-gray-300" />
                </div>
            </div>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add SubTask" CssClass="text-white px-4 py-2 rounded bg-[#8E2937] hover:bg-[#6B1F29]" />
        </ItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add SubTask" CssClass="text-white px-4 py-2 rounded bg-[#8E2937] hover:bg-[#6B1F29]" />

        </EmptyDataTemplate>
    </asp:FormView>
    <div class="mb-6">
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataTextField="TASK_NAME" DataValueField="TASK_ID"
            CssClass="py-1 px-2 max-w-48 border-gray-500 rounded border shadow-sm focus:border-[#B54555] focus:ring-[#B54555]">
            <asp:ListItem Text="All Tasks" Value="" />
        </asp:DropDownList>
    </div>
    <div class="p-6 mb-8 rounded-lg border-2 border-[#6B1F29] shadow-lg">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSource1" CssClass="divide-gray-200 min-w-full divide-y truncate text-center"
            HeaderStyle-CssClass="bg-[#F5E6E8] text-lg"
            RowStyle-CssClass="bg-white text-md text-gray-900 hover:bg-gray-50"
            AlternatingRowStyle-CssClass="bg-gray-50 hover:bg-gray-100" AllowPaging="True" AllowSorting="True" PageSize="7"
            EmptyDataText="No subtask found" EmptyDataRowStyle-CssClass="text-gray-700 py-4 text-lg">
            <PagerSettings Mode="NextPrevious"
                PreviousPageImageUrl="~/Images/prev.svg"
                PreviousPageText="Prev"
                NextPageImageUrl="~/Images/next.svg"
                NextPageText="Next"
                PageButtonCount="4" />
            <PagerStyle HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField DataField="SUBTASK_ID" HeaderText="ID" ReadOnly="True" SortExpression="SUBTASK_ID" ItemStyle-CssClass="px-6 py-4" />

                <asp:TemplateField HeaderText="Name" SortExpression="SUBTASK_NAME" ItemStyle-CssClass="px-6 py-4 max-w-72 truncate">
                    <ItemTemplate>
                        <asp:Label ID="LabelName" runat="server" Text='<%# Eval("SUBTASK_NAME") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxName" runat="server" Text='<%# Bind("SUBTASK_NAME") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Start Date" SortExpression="SUBTASK_START_DATE" ItemStyle-CssClass="px-6 py-4">
                    <ItemTemplate>
                        <asp:Label ID="LabelStartDate" runat="server" Text='<%# Eval("SUBTASK_START_DATE", "{0:dd MMMM, yyyy}") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxStartDate" runat="server" TextMode="Date" Text='<%# Bind("SUBTASK_START_DATE", "{0:yyyy-MM-dd}") %>' 
                            CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" 
                            min='<%# DateTime.Today.ToString("yyyy-MM-dd") %>'/>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Due Date" SortExpression="SUBTASK_DUE_DATE" ItemStyle-CssClass="px-6 py-4">
                    <ItemTemplate>
                        <asp:Label ID="LabelDueDate" runat="server" Text='<%# Eval("SUBTASK_DUE_DATE", "{0:dd MMMM, yyyy}") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxDueDate" runat="server" TextMode="Date" Text='<%# Bind("SUBTASK_DUE_DATE", "{0:yyyy-MM-dd}") %>' 
                            CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" 
                            min='<%# DateTime.Today.AddDays(1).ToString("yyyy-MM-dd") %>'/>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" SortExpression="SUBTASK_STATUS" ItemStyle-CssClass="px-6 py-4">
                    <ItemTemplate>
                        <asp:Label ID="LabelStatus" runat="server" Text='<%# Eval("SUBTASK_STATUS") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxStatus" runat="server" Text='<%# Bind("SUBTASK_STATUS") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Task ID" SortExpression="TASK_ID" ItemStyle-CssClass="px-6 py-4">
                    <ItemTemplate>
                        <asp:Label ID="LabelTask" runat="server" Text='<%# Eval("TASK_ID") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListTask" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASK_NAME" DataValueField="TASK_ID" SelectedValue='<%# Bind("TASK_ID") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Task Name">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownListTaskName" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASK_NAME" DataValueField="TASK_ID" SelectedValue='<%# Eval("TASK_ID") %>' Enabled="False" CssClass="px-6 py-4 max-w-40 text-center text-[#000000] bg-transparent appearance-none" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="py-4 space-x-2 px-6 flex justify-center">
                    <ItemTemplate>
                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CausesValidation="False" ToolTip="Edit"
                            Text='<svg fill="#000000" width="25px" height="25px" viewBox="0 0 24 24" id="edit" data-name="Line Color" xmlns="http://www.w3.org/2000/svg" class="icon line-color"><line id="secondary" x1="21" y1="21" x2="3" y2="21" style="fill: none; stroke: rgb(34, 87, 122); stroke-linecap: round; stroke-linejoin: round; stroke-width: 2;"></line><path id="primary" d="M19.88,7,11,15.83,7,17l1.17-4,8.88-8.88A2.09,2.09,0,0,1,20,4,2.09,2.09,0,0,1,19.88,7Z" style="fill: none; stroke: rgb(34, 87, 122); stroke-linecap: round; stroke-linejoin: round; stroke-width: 2;"></path></svg>' />
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CausesValidation="False" ToolTip="Delete"
                            Text='<svg width="25px" height="25px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M7 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v2h4a1 1 0 1 1 0 2h-1.069l-.867 12.142A2 2 0 0 1 17.069 22H6.93a2 2 0 0 1-1.995-1.858L4.07 8H3a1 1 0 0 1 0-2h4V4zm2 2h6V4H9v2zM6.074 8l.857 12H17.07l.857-12H6.074zM10 10a1 1 0 0 1 1 1v6a1 1 0 1 1-2 0v-6a1 1 0 0 1 1-1zm4 0a1 1 0 0 1 1 1v6a1 1 0 1 1-2 0v-6a1 1 0 0 1 1-1z" fill="#8E2937"/></svg>'
                            OnClientClick="return confirm('Are you sure you want to delete this subtask?');" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CausesValidation="True" ToolTip="Update"
                            Text='<svg fill="#2b9c4d" width="25" height="25" viewBox="144 144 512 512" xmlns="http://www.w3.org/2000/svg" stroke="#2b9c4d"><g stroke-width="0"/><g stroke-linecap="round" stroke-linejoin="round"/><path d="M293.19 572.27c0-7.34 5.945-13.281 13.281-13.281h187.05c7.34 0 13.281 5.945 13.281 13.281s-5.941 13.281-13.281 13.281h-187.05c-7.344 0-13.281-5.945-13.281-13.281zm0-123.98c0-7.34 5.945-13.281 13.281-13.281h187.05c7.34 0 13.281 5.941 13.281 13.281s-5.941 13.285-13.281 13.285h-187.05c-7.344 0-13.281-5.945-13.281-13.285zm0 61.992c0-7.332 5.945-13.281 13.281-13.281h187.05c7.34 0 13.281 5.95 13.281 13.281 0 7.34-5.941 13.281-13.281 13.281h-187.05c-7.344 0-13.281-5.945-13.281-13.281zm329.63 106.05v-348.23l-84.418-84.418h-10.324v97.195c0 7.324-5.95 13.273-13.281 13.273l-229.61.004c-7.332 0-13.281-5.95-13.281-13.273v-97.2h-94.738v432.65h55.75l.004-226.07c0-7.339 5.95-13.28 13.28-13.28h307.59c7.34 0 13.282 5.945 13.282 13.28v226.07h55.75zm-82.312 0v-212.79h-281.03v212.79zm-242.04-432.65h203.05v83.914h-203.05zm347.02 69.535-92.203-92.199a13.28 13.28 0 0 0-9.394-3.894H163.88c-7.336 0-13.282 5.949-13.282 13.277v459.21c0 7.34 5.946 13.28 13.281 13.28h472.21c7.34 0 13.281-5.945 13.281-13.28V262.6a13.3 13.3 0 0 0-3.89-9.387z" fill-rule="evenodd"/></svg>' />
                        <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CausesValidation="False" ToolTip="Cancel"
                            Text='<svg width="25" height="25" viewBox="0 0 48 48" version="1" xmlns="http://www.w3.org/2000/svg"><path fill="#D50000" d="M24 6C14.1 6 6 14.1 6 24s8.1 18 18 18 18-8.1 18-18S33.9 6 24 6m0 4c3.1 0 6 1.1 8.4 2.8L12.8 32.4C11.1 30 10 27.1 10 24c0-7.7 6.3-14 14-14m0 28c-3.1 0-6-1.1-8.4-2.8l19.6-19.6C36.9 18 38 20.9 38 24c0 7.7-6.3 14-14 14"/></svg>' />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SUBTASKS&quot; WHERE &quot;SUBTASK_ID&quot; = :SUBTASK_ID"
        InsertCommand="INSERT INTO &quot;SUBTASKS&quot; (&quot;SUBTASK_ID&quot;, &quot;SUBTASK_START_DATE&quot;, &quot;SUBTASK_NAME&quot;, &quot;SUBTASK_DUE_DATE&quot;, &quot;SUBTASK_STATUS&quot;, &quot;TASK_ID&quot;) VALUES (:SUBTASK_ID, :SUBTASK_START_DATE, :SUBTASK_NAME, :SUBTASK_DUE_DATE, :SUBTASK_STATUS, :TASK_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT &quot;SUBTASK_ID&quot;, &quot;SUBTASK_START_DATE&quot;, &quot;SUBTASK_NAME&quot;, &quot;SUBTASK_DUE_DATE&quot;, &quot;SUBTASK_STATUS&quot;, &quot;TASK_ID&quot; FROM &quot;SUBTASKS&quot; where (:TaskID = -1 OR TASK_ID = :TaskID)"
        UpdateCommand="UPDATE &quot;SUBTASKS&quot; SET &quot;SUBTASK_START_DATE&quot; = :SUBTASK_START_DATE, &quot;SUBTASK_NAME&quot; = :SUBTASK_NAME, &quot;SUBTASK_DUE_DATE&quot; = :SUBTASK_DUE_DATE, &quot;SUBTASK_STATUS&quot; = :SUBTASK_STATUS, &quot;TASK_ID&quot; = :TASK_ID WHERE &quot;SUBTASK_ID&quot; = :SUBTASK_ID"
        OnInserted="SqlDataSource1_Inserted"
        OnUpdated="SqlDataSource1_Updated"
        OnDeleted="SqlDataSource1_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
            <asp:Parameter Name="SUBTASK_START_DATE" Type="DateTime" />
            <asp:Parameter Name="SUBTASK_NAME" Type="String" />
            <asp:Parameter Name="SUBTASK_DUE_DATE" Type="DateTime" />
            <asp:Parameter Name="SUBTASK_STATUS" Type="String" />
            <asp:Parameter Name="TASK_ID" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" DefaultValue="-1" Name="TaskID" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SUBTASK_START_DATE" Type="DateTime" />
            <asp:Parameter Name="SUBTASK_NAME" Type="String" />
            <asp:Parameter Name="SUBTASK_DUE_DATE" Type="DateTime" />
            <asp:Parameter Name="SUBTASK_STATUS" Type="String" />
            <asp:Parameter Name="TASK_ID" Type="Decimal" />
            <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_NAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>

    <script>
        function showToast(message, type) {
            Swal.fire({
                toast: true,
                position: 'top-end',
                icon: type,
                title: message,
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true
            });
        }
    </script>
</asp:Content>
