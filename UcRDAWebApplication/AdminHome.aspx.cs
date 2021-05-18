using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UcRDAWebApplication.Controllers;
using UcRDAWebApplication.Models;

namespace UcRDAWebApplication.Interface.Admin
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string adminArea = Convert.ToString(Session["area"]);
            List<Issue> IssueList = IssueController.GetIssueByArea(adminArea);
            int count = IssueList.Count;
            lblIssue.Text = Convert.ToString(count);

            initial();
        }

        public void initial()
        {
            string type = Convert.ToString(Session["type"]);
            if (type != "UC")
            {
                string adminArea = Convert.ToString(Session["area"]);
                List<Users> UsersList = UserController.GetAllWorkersByTypeAndArea(adminArea, 1);
                int count = UsersList.Count;
                lblWork.Text = Convert.ToString(count);
            }
            else
            {
                string adminArea = Convert.ToString(Session["area"]);
                List<Users> UsersList = UserController.GetAllWorkersByTypeAndArea(adminArea, 0);
                int count = UsersList.Count;
                lblWork.Text = Convert.ToString(count);
            }
        }
    }
}