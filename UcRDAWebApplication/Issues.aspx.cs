using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UcRDAWebApplication
{
    public partial class Issues : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            InitializeGrid();
        }

        public void InitializeGrid()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[5] { new DataColumn("Id"), new DataColumn("Image"), new DataColumn("Province"), new DataColumn("Date"), new DataColumn("RoadType") });
            dt.Rows.Add(1,"","WP","2021/10/12","Normal");
            dgIssues.DataSource = dt;
            dgIssues.DataBind();

            dgIssuesRda.DataSource = dt;
            dgIssuesRda.DataBind();
        }
    }
}