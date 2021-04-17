using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using UcRDAWebApplication.Models;

namespace UcRDAWebApplication.Controllers
{
    public class WorkController
    {
        private static HttpClient client;

        public static bool AssignWork(Work work)
        {
            bool res = false;

            client = new HttpClient();
            Work p = work;
            client.BaseAddress = new Uri("http://localhost:7000/");
            var response = client.PostAsJsonAsync("Work", p).Result;
            if (response.IsSuccessStatusCode)
            {
                res = true;
            }
            else
            {
                res = false;
            }

            return res;
        }


    }
}