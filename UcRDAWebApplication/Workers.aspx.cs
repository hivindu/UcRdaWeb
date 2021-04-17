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
    public partial class Workers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string type = Convert.ToString(Session["type"]);
                if (type != "UC")
                {
                    BindRDAUsers();
                }
                else {
                    BindUCUsers();
                }
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void dgWorkers_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            
        }

        public void BindRDAUsers()
        {
            string adminArea = Convert.ToString(Session["area"]);
            List<Users> UsersList = UserController.GetAllWorkersByTypeAndArea(adminArea, 1);
    

            dgWorkers.DataSource = UsersList;
            dgWorkers.DataBind();
        }

        public void BindUCUsers()
        {
            string adminArea = Convert.ToString(Session["area"]);
            List<Users> UsersList = UserController.GetAllWorkersByTypeAndArea(adminArea, 0);

            dgWorkers.DataSource = UsersList;
            dgWorkers.DataBind();
        }
    }
}