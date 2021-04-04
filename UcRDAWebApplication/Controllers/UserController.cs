using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Policy;
using System.Web;

namespace UcRDAWebApplication.Controllers
{
    public class UserController
    {
        private HttpClient client;
        public bool LoginValidation(string nic,string pw)
        {
            bool res = false;
            client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:7000/");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync("UCRDAUser/GetUserByCredentials/"+nic+"/"+pw+"").Result;
            if(response.IsSuccessStatusCode)
            {
                var user = response.Content.ReadAsStringAsync().Result;
                
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