using System;
using System.Configuration;
using System.Data.OracleClient;
using System.Web.UI.WebControls;

namespace _22067662_LS_Corp
{
    public partial class User_Resource : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.DataSourceID = "SqlDataSource2";
                DropDownList1.DataTextField = "USER_NAME";
                DropDownList1.DataValueField = "USER_ID";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("All Users", "-1"));

                DropDownList2.DataSourceID = "SqlDataSource3";
                DropDownList2.DataTextField = "TASK_NAME";
                DropDownList2.DataValueField = "TASK_ID";
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("All Tasks", "-1"));

                DropDownList3.DataSourceID = "SqlDataSource4";
                DropDownList3.DataTextField = "RESOURCE_NAME";
                DropDownList3.DataValueField = "RESOURCE_ID";
                DropDownList3.DataBind();
                DropDownList3.Items.Insert(0, new ListItem("All Resources", "-1"));
            }
        }

        protected void DropDownListUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList userDropDown = (DropDownList)FormView1.FindControl("DropDownListUser");
            DropDownList taskDropDown = (DropDownList)FormView1.FindControl("DropDownListTask");

            if (userDropDown != null && taskDropDown != null)
            {
                string userId = userDropDown.SelectedValue;
                PopulateTaskDropdown(taskDropDown, userId);
            }
        }

        private void PopulateTaskDropdown(DropDownList taskDropDown, string userId)
        {
            taskDropDown.Items.Clear();
            taskDropDown.Items.Add(new ListItem("Select Task", ""));

            if (!string.IsNullOrEmpty(userId))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string query = @"
                    SELECT DISTINCT t.TASK_ID, t.TASK_NAME 
                    FROM TASKS t 
                    INNER JOIN USER_PROJECT_TASK upt ON t.TASK_ID = upt.TASK_ID 
                    WHERE upt.USER_ID = :USER_ID";

                using (OracleConnection conn = new OracleConnection(connectionString))
                using (OracleCommand cmd = new OracleCommand(query, conn))
                {
                    cmd.Parameters.Add(new OracleParameter("USER_ID", userId));
                    conn.Open();
                    using (OracleDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            taskDropDown.Items.Add(new ListItem(
                                reader["TASK_NAME"].ToString(),
                                reader["TASK_ID"].ToString()
                            ));
                        }
                    }
                }
            }
        }
        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Resource given to user successfully!', 'success');", true);
        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Assigned resource updated successfully!', 'info');", true);
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Assigned resource deleted successfully!', 'warning');", true);
        }
    }
}