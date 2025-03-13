using System;
using System.Web.UI.WebControls;

namespace _22067662_LS_Corp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.DataSourceID = "SqlDataSource8";
                DropDownList1.DataTextField = "PROJECT_NAME";
                DropDownList1.DataValueField = "PROJECT_ID";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("All Projects", "-1"));
                DropDownList1.SelectedValue = "-1";
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource7_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}