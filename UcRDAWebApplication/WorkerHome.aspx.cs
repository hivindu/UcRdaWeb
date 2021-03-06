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
    public partial class WorkerHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            UpdateStatus();
            CleanData();
        }

        private void BindGrid()
        {
            string id = Convert.ToString(Session["id"]);
            List<Work> TaskList = WorkController.GetTaskByWorkerId(id);
            int count = TaskList.Count;

            dgIssueList.DataSource = TaskList;
            dgIssueList.DataBind();
        }

        protected void dgIssueList_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string id = (dgIssueList.Rows[e.NewSelectedIndex].Cells[1].Text).ToString();
            string iid = (dgIssueList.Rows[e.NewSelectedIndex].Cells[2].Text).ToString();
            lblAssignedDate.Text = (dgIssueList.Rows[e.NewSelectedIndex].Cells[5].Text).ToString();
            lblArea.Text= (dgIssueList.Rows[e.NewSelectedIndex].Cells[4].Text).ToString();
            lblId.Text = id;
            BindDetails(iid);
            
        }

        private void BindDetails(string issueId)
        {
            IssueController controller = new IssueController();

            Issue issue = controller.GetIssueById(issueId);
            lblIId.Text = issueId;
            
            lblProvince.Text = issue.Province;
            lblRoadType.Text = issue.RoadType;
            lblDate.Text = issue.Date;
            imgIssue.ImageUrl = IMageConvert(issue.Image);
            switch (issue.IssueType)
            {
                case 1:
                    lblIssueType.Text = "Pothole"; break;
                case 2:
                    lblIssueType.Text = "Brocken Street light"; break;
                case 3:
                    lblIssueType.Text = "Drain line Block"; break;
                case 4:
                    lblIssueType.Text = "Under Construction"; break;
            }
            dlStatus.SelectedValue = issue.Status;
            BindMap(issue.Lat, issue.Long);
        }

        protected string IMageConvert(byte[] arrayOdByte)
        {
            string imreBase64Data = Convert.ToBase64String(arrayOdByte);
            string imgDataURL = string.Format("data:image/png;base64,{0}", imreBase64Data);

            return imgDataURL;
        }

        private void BindMap(double varLat,double varLong) 
        {
            string lat = Convert.ToString(varLat);
            string log = Convert.ToString(varLong);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction(" + lat + "," + log + ")", true);
        }

        private void UpdateStatus()
        {
            Users us = UserController.GetUSerById(Convert.ToString(Session["id"]));
            Work w = new Work();
            w.Id = lblId.Text;
            w.UserUd = Convert.ToString(Session["id"]);
            w.IssueId = lblIId.Text;
            w.Status = dlStatus.SelectedValue;
            w.Area = lblArea.Text;
            w.AssignedDate = Convert.ToDateTime(lblAssignedDate.Text);
            w.WorkerName = us.Name;

            bool res = WorkController.UpdateStatus(w);
            if (res)
            {
                Session["success"] = "Successfuly updated!";
            }
            else {
                Session["error"] = "Couldn't Update!";
            }
        }

        private void CleanData()
        {
            lblArea.Text = "N/A";
            lblAssignedDate.Text = "N/A";
            lblDate.Text = "N/A";
            lblId.Text = "N/A";
            lblIId.Text = "N/A";
            lblIssueType.Text = "N/A";
            lblProvince.Text = "N/A";
            lblRoadType.Text = "N/A";
            imgIssue.ImageUrl = null;
        }
        
    }
}