using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection;
using System.Security.Policy;
using System.Web;
using UcRDAWebApplication.Models;

namespace UcRDAWebApplication.Controllers
{
    public class UserController
    {
        private static HttpClient client;

        public Users LoginValidation(string nic,string pw)
        {
            Users uc = null;
            client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:7000/");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync("UCRDAUser/GetUserByCredentials/"+nic+"/"+pw+"").Result;
            if(response.IsSuccessStatusCode)
            {
                var user = response.Content.ReadAsStringAsync().Result;
                uc = JsonConvert.DeserializeObject<Users>(user);
                     
            }
            else
            {
                uc = null;
            }
            return uc;
        }

        public static List<Users> GetRDAWorkers(string area)
        {
            List<Users> users = null;
            client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:7000/");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync("UCRDAUser/GetWorkersByTypeAndArea/" + area+"").Result;
            if (response.IsSuccessStatusCode)
            {
                var user = response.Content.ReadAsStringAsync().Result;
                users = JsonConvert.DeserializeObject<List<Users>>(user);
            }
            else {
                users = null;
            }

            return users;
        }

        public static DataTable ToDataTable<Users>(List<Users> items)
        {
            DataTable dataTable = new DataTable(typeof(Users).Name);
            //Get all the properties by using reflection   
            PropertyInfo[] Props = typeof(Users).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Setting column names as Property names  
                dataTable.Columns.Add(prop.Name);
            }
            foreach (Users item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {

                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }

            return dataTable;
        }
    }
}