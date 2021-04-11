using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UcRDAWebApplication.Controllers;
using UcRDAWebApplication.Models;

namespace UcRDAWebApplication
{
    public partial class Issues : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //InitializeGrid();
            BindGrid();
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

          //  for (int i = 0; i < count; i++)
            //{
              //  IssueList[i].Path = IssueController.convertToImage(IssueList[i].Image,IssueList[i].Id);
            //}
            dgIssuesRda.DataSource = IssueList;
            dgIssuesRda.DataBind();
        }

        protected void dgIssuesRda_SelectedIndexChanged(object sender, EventArgs e)
        {
            Issue issu = new Issue();
            string id = dgIssuesRda.SelectedRow.Cells[1].Text;
            issu = IssueController.GetIssueById(id);
            IssueImage.ImageUrl = "@String.Format('data: "+issu.Image+" / png; base64,{ 0}', Convert.ToBase64String(Model.imageBytes))";
        }

        protected void dgIssuesRda_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Issue issu = new Issue();
            string id = (dgIssuesRda.Rows[e.NewSelectedIndex].Cells[1].Text).ToString();
            issu = IssueController.GetIssueById(id);
            // Bind Values to details panel
            IssueImage.ImageUrl = "@String.Format('data: " + issu.Image + " / png; base64,{ 0}', Convert.ToBase64String(Model.imageBytes))";
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
    }
}