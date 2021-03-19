using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UcRDAWebApplication
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void submitbtn_Click(object sender, EventArgs e)
        {
            Session["type"] = Convert.ToString(txtUserName.Text);
            Session["username"] = Convert.ToString(txtPassword.Text);
            Response.Redirect("AdminHome.aspx");
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }
    }
}