using System;
using System.Drawing;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace _22067662_LS_Corp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ChartUserPosition.DataBind();
                ApplyCustomColors();
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        private void ApplyCustomColors()
        {
            Color[] customColors = { ColorTranslator.FromHtml("#8e2937"), ColorTranslator.FromHtml("#c6949b"),
                              ColorTranslator.FromHtml("#bb7e87"), ColorTranslator.FromHtml("#993e4b"),
                              ColorTranslator.FromHtml("#a4535e"), ColorTranslator.FromHtml("#af6973"),
                              ColorTranslator.FromHtml("#d1a9af")
            };

            int i = 0;
            foreach (DataPoint point in ChartUserPosition.Series["UserPosition"].Points)
            {
                point.Color = customColors[i % customColors.Length];
                i++;
            }
        }

    }
}