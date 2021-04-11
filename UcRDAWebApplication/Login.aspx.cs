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
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void submitbtn_Click(object sender, EventArgs e)
        {
            UserController uc = new UserController();

            string nic= Convert.ToString(txtUserName.Text);
            string pw = Convert.ToString(txtPassword.Text);

            Users user = uc.LoginValidation(nic, pw);

            if (user!= null)
            {
                Session["NIC"] =user.NIC ;
                Session["type"] = user.Type;
                Session["username"] = user.Name;
                Session["Work"] = user.Work;
                Session["area"] = user.LocationArea;
                if (user.Work < 1)
                {
                    Session["type"] = "UC";
                    Response.Redirect("AdminHome.aspx");
                }
                else {
                    Session["type"] = "rda";
                    if (user.Type != 0)
                    {
                        Response.Redirect("WorkerHome.aspx");
                    }
                    else {
                        Response.Redirect("AdminHome.aspx");
                    }
                }
                
            }
            else 
            {
                Session["Error"] = "Invalid Credentials";
            }
            
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }
    }
}