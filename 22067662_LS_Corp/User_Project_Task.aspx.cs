using System;
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