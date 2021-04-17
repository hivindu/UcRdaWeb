using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UcRDAWebApplication.Controllers;
using UcRDAWebApplication.Models;

namespace UcRDAWebApplication
{
    public partial class AssignedTask : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
        }

        private void BindGrid()
        {
            string adminArea = Convert.ToString(Session["area"]);
            List<Work> IssueList = WorkController.GetTaskByArea(adminArea);
            
            dgAssignedTask.DataSource = IssueList;
            dgAssignedTask.DataBind();
        }
    }
}