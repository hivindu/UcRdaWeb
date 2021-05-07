using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
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
            client.BaseAddress = new Uri("https://hivi-99-apigateway-gww2g.ondigitalocean.app");
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

        public static List<Work> GetTaskByArea(string area)
        {
            List<Work> TaskList = new List<Work>();

            client = new HttpClient();
            client.BaseAddress = new Uri("https://hivi-99-apigateway-gww2g.ondigitalocean.app");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync("Work/GetTaskByArea/" + area+"").Result;
            if (response.IsSuccessStatusCode)
            {
                var task = response.Content.ReadAsStringAsync().Result;
                TaskList = JsonConvert.DeserializeObject<List<Work>>(task);
            }
            else
            {
                TaskList = null;
            }

            return TaskList;
        }

        public static List<Work> GetTaskByWorkerId(string Id)
        {
            List<Work> TaskList = new List<Work>();

            client = new HttpClient();
            client.BaseAddress = new Uri("https://hivi-99-apigateway-gww2g.ondigitalocean.app");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync("Work/GetTaskByUserId/" + Id+"").Result;
            if (response.IsSuccessStatusCode)
            {
                var task = response.Content.ReadAsStringAsync().Result;
                TaskList = JsonConvert.DeserializeObject<List<Work>>(task);
            }
            else
            {
                TaskList = null;
            }

            return TaskList;
        }

        public static bool UpdateStatus(Work work)
        {
            bool res = false;

            client = new HttpClient();
            Work u = work;
            client.BaseAddress = new Uri("https://hivi-99-apigateway-gww2g.ondigitalocean.app");
            var response = client.PutAsJsonAsync("Work", u).Result;
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