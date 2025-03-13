<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="User_Project.aspx.cs" Inherits="_22067662_LS_Corp.User_Project" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    User Project
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="mb-8 text-4xl font-bold text-[#6B1F29]">Assigned Project Management</h2>

    <asp:FormView ID="FormView2" runat="server" DataKeyNames="USER_PROJECT_ID" DataSourceID="SqlDataSource1" CssClass="mb-8 w-1/2">
        <InsertItemTemplate>
            <div class="gap-4 p-6 grid grid-cols-1 rounded border-2 border-[#6B1F29]">
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">User Project ID:</label>
                    <asp:TextBox ID="USER_PROJECT_IDTextBox" runat="server" Text='<%# Bind("USER_PROJECT_ID") %>' CssClass="w-full rounded border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">Project:</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>' CssClass="w-full rounded border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">User:</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="USER_NAME" DataValueField="USER_ID" SelectedValue='<%# Bind("USER_ID") %>' CssClass="w-full rounded border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-x-4 pt-4 flex">
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="text-white px-4 py-2 rounded bg-[#8E2937] hover:bg-[#6B1F29]" />
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="bg-gray-200 text-gray-700 px-4 py-2 rounded hover:bg-gray-300" />
                </div>
            </div>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add User-Project" CssClass="text-white px-4 py-2 rounded bg-[#8E2937] hover:bg-[#6B1F29]" />
        </ItemTemplate>
                <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add User-Project" CssClass="text-white px-4 py-2 rounded bg-[#8E2937] hover:bg-[#6B1F29]" />

</EmptyDataTemplate>
    </asp:FormView>

    <div class="mb-6 space-x-4 flex">
        <div>
            <asp:DropDownList ID="DropDownList8" runat="server" AutoPostBack="True" CssClass="py-1 px-2 max-w-48 border-gray-500 rounded border shadow-sm focus:border-[#B54555] focus:ring-[#B54555]">
                <asp:ListItem Text="All Users" Value="" />
            </asp:DropDownList>
        </div>
        <div>
            <asp:DropDownList ID="DropDownList9" runat="server" AutoPostBack="True" CssClass="py-1 px-2 max-w-48 border-gray-500 rounded border shadow-sm focus:border-[#B54555] focus:ring-[#B54555]">
                <asp:ListItem Text="All Projects" Value="" />
            </asp:DropDownList>
        </div>
    </div>

    <div class="p-6 mb-8 rounded-lg border-2 border-[#6B1F29] shadow-lg">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_PROJECT_ID" DataSourceID="SqlDataSource1" 
            CssClass="divide-gray-200 min-w-full divide-y truncate text-center"
            HeaderStyle-CssClass="bg-[#F5E6E8] text-lg"
            RowStyle-CssClass="bg-white text-md text-gray-900 hover:bg-gray-50"
            AlternatingRowStyle-CssClass="bg-gray-50 hover:bg-gray-100" AllowPaging="True" AllowSorting="True" PageSize="6" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
             EmptyDataText="No assigned project found" EmptyDataRowStyle-CssClass="text-gray-700 py-4 text-lg">
            <PagerSettings Mode="NextPrevious"
                PreviousPageImageUrl="~/Images/prev.svg"
                PreviousPageText="Prev"
                NextPageImageUrl="~/Images/next.svg"
                NextPageText="Next"
                PageButtonCount="4" />
            <PagerStyle HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField DataField="USER_PROJECT_ID" HeaderText="ID" ReadOnly="True" SortExpression="USER_PROJECT_ID" ItemStyle-CssClass="px-4 py-4" />
                <asp:TemplateField HeaderText="U.ID" SortExpression="USER_ID" ItemStyle-CssClass="px-4 py-4">
                    <ItemTemplate>
                        <asp:Label ID="LabelUserID" runat="server" Text='<%# Eval("USER_ID") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListUser" runat="server" DataSourceID="SqlDataSource2" DataTextField="USER_NAME" DataValueField="USER_ID" SelectedValue='<%# Bind("USER_ID") %>' 
                            CssClass="w-full rounded border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Username" ItemStyle-CssClass="px-4 py-4">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="USER_NAME" DataValueField="USER_ID" SelectedValue='<%# Eval("USER_ID") %>' Enabled="False" 
                            CssClass="w-full text-black bg-transparent border-none appearance-none text-center" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="P.ID" SortExpression="PROJECT_ID" ItemStyle-CssClass="px-4 py-4">
                    <ItemTemplate>
                        <asp:Label ID="LabelProjectID" runat="server" Text='<%# Eval("PROJECT_ID") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListProject" runat="server" DataSourceID="SqlDataSource3" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>' 
                            CssClass="w-full rounded border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="P.Name" ItemStyle-CssClass="px-4 py-4">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Eval("PROJECT_ID") %>' Enabled="False" 
                            CssClass="w-full text-black bg-transparent border-none appearance-none text-center" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="P.Start Date" ItemStyle-CssClass="px-4 py-4">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource3" DataTextField="PROJECT_START_DATE" DataValueField="PROJECT_ID" SelectedValue='<%# Eval("PROJECT_ID") %>' Enabled="False" 
                            CssClass="w-full text-black bg-transparent border-none appearance-none text-center" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="P.End Date" ItemStyle-CssClass="px-4 py-4">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource3" DataTextField="PROJECT_DUE_DATE" DataValueField="PROJECT_ID" SelectedValue='<%# Eval("PROJECT_ID") %>' Enabled="False" 
                            CssClass="w-full text-black bg-transparent border-none appearance-none text-center" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="P.Status" ItemStyle-CssClass="px-4 py-4">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource3" DataTextField="PROJECT_STATUS" DataValueField="PROJECT_ID" SelectedValue='<%# Eval("PROJECT_ID") %>' Enabled="False" 
                            CssClass="w-full text-black bg-transparent border-none appearance-none text-center" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="py-4 space-x-2 px-6 flex justify-center">
                    <ItemTemplate>
                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CausesValidation="False" ToolTip="Edit"
                            Text='<svg fill="#000000" width="25px" height="25px" viewBox="0 0 24 24" id="edit" data-name="Line Color" xmlns="http://www.w3.org/2000/svg" class="icon line-color"><line id="secondary" x1="21" y1="21" x2="3" y2="21" style="fill: none; stroke: rgb(34, 87, 122); stroke-linecap: round; stroke-linejoin: round; stroke-width: 2;"></line><path id="primary" d="M19.88,7,11,15.83,7,17l1.17-4,8.88-8.88A2.09,2.09,0,0,1,20,4,2.09,2.09,0,0,1,19.88,7Z" style="fill: none; stroke: rgb(34, 87, 122); stroke-linecap: round; stroke-linejoin: round; stroke-width: 2;"></path></svg>' />
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CausesValidation="False" ToolTip="Delete"
                            Text='<svg width="25px" height="25px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M7 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v2h4a1 1 0 1 1 0 2h-1.069l-.867 12.142A2 2 0 0 1 17.069 22H6.93a2 2 0 0 1-1.995-1.858L4.07 8H3a1 1 0 0 1 0-2h4V4zm2 2h6V4H9v2zM6.074 8l.857 12H17.07l.857-12H6.074zM10 10a1 1 0 0 1 1 1v6a1 1 0 1 1-2 0v-6a1 1 0 0 1 1-1zm4 0a1 1 0 0 1 1 1v6a1 1 0 1 1-2 0v-6a1 1 0 0 1 1-1z" fill="#8E2937"/></svg>'
                            OnClientClick="return confirm('Are you sure you want to delete this assigned project?');" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;USER_PROJECT&quot; WHERE &quot;USER_PROJECT_ID&quot; = :USER_PROJECT_ID" 
        InsertCommand="INSERT INTO &quot;USER_PROJECT&quot; (&quot;USER_PROJECT_ID&quot;, &quot;PROJECT_ID&quot;, &quot;USER_ID&quot;) VALUES (:USER_PROJECT_ID, :PROJECT_ID, :USER_ID)" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="SELECT USER_PROJECT_ID, PROJECT_ID, USER_ID FROM USER_PROJECT WHERE (:USER_ID = -1 OR USER_ID = :USER_ID) AND (:PROJECT_ID =-1 OR PROJECT_ID = :PROJECT_ID)" 
        UpdateCommand="UPDATE &quot;USER_PROJECT&quot; SET &quot;PROJECT_ID&quot; = :PROJECT_ID, &quot;USER_ID&quot; = :USER_ID WHERE &quot;USER_PROJECT_ID&quot; = :USER_PROJECT_ID"
        OnInserted="SqlDataSource1_Inserted"
        OnUpdated="SqlDataSource1_Updated"
        OnDeleted="SqlDataSource1_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="USER_PROJECT_ID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="USER_PROJECT_ID" Type="Decimal" />
            <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
            <asp:Parameter Name="USER_ID" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList8" Name="USER_ID" PropertyName="SelectedValue" Type="Decimal" DefaultValue="-1" />
<asp:ControlParameter ControlID="DropDownList9" Name="PROJECT_ID" PropertyName="SelectedValue" Type="Decimal" DefaultValue="-1" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
            <asp:Parameter Name="USER_ID" Type="Decimal" />
            <asp:Parameter Name="USER_PROJECT_ID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT PROJECT_ID, PROJECT_NAME, TO_CHAR(PROJECT_START_DATE, 'DD Month YYYY') AS PROJECT_START_DATE, TO_CHAR(PROJECT_DUE_DATE, 'DD Month YYYY') AS PROJECT_DUE_DATE, PROJECT_STATUS FROM PROJECTS"></asp:SqlDataSource>

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
