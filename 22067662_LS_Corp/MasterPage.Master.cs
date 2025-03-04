using System;
using System.Web.UI.WebControls;

namespace _22067662_LS_Corp
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string currentPage = System.IO.Path.GetFileName(Request.Path).ToLower();

                foreach (MenuItem item in Menu1.Items)
                {
                    string navigateUrl = item.NavigateUrl.ToLower().Replace("~", "").TrimStart('/');

                    if (navigateUrl == currentPage)
                    {
                        item.Selected = true;
                        break;
                    }
                }
            }
        }
    }
}