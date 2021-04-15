using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace UcRDAWebApplication.Models
{
    public class Issue
    {
        public string Id { get; set; }
        public byte[] Image { get; set; }
        public double Lat { get; set; }
        public double Long { get; set; }
        public int PostalCode { get; set; }
        public string Province { get; set; }
        public string Status { get; set; }
        public string Date { get; set; }
        public string RoadType { get; set; }
        public int IssueType { get; set; }
        public string AdminArea { get; set; }
        public string base64 { get; set; }
    }
}