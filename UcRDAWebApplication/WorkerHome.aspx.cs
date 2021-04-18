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
            BindDetails(id);
        }

        private void BindDetails(string issueId)
        {
            IssueController controller = new IssueController();

            Issue issue = controller.GetIssueById(issueId);

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

        private void CleanData()
        { }
        
    }
}