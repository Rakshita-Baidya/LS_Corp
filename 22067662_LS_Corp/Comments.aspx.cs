using System;
using System.Web.UI.WebControls;

namespace _22067662_LS_Corp
{
    public partial class Comments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.DataSourceID = "SqlDataSource3";
                DropDownList1.DataTextField = "USER_NAME";
                DropDownList1.DataValueField = "USER_ID";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("All Users", "-1"));

                DropDownList2.DataSourceID = "SqlDataSource2";
                DropDownList2.DataTextField = "TASK_NAME";
                DropDownList2.DataValueField = "TASK_ID";
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("All Tasks", "-1"));
            }
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Comment added successfully!', 'success');", true);
        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Comment updated successfully!', 'info');", true);
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "toast", "showToast('Comment deleted successfully!', 'warning');", true);
        }
    }
}