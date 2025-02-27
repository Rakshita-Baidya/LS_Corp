<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="_22067662_LS_Corp.Projects" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Projects List</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="flex min-h-screen">
            <div class="w-52 fixed h-full bg-[#8E2937]">
                <div class="p-4 border-b-2 border-[#6B1F29]">
                    <h1 class="text-white text-xl font-bold">LS Corporation</h1>
                </div>
                <asp:Menu
                    runat="server"
                    CssClass="space-y-1 p-4 flex flex-col"
                    StaticMenuItemStyle-CssClass="text-white px-4 py-3 w-44 rounded-md text-lg font-medium hover:bg-[#6B1F29]"
                    StaticSelectedStyle-CssClass="bg-[#47151B]">
                    <Items>
                        <asp:MenuItem NavigateUrl="/Default.aspx" Text="Dashboard" Value="Default"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="/Users.aspx" Text="Users" Value="Users"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="/Projects.aspx" Text="Projects" Value="Projects"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="/Milestones.aspx" Text="Milestones" Value="Milestones"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="/Tasks.aspx" Text="Tasks" Value="Tasks"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="/SubTasks.aspx" Text="SubTasks" Value="SubTasks"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="/Resources.aspx" Text="Resources" Value="Resources"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="/Comments.aspx" Text="Comments" Value="Comments"></asp:MenuItem>
                    </Items>
                </asp:Menu>
            </div>

            <div class="ml-52 p-8 flex-1">
                <div class="bg-white p-6 mb-8 rounded-lg border-2 border-[#6B1F29] shadow-lg">
                    <h2 class="mb-6 text-2xl font-bold text-[#6B1F29]">Project Management</h2>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1" CssClass="mb-8" OnPageIndexChanging="FormView1_PageIndexChanging">
                        <InsertItemTemplate>
                            <div class="gap-4 grid grid-cols-1">
                                <div class="space-y-2">
                                    <label class="text-gray-700 block text-sm font-medium">ID:</label>
                                    <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' CssClass="w-max rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                                </div>
                                <div class="space-y-2">
                                    <label class="text-gray-700 block text-sm font-medium">
                                        START DATE:</label>
                                    <asp:TextBox ID="PROJECT_START_DATETextBox" runat="server" Text='<%# Bind("PROJECT_START_DATE") %>' CssClass="w-max rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                                </div>
                                <div class="space-y-2">
                                    <label class="text-gray-700 block text-sm font-medium">
                                        NAME:</label>
                                    <asp:TextBox ID="PROJECT_NAMETextBox" runat="server" Text='<%# Bind("PROJECT_NAME") %>' CssClass="w-max rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                                </div>
                                <div class="space-y-2">
                                    <label class="text-gray-700 block text-sm font-medium">
                                        DUE DATE:</label>
                                    <asp:TextBox ID="PROJECT_DUE_DATETextBox" runat="server" Text='<%# Bind("PROJECT_DUE_DATE") %>' CssClass="w-max rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                                </div>
                                <div class="space-y-2">
                                    <label class="text-gray-700 block text-sm font-medium">
                                        STATUS:</label>
                                    <asp:TextBox ID="PROJECT_STATUSTextBox" runat="server" Text='<%# Bind("PROJECT_STATUS") %>' CssClass="w-max rounded-sm py-1 px-2 border border-gray-500 shadow-sm focus:border-[#B54555] focus:ring-[#B54555]" />
                                </div>
                                <div class="space-x-4 pt-4 flex">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="text-white px-4 py-2 rounded-sm bg-[#8E2937] hover:bg-[#6B1F29]" />
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="bg-gray-200 text-gray-700 px-4 py-2 rounded-sm hover:bg-gray-300" />
                                </div>
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Project" CssClass="text-white px-4 py-2 rounded-sm bg-[#8E2937] hover:bg-[#6B1F29]" />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1" CssClass="divide-gray-200 min-w-full divide-y text-center"
                        HeaderStyle-CssClass="bg-[#F5E6E8] text-lg"
                        RowStyle-CssClass="bg-white text-md text-gray-900 hover:bg-gray-50"
                        AlternatingRowStyle-CssClass="bg-gray-50 hover:bg-gray-100" AllowPaging="True" AllowSorting="True"
                        PageSize="5">
                        <PagerSettings Mode="NextPrevious"
                            PreviousPageImageUrl="~/Images/prev.svg"
                            PreviousPageText="Prev"
                            NextPageImageUrl="~/Images/next.svg"
                            NextPageText="Next"
                            PageButtonCount="4" />
                        <PagerStyle HorizontalAlign="Center" CssClass="mt-4 text-2xl font-semibold text-[#8E2937]" />

                        <Columns>
                            <asp:BoundField DataField="PROJECT_ID" HeaderText="ID" ReadOnly="True" SortExpression="PROJECT_ID" ItemStyle-CssClass="px-6 py-4" />
                            <asp:BoundField DataField="PROJECT_NAME" HeaderText="NAME" SortExpression="PROJECT_NAME" ItemStyle-CssClass="px-6 py-4" />
                            <asp:BoundField DataField="PROJECT_START_DATE" HeaderText="START_DATE" SortExpression="PROJECT_START_DATE" DataFormatString="{0:dd MMMM,yyyy}" ItemStyle-CssClass="px-6 py-4" />
                            <asp:BoundField DataField="PROJECT_DUE_DATE" HeaderText="DUE_DATE" SortExpression="PROJECT_DUE_DATE" DataFormatString="{0:dd MMMM,yyyy}" ItemStyle-CssClass="px-6 py-4" />
                            <asp:BoundField DataField="PROJECT_STATUS" HeaderText="STATUS" SortExpression="PROJECT_STATUS" ItemStyle-CssClass="px-6 py-4" />
                            <asp:CommandField HeaderText="Actions" ShowDeleteButton="True" ShowEditButton="True"
                                ButtonType="Link"
                                EditText='<svg fill="#000000" width="25px" height="25px" viewBox="0 0 24 24" id="edit" data-name="Line Color" xmlns="http://www.w3.org/2000/svg" class="icon line-color"><line id="secondary" x1="21" y1="21" x2="3" y2="21" style="fill: none; stroke: rgb(34, 87, 122); stroke-linecap: round; stroke-linejoin: round; stroke-width: 2;"></line><path id="primary" d="M19.88,7,11,15.83,7,17l1.17-4,8.88-8.88A2.09,2.09,0,0,1,20,4,2.09,2.09,0,0,1,19.88,7Z" style="fill: none; stroke: rgb(34, 87, 122); stroke-linecap: round; stroke-linejoin: round; stroke-width: 2;"></path></svg>'
                                DeleteText='<svg width="25px" height="25px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M7 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v2h4a1 1 0 1 1 0 2h-1.069l-.867 12.142A2 2 0 0 1 17.069 22H6.93a2 2 0 0 1-1.995-1.858L4.07 8H3a1 1 0 0 1 0-2h4V4zm2 2h6V4H9v2zM6.074 8l.857 12H17.07l.857-12H6.074zM10 10a1 1 0 0 1 1 1v6a1 1 0 1 1-2 0v-6a1 1 0 0 1 1-1zm4 0a1 1 0 0 1 1 1v6a1 1 0 1 1-2 0v-6a1 1 0 0 1 1-1z" fill="#8E2937"/></svg>'
                                UpdateText='<span class="text-green-600 text-lg hover:text-green-800">Update</span>'
                                CancelText='<span class="text-gray-600 text-lg hover:text-gray-800">Cancel</span>'
                                ItemStyle-CssClass="text-lg px-6 py-4 text-sm font-medium flex space-x-3" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECTS&quot; WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID" InsertCommand="INSERT INTO &quot;PROJECTS&quot; (&quot;PROJECT_ID&quot;, &quot;PROJECT_START_DATE&quot;, &quot;PROJECT_NAME&quot;, &quot;PROJECT_DUE_DATE&quot;, &quot;PROJECT_STATUS&quot;) VALUES (:PROJECT_ID, :PROJECT_START_DATE, :PROJECT_NAME, :PROJECT_DUE_DATE, :PROJECT_STATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_START_DATE&quot;, &quot;PROJECT_NAME&quot;, &quot;PROJECT_DUE_DATE&quot;, &quot;PROJECT_STATUS&quot; FROM &quot;PROJECTS&quot;" UpdateCommand="UPDATE &quot;PROJECTS&quot; SET &quot;PROJECT_START_DATE&quot; = :PROJECT_START_DATE, &quot;PROJECT_NAME&quot; = :PROJECT_NAME, &quot;PROJECT_DUE_DATE&quot; = :PROJECT_DUE_DATE, &quot;PROJECT_STATUS&quot; = :PROJECT_STATUS WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID">
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

    </form>
</body>
</html>
