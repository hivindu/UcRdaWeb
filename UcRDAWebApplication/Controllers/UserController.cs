using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Policy;
using System.Web;
using UcRDAWebApplication.Models;

namespace UcRDAWebApplication.Controllers
{
    public class UserController
    {
        private HttpClient client;

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
    }
}