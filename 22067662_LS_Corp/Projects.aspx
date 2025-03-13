<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="_22067662_LS_Corp.Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Projects List</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="mb-8 text-4xl font-bold text-[#6B1F29]">Project Management</h2>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1" CssClass="mb-8 w-1/2" OnPageIndexChanging="FormView1_PageIndexChanging">
        <InsertItemTemplate>
            <div class="gap-4 p-6 grid grid-cols-1 rounded border-2 border-[#6B1F29]">
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">Project ID:</label>
                    <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">
                        Name:</label>
                    <asp:TextBox ID="PROJECT_NAMETextBox" runat="server" Text='<%# Bind("PROJECT_NAME") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">
                        Start Date:</label>
                    <asp:TextBox ID="PROJECT_START_DATETextBox" runat="server" TextMode="Date" Text='<%# Bind("PROJECT_START_DATE") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">
                        Due Date:</label>
                    <asp:TextBox ID="PROJECT_DUE_DATETextBox" runat="server" TextMode="Date" Text='<%# Bind("PROJECT_DUE_DATE") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">
                        Status:</label>
                    <asp:TextBox ID="PROJECT_STATUSTextBox" runat="server" Text='<%# Bind("PROJECT_STATUS") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-x-4 pt-4 flex">
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="text-white px-4 py-2 rounded bg-[#8E2937] hover:bg-[#6B1F29]" />
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="bg-gray-200 text-gray-700 px-4 py-2 rounded hover:bg-gray-300" />
                </div>
            </div>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Project" CssClass="text-white px-4 py-2 rounded bg-[#8E2937] hover:bg-[#6B1F29]" />
        </ItemTemplate>
    </asp:FormView>
    <div class="p-6 mb-8 rounded-lg border-2 border-[#6B1F29] shadow-lg">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1" CssClass="divide-gray-200 min-w-full divide-y truncate text-center"
            HeaderStyle-CssClass="bg-[#F5E6E8] text-lg"
            RowStyle-CssClass="bg-white text-md text-gray-900 hover:bg-gray-50"
            AlternatingRowStyle-CssClass="bg-gray-50 hover:bg-gray-100" AllowPaging="True" AllowSorting="True"
            PageSize="7">
            <PagerSettings Mode="NextPrevious"
                PreviousPageImageUrl="~/Images/prev.svg"
                PreviousPageText="Prev"
                NextPageImageUrl="~/Images/next.svg"
                NextPageText="Next"
                PageButtonCount="4" />
            <PagerStyle HorizontalAlign="Center" />

            <Columns>
                <asp:BoundField DataField="PROJECT_ID" HeaderText="ID" ReadOnly="True" SortExpression="PROJECT_ID" ItemStyle-CssClass="px-6 py-4" />
                <asp:TemplateField HeaderText="Name" SortExpression="PROJECT_NAME" ItemStyle-CssClass="px-6 py-4 max-w-xs truncate">
                    <ItemTemplate>
                        <asp:Label ID="LabelName" runat="server" Text='<%# Eval("PROJECT_NAME") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxName" runat="server" Text='<%# Bind("PROJECT_NAME") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Start Date" SortExpression="PROJECT_START_DATE" ItemStyle-CssClass="px-6 py-4 max-w-max truncate">
                    <ItemTemplate>
                        <asp:Label ID="LabelStartDate" runat="server" Text='<%# Eval("PROJECT_START_DATE", "{0:dd MMMM, yyyy}") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxStartDate" runat="server" TextMode="Date" Text='<%# Bind("PROJECT_START_DATE", "{0:yyyy-MM-dd}") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Due Date" SortExpression="PROJECT_DUE_DATE" ItemStyle-CssClass="px-6 py-4 max-w-max truncate">
                    <ItemTemplate>
                        <asp:Label ID="LabelDueDate" runat="server" Text='<%# Eval("PROJECT_DUE_DATE", "{0:dd MMMM, yyyy}") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxDueDate" runat="server" TextMode="Date" Text='<%# Bind("PROJECT_DUE_DATE", "{0:yyyy-MM-dd}") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" SortExpression="PROJECT_STATUS" ItemStyle-CssClass="px-6 py-4 max-w-xs truncate">
                    <ItemTemplate>
                        <asp:Label ID="LabelStatus" runat="server" Text='<%# Eval("PROJECT_STATUS") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxStatus" runat="server" Text='<%# Bind("PROJECT_STATUS") %>' CssClass="w-full rounded py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="py-4 space-x-2 px-6 flex justify-center">
                    <ItemTemplate>
                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CausesValidation="False" ToolTip="Edit"
                            Text='<svg fill="#000000" width="25px" height="25px" viewBox="0 0 24 24" id="edit" data-name="Line Color" xmlns="http://www.w3.org/2000/svg" class="icon line-color"><line id="secondary" x1="21" y1="21" x2="3" y2="21" style="fill: none; stroke: rgb(34, 87, 122); stroke-linecap: round; stroke-linejoin: round; stroke-width: 2;"></line><path id="primary" d="M19.88,7,11,15.83,7,17l1.17-4,8.88-8.88A2.09,2.09,0,0,1,20,4,2.09,2.09,0,0,1,19.88,7Z" style="fill: none; stroke: rgb(34, 87, 122); stroke-linecap: round; stroke-linejoin: round; stroke-width: 2;"></path></svg>' />
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CausesValidation="False" ToolTip="Delete"
                            Text='<svg width="25px" height="25px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M7 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v2h4a1 1 0 1 1 0 2h-1.069l-.867 12.142A2 2 0 0 1 17.069 22H6.93a2 2 0 0 1-1.995-1.858L4.07 8H3a1 1 0 0 1 0-2h4V4zm2 2h6V4H9v2zM6.074 8l.857 12H17.07l.857-12H6.074zM10 10a1 1 0 0 1 1 1v6a1 1 0 1 1-2 0v-6a1 1 0 0 1 1-1zm4 0a1 1 0 0 1 1 1v6a1 1 0 1 1-2 0v-6a1 1 0 0 1 1-1z" fill="#8E2937"/></svg>'
                            OnClientClick="return confirm('Are you sure you want to delete this project?');" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECTS&quot; WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID" InsertCommand="INSERT INTO &quot;PROJECTS&quot; (&quot;PROJECT_ID&quot;, &quot;PROJECT_START_DATE&quot;, &quot;PROJECT_NAME&quot;, &quot;PROJECT_DUE_DATE&quot;, &quot;PROJECT_STATUS&quot;) VALUES (:PROJECT_ID, :PROJECT_START_DATE, :PROJECT_NAME, :PROJECT_DUE_DATE, :PROJECT_STATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_START_DATE&quot;, &quot;PROJECT_NAME&quot;, &quot;PROJECT_DUE_DATE&quot;, &quot;PROJECT_STATUS&quot; FROM &quot;PROJECTS&quot;" UpdateCommand="UPDATE &quot;PROJECTS&quot; SET &quot;PROJECT_START_DATE&quot; = :PROJECT_START_DATE, &quot;PROJECT_NAME&quot; = :PROJECT_NAME, &quot;PROJECT_DUE_DATE&quot; = :PROJECT_DUE_DATE, &quot;PROJECT_STATUS&quot; = :PROJECT_STATUS WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID"
                OnInserted="SqlDataSource1_Inserted"
        OnUpdated="SqlDataSource1_Updated"
        OnDeleted="SqlDataSource1_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
            <asp:Parameter Name="PROJECT_START_DATE" Type="DateTime" />
            <asp:Parameter Name="PROJECT_NAME" Type="String" />
            <asp:Parameter Name="PROJECT_DUE_DATE" Type="DateTime" />
            <asp:Parameter Name="PROJECT_STATUS" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PROJECT_START_DATE" Type="DateTime" />
            <asp:Parameter Name="PROJECT_NAME" Type="String" />
            <asp:Parameter Name="PROJECT_DUE_DATE" Type="DateTime" />
            <asp:Parameter Name="PROJECT_STATUS" Type="String" />
            <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
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

