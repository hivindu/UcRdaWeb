using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UcRDAWebApplication.Models
{
    public class User
    {
        public string Id { get; set; }

        public string Name { get; set; }
        public string Password { get; set; }
        public int Work { get; set; }
        public int Type { get; set; }
        public string LocationArea { get; set; }
        public string NIC { get; set; }
    }
}