using System;
using System.Web.UI.WebControls;

namespace _22067662_LS_Corp
{
    public partial class Milestones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList3.DataSourceID = "SqlDataSource2";
                DropDownList3.DataTextField = "PROJECT_NAME";
                DropDownList3.DataValueField = "PROJECT_ID";
                DropDownList3.DataBind();
                DropDownList3.Items.Insert(0, new ListItem("All Projects", "-1"));
            }
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Milestone added successfully!', 'success');", true);
        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Milestone updated successfully!', 'info');", true);
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Milestone deleted successfully!', 'warning');", true);
        }
    }
}