using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UcRDAWebApplication.Models
{
    public class Work
    {
        public string Id { get; set; }

        public string UserUd { get; set; }
        public string IssueId { get; set; }
        public DateTime AssignedDate { get; set; }
        public string Status { get; set; }
    }
}