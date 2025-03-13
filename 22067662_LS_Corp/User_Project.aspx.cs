using System;
using System.Web.UI.WebControls;

namespace _22067662_LS_Corp
{
    public partial class User_Project : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList8.DataSourceID = "SqlDataSource2";
                DropDownList8.DataTextField = "USER_NAME";
                DropDownList8.DataValueField = "USER_ID";
                DropDownList8.DataBind();
                DropDownList8.Items.Insert(0, new ListItem("All Users", "-1"));

                DropDownList9.DataSourceID = "SqlDataSource3";
                DropDownList9.DataTextField = "PROJECT_NAME";
                DropDownList9.DataValueField = "PROJECT_ID";
                DropDownList9.DataBind();
                DropDownList9.Items.Insert(0, new ListItem("All Projects", "-1"));
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Project assigned to user successfully!', 'success');", true);
        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Assigned Project updated successfully!', 'info');", true);
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Assigned Project deleted successfully!', 'warning');", true);
        }
    }
}