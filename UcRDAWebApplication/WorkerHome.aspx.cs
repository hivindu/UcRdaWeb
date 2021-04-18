using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UcRDAWebApplication
{
    public partial class WorkerHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        private void BindGrid()
        {
            
        }

        private void BindDetrails()
        { }

        protected string IMageConvert(byte[] arrayOdByte)
        {
            string imreBase64Data = Convert.ToBase64String(arrayOdByte);
            string imgDataURL = string.Format("data:image/png;base64,{0}", imreBase64Data);

            return imgDataURL;
        }
    }
}