using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using UcRDAWebApplication.Controllers;
using UcRDAWebApplication.Models;

namespace UcRDAWebApplication
{
    public partial class Issues : System.Web.UI.Page
    {
        private Issue glIssue;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblId.Visible = false;
            
            string type = Convert.ToString(Session["type"]);
            if (type == "rda")
            {
                BindRDAGrid();
            }
            else {
                BindGrid();
            }
            
            btnAssign.Enabled = false;
            btnAssignToWorker.Enabled = false;
            btnRemove.Enabled = false;
            dlWorkers.Enabled = false;
        }

        public void InitializeGrid()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[5] { new DataColumn("Id"), new DataColumn("Image"), new DataColumn("Province"), new DataColumn("Date"), new DataColumn("RoadType") });
            dt.Rows.Add(1, "", "WP", "2021/10/12", "Normal");
            dgIssues.DataSource = dt;
            dgIssues.DataBind();

            dgIssuesRda.DataSource = dt;
            dgIssuesRda.DataBind();
        }

        private void BindGrid()
        {
            string adminArea =Convert.ToString(Session["area"]);
            List<Issue> IssueList = IssueController.GetIssueByArea(adminArea);
            int count = IssueList.Count;

            dgIssuesRda.DataSource = IssueList;
            dgIssuesRda.DataBind();
        }

        private void BindRDAGrid()
        {
            string adminArea = Convert.ToString(Session["area"]);
            List<Issue> IssueList = IssueController.GetRDAIssues(adminArea);
            int count = IssueList.Count;

            dgIssues.DataSource = IssueList;
            dgIssues.DataBind();
        }

        protected void dgIssuesRda_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void dgIssuesRda_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            btnRemove.Enabled = true;
            btnAssign.Enabled = true;
            Issue issu = new Issue();
            string id = (dgIssuesRda.Rows[e.NewSelectedIndex].Cells[1].Text).ToString();
            IssueController cont = new IssueController();
            issu = cont.GetIssueById(id);
            lblId.Text = id;
            glIssue = issu;
            IssueImage.ImageUrl = IMageConvert(issu.Image);

            switch (issu.IssueType)
            {
                case 1:
                    lblIssueTypeValue.Text = "Pothole" ; break;
                case 2:
                    lblIssueTypeValue.Text = "Brocken Street light"; break;
                case 3:
                    lblIssueTypeValue.Text = "Drain line Block"; break;
                case 4:
                    lblIssueTypeValue.Text = "Under Construction";break;
            }

            lblRoadTypeValue.Text = issu.RoadType;
            lblDateValue.Text = issu.Date;
            lblProvinceValue.Text = issu.Province;
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            string id = lblId.Text;
            Issue issu = new Issue();
            IssueController cont = new IssueController();
            issu = cont.GetIssueById(id);
            issu.Status = "Assigned";
            bool res = IssueController.UpdateStatus(issu);
            if (res)
            {
                MessageBox.Show("Success!");
                lblId.Text = "";
                lblIssueTypeValue.Text = "N/A";
                lblRoadTypeValue.Text = "N/A";
                lblDateValue.Text = "N/A";
                lblProvinceValue.Text = "N/A";
                btnRemove.Enabled = false;
                btnAssign.Enabled = false;
                IssueImage.ImageUrl = null;
            }
            else
            {
                MessageBox.Show("Error!");
            }
            BindGrid();

        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            string id = lblId.Text;
            bool res = IssueController.RemoveIssue(id);

            if (res)
            {
                MessageBox.Show("Success!");
                lblId.Text = "";
                lblIssueTypeValue.Text = "N/A";
                lblRoadTypeValue.Text = "N/A";
                lblDateValue.Text = "N/A";
                lblProvinceValue.Text = "N/A";
                btnRemove.Enabled = false;
                btnAssign.Enabled = false;
                
                BindGrid();
            }
            else
            {
                MessageBox.Show("Error!");
            }
            
        }

        protected void dlWorkers_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void dgIssues_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            dlWorkers.Enabled = true;
            Issue issu = new Issue();
            string id = (dgIssues.Rows[e.NewSelectedIndex].Cells[1].Text).ToString();
            IssueController cont = new IssueController();
            issu = cont.GetIssueById(id);
            lblId.Text = id;
            glIssue = issu;
            IssueImage.ImageUrl = IMageConvert(issu.Image);
            BindDropDownList();
            switch (issu.IssueType)
            {
                case 1:
                    lblIssueTypeValue.Text = "Pothole"; break;
                case 2:
                    lblIssueTypeValue.Text = "Brocken Street light"; break;
                case 3:
                    lblIssueTypeValue.Text = "Drain line Block"; break;
                case 4:
                    lblIssueTypeValue.Text = "Under Construction"; break;
            }
            
            lblRoadTypeValue.Text = issu.RoadType;
            lblDateValue.Text = issu.Date;
            lblProvinceValue.Text = issu.Province;
            btnAssignToWorker.Enabled = true;
        }

        private void BindDropDownList()
        {
            string area = Convert.ToString(Session["area"]);
            List<Users> users = UserController.GetRDAWorkers(area);
            DataTable dt = new DataTable();
            dt = UserController.ToDataTable(users);
            dlWorkers.DataSource = dt;
            dlWorkers.DataBind();
            dlWorkers.DataTextField = "Name";
            dlWorkers.DataValueField = "ID";
            dlWorkers.DataBind();
        }

        protected string IMageConvert(byte[] arrayOdByte)
        {
            string imreBase64Data = Convert.ToBase64String(arrayOdByte);
            string imgDataURL = string.Format("data:image/png;base64,{0}", imreBase64Data);

            return imgDataURL;
        }

        protected void btnAssignToWorker_Click(object sender, EventArgs e)
        {
            string id = Convert.ToString(dlWorkers.SelectedItem.Value);
            string iid = lblId.Text;
            Issue issu = new Issue();
            IssueController cont = new IssueController();
            issu = cont.GetIssueById(iid);
            issu.Status = "Working";
            bool res = IssueController.UpdateStatus(issu);
            if (res)
            {
                MessageBox.Show("Success!");
                lblId.Text = "";
                lblIssueTypeValue.Text = "N/A";
                lblRoadTypeValue.Text = "N/A";
                lblDateValue.Text = "N/A";
                lblProvinceValue.Text = "N/A";
                btnRemove.Enabled = false;
                btnAssign.Enabled = false;
                IssueImage.ImageUrl = null;
            }
            else
            {
                MessageBox.Show("Error!");
            }

            Work work = new Work();
            work.IssueId = iid;
            work.UserUd = id;
            work.Status = "Working";

            bool result = WorkController.AssignWork(work);
            if (result)
            {

            }
            else { 

            }
            BindGrid();
        }
    }
}