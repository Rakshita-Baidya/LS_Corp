<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="_22067662_LS_Corp.Comments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Comments
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="mb-8 text-4xl font-bold text-[#6B1F29]">Comments Management</h2>

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="COMMENT_ID" DataSourceID="SqlDataSource1" CssClass="mb-8 w-1/2" OnPageIndexChanging="FormView1_PageIndexChanging">
        <InsertItemTemplate>
            <div class="gap-4 p-6 grid grid-cols-1 rounded border-2 border-[#6B1F29]">
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">Comment ID:</label>
                    <asp:TextBox ID="COMMENT_IDTextBox" runat="server" Text='<%# Bind("COMMENT_ID") %>' CssClass="w-full rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">Message:</label>
                    <asp:TextBox ID="COMMENT_MESSAGETextBox" runat="server" Text='<%# Bind("COMMENT_MESSAGE") %>' CssClass="w-full rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">Task:</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASK_NAME" DataValueField="TASK_ID" SelectedValue='<%# Bind("TASK_ID") %>' CssClass="w-full rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]">
                    </asp:DropDownList>
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">Date Time:</label>
                    <asp:TextBox ID="COMMENT_DATETIMETextBox" TextMode="DateTimeLocal" runat="server" Text='<%# Bind("COMMENT_DATETIME") %>' CssClass="w-full rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                </div>
                <div class="space-y-2">
                    <label class="text-gray-700 block text-sm font-medium">User:</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="USER_NAME" DataValueField="USER_ID" SelectedValue='<%# Bind("USER_ID") %>' CssClass="w-full rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]">
                    </asp:DropDownList>
                </div>
                <div class="space-x-4 pt-4 flex">
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="text-white px-4 py-2 rounded-sm bg-[#8E2937] hover:bg-[#6B1F29]" />
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="bg-gray-200 text-gray-700 px-4 py-2 rounded-sm hover:bg-gray-300" />
                </div>
            </div>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Comment" CssClass="text-white px-4 py-2 rounded-sm bg-[#8E2937] hover:bg-[#6B1F29]" />
        </ItemTemplate>
    </asp:FormView>

    <div class="p-6 mb-8 overflow-x-auto rounded-lg border-2 border-[#6B1F29] shadow-lg">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="COMMENT_ID" DataSourceID="SqlDataSource1" CssClass="divide-gray-200 w-full divide-y truncate text-center"
            HeaderStyle-CssClass="bg-[#F5E6E8] text-lg"
            RowStyle-CssClass="bg-white text-md text-gray-900 hover:bg-gray-50"
            AlternatingRowStyle-CssClass="bg-gray-50 hover:bg-gray-100" AllowPaging="True" PageSize="7">
            <PagerSettings Mode="NextPrevious"
                PreviousPageImageUrl="~/Images/prev.svg"
                PreviousPageText="Prev"
                NextPageImageUrl="~/Images/next.svg"
                NextPageText="Next"
                PageButtonCount="4" />
            <PagerStyle HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField DataField="COMMENT_ID" HeaderText="ID" ReadOnly="True" SortExpression="COMMENT_ID" ItemStyle-CssClass="px-6 py-4" />
                <asp:TemplateField HeaderText="Message" SortExpression="COMMENT_MESSAGE" ItemStyle-CssClass="px-3 py-4 max-w-64 truncate">
                    <ItemTemplate>
                        <asp:Label ID="LabelMessage" runat="server" Text='<%# Eval("COMMENT_MESSAGE") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxMessage" runat="server" Text='<%# Bind("COMMENT_MESSAGE") %>' CssClass="w-full rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date Time" SortExpression="COMMENT_DATETIME" ItemStyle-CssClass="px-6 py-4 max-w-64 truncate">
                    <ItemTemplate>
                        <asp:Label ID="LabelDateTime" runat="server" Text='<%# Eval("COMMENT_DATETIME", "{0:dd MMMM, yyyy h:mm tt}") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxDateTime" runat="server" TextMode="DateTimeLocal" Text='<%# Bind("COMMENT_DATETIME", "{0:yyyy-MM-ddTHH:mm}") %>' CssClass="w-full rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Task ID" SortExpression="TASK_ID" ItemStyle-CssClass="px-3 py-4 max-w-20">
                    <ItemTemplate>
                        <asp:Label ID="LabelTaskID" runat="server" Text='<%# Eval("TASK_ID") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListTaskEdit" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASK_NAME" DataValueField="TASK_ID" SelectedValue='<%# Bind("TASK_ID") %>' CssClass="w-full rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Task Name">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownListTaskName" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASK_NAME" DataValueField="TASK_ID" SelectedValue='<%# Eval("TASK_ID") %>' Enabled="False" CssClass="px-6 py-4 text-center text-[#000000] bg-transparent max-w-48 appearance-none truncate" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User ID" SortExpression="USER_ID" ItemStyle-CssClass="px-6 py-4 max-w-28">
                    <ItemTemplate>
                        <asp:Label ID="LabelUserID" runat="server" Text='<%# Eval("USER_ID") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListUserEdit" runat="server" DataSourceID="SqlDataSource3" DataTextField="USER_NAME" DataValueField="USER_ID" SelectedValue='<%# Bind("USER_ID") %>' CssClass="w-full rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User Name">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownListUserName" runat="server" DataSourceID="SqlDataSource3" DataTextField="USER_NAME" DataValueField="USER_ID" SelectedValue='<%# Eval("USER_ID") %>' Enabled="False" CssClass="px-6 py-4 text-center text-[#000000] bg-transparent appearance-none truncate max-w-40" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="py-4 space-x-2 px-6 flex justify-center">
                    <ItemTemplate>
                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CausesValidation="False" ToolTip="Edit"
                            Text='<svg fill="#000000" width="25px" height="25px" viewBox="0 0 24 24" id="edit" data-name="Line Color" xmlns="http://www.w3.org/2000/svg" class="icon line-color"><line id="secondary" x1="21" y1="21" x2="3" y2="21" style="fill: none; stroke: rgb(34, 87, 122); stroke-linecap: round; stroke-linejoin: round; stroke-width: 2;"></line><path id="primary" d="M19.88,7,11,15.83,7,17l1.17-4,8.88-8.88A2.09,2.09,0,0,1,20,4,2.09,2.09,0,0,1,19.88,7Z" style="fill: none; stroke: rgb(34, 87, 122); stroke-linecap: round; stroke-linejoin: round; stroke-width: 2;"></path></svg>' />
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CausesValidation="False" ToolTip="Delete"
                            Text='<svg width="25px" height="25px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M7 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v2h4a1 1 0 1 1 0 2h-1.069l-.867 12.142A2 2 0 0 1 17.069 22H6.93a2 2 0 0 1-1.995-1.858L4.07 8H3a1 1 0 0 1 0-2h4V4zm2 2h6V4H9v2zM6.074 8l.857 12H17.07l.857-12H6.074zM10 10a1 1 0 0 1 1 1v6a1 1 0 1 1-2 0v-6a1 1 0 0 1 1-1zm4 0a1 1 0 0 1 1 1v6a1 1 0 1 1-2 0v-6a1 1 0 0 1 1-1z" fill="#8E2937"/></svg>'
                            OnClientClick="return confirm('Are you sure you want to delete this comment?');" />
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;COMMENTS&quot; WHERE &quot;COMMENT_ID&quot; = :COMMENT_ID" InsertCommand="INSERT INTO &quot;COMMENTS&quot; (&quot;COMMENT_ID&quot;, &quot;COMMENT_MESSAGE&quot;, &quot;COMMENT_DATETIME&quot;, &quot;USER_ID&quot;, &quot;TASK_ID&quot;) VALUES (:COMMENT_ID, :COMMENT_MESSAGE, :COMMENT_DATETIME, :USER_ID, :TASK_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COMMENT_ID&quot;, &quot;COMMENT_MESSAGE&quot;, &quot;COMMENT_DATETIME&quot;, &quot;USER_ID&quot;, &quot;TASK_ID&quot; FROM &quot;COMMENTS&quot;" UpdateCommand="UPDATE &quot;COMMENTS&quot; SET &quot;COMMENT_MESSAGE&quot; = :COMMENT_MESSAGE, &quot;COMMENT_DATETIME&quot; = :COMMENT_DATETIME, &quot;USER_ID&quot; = :USER_ID, &quot;TASK_ID&quot; = :TASK_ID WHERE &quot;COMMENT_ID&quot; = :COMMENT_ID">
        <DeleteParameters>
            <asp:Parameter Name="COMMENT_ID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="COMMENT_ID" Type="Decimal" />
            <asp:Parameter Name="COMMENT_MESSAGE" Type="String" />
            <asp:Parameter Name="COMMENT_DATETIME" Type="DateTime" />
            <asp:Parameter Name="USER_ID" Type="Decimal" />
            <asp:Parameter Name="TASK_ID" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="COMMENT_MESSAGE" Type="String" />
            <asp:Parameter Name="COMMENT_DATETIME" Type="DateTime" />
            <asp:Parameter Name="USER_ID" Type="Decimal" />
            <asp:Parameter Name="TASK_ID" Type="Decimal" />
            <asp:Parameter Name="COMMENT_ID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_NAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
</asp:Content>
