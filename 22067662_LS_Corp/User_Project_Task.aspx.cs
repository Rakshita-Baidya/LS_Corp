using System;
using System.Configuration;
using System.Data.OracleClient;
using System.Web.UI.WebControls;

namespace _22067662_LS_Corp
{
    public partial class User_Project_Task : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList4.DataSourceID = "SqlDataSource2";
                DropDownList4.DataTextField = "USER_NAME";
                DropDownList4.DataValueField = "USER_ID";
                DropDownList4.DataBind();
                DropDownList4.Items.Insert(0, new ListItem("All Users", "-1"));

                DropDownList5.DataSourceID = "SqlDataSource3";
                DropDownList5.DataTextField = "PROJECT_NAME";
                DropDownList5.DataValueField = "PROJECT_ID";
                DropDownList5.DataBind();
                DropDownList5.Items.Insert(0, new ListItem("All Projects", "-1"));

                DropDownList6.DataSourceID = "SqlDataSource4";
                DropDownList6.DataTextField = "TASK_NAME";
                DropDownList6.DataValueField = "TASK_ID";
                DropDownList6.DataBind();
                DropDownList6.Items.Insert(0, new ListItem("All Tasks", "-1"));
            }
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList userDropDown = (DropDownList)FormView2.FindControl("DropDownList2");
            DropDownList projectDropDown = (DropDownList)FormView2.FindControl("DropDownList3");

            if (userDropDown != null && projectDropDown != null)
            {
                string userId = userDropDown.SelectedValue;
                PopulateProjectDropdown(projectDropDown, userId);
            }
        }

        protected void DropDownListUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList userDropDown = (DropDownList)sender;
            GridViewRow row = (GridViewRow)userDropDown.NamingContainer;
            DropDownList projectDropDown = (DropDownList)row.FindControl("DropDownListProject");

            if (projectDropDown != null)
            {
                string userId = userDropDown.SelectedValue;
                PopulateProjectDropdown(projectDropDown, userId);
            }
        }

        private void PopulateProjectDropdown(DropDownList projectDropDown, string userId)
        {
            projectDropDown.Items.Clear();
            projectDropDown.Items.Add(new ListItem("Select Project", ""));

            if (!string.IsNullOrEmpty(userId))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string query = @"
                    SELECT p.PROJECT_ID, p.PROJECT_NAME 
                    FROM PROJECTS p 
                    INNER JOIN USER_PROJECT up ON p.PROJECT_ID = up.PROJECT_ID 
                    WHERE up.USER_ID = :USER_ID";

                using (OracleConnection conn = new OracleConnection(connectionString))
                using (OracleCommand cmd = new OracleCommand(query, conn))
                {
                    cmd.Parameters.Add(new OracleParameter("USER_ID", userId));
                    conn.Open();
                    using (OracleDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            projectDropDown.Items.Add(new ListItem(
                                reader["PROJECT_NAME"].ToString(),
                                reader["PROJECT_ID"].ToString()
                            ));
                        }
                    }
                }
            }
        }
        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Task assigned to user successfully!', 'success');", true);
        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Assigned task updated successfully!', 'info');", true);
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Assigned task deleted successfully!', 'warning');", true);
        }
    }
}