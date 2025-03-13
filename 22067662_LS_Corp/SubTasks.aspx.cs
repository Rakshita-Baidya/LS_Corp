using System;
using System.Web.UI.WebControls;

namespace _22067662_LS_Corp
{
    public partial class SubTasks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DropDownList2.DataSourceID = "SqlDataSource2";
                DropDownList2.DataTextField = "TASK_NAME";
                DropDownList2.DataValueField = "TASK_ID";
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("All Tasks", "-1"));
            }
        }

        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Subtask added successfully!', 'success');", true);
        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Subtask updated successfully!', 'info');", true);
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Subtask deleted successfully!', 'warning');", true);
        }
    }
}