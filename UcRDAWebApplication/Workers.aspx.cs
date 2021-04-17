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
                    txtLocation.Text = Convert.ToString(Session["area"]);
                    txtLocation.Enabled = false;
                }
                else {
                    BindUCUsers();
                    txtLocation.Text = Convert.ToString(Session["area"]);
                    txtLocation.Enabled = false;
                }
              

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Users user = new Users();
            string type = Convert.ToString(Session["type"]);
            if (type != "UC")
            {
                user.Name = txtName.Text;
                user.NIC = txtNic.Text;
                user.Password = txtPassword.Text;
                user.Work = 1;
                user.Type = Convert.ToInt32(dlType.SelectedItem.Value);
                user.LocationArea = txtLocation.Text;
                bool res = UserController.CreatweUser(user);
                BindRDAUsers();
            }
            else
            {
                user.Name = txtName.Text;
                user.NIC = txtNic.Text;
                user.Password = txtPassword.Text;
                user.Work = 0;
                user.Type = 0;
                user.LocationArea = txtLocation.Text;
                bool res = UserController.CreatweUser(user);
                BindUCUsers();
            }
        }

        //removed button
        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string type = Convert.ToString(Session["type"]);
            if (type != "UC")
            {
                
            }
            else
            {
              
            }
        }

        protected void dgWorkers_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string id = (dgWorkers.Rows[e.NewSelectedIndex].Cells[1].Text).ToString();
            Users user = UserController.GetUSerById(id);
            txtId.Text = id;
            txtName.Text = user.Name;
            txtNic.Text = user.NIC;
            dlType.SelectedValue = Convert.ToString(user.Type);
            txtPassword.Text = user.Password;
            txtPassword.Enabled = false;
            btnAdd.Enabled = false;
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