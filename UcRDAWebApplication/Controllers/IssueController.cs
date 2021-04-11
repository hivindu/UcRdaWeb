using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.EnterpriseServices;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Runtime.Remoting;
using System.Web;
using UcRDAWebApplication.Models;

namespace UcRDAWebApplication.Controllers
{
    public class IssueController
    {
        private static HttpClient client;
        private static readonly ImageConverter _imageConverter = new ImageConverter();
        private static Bitmap myBitmap;
        private static ImageCodecInfo myImageCodecInfo;
        private static Encoder myEncoder;
        private static EncoderParameter myEncoderParameter;
        private static EncoderParameters myEncoderParameters;
        private static string path;


        public static List<Issue> GetIssueByArea(string area)
        {
            List<Issue> Issuelist = new List<Issue>();
            
            client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:7000/");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync("Issue/GetApprovedIssuesByAdminArea/" + area + "").Result;
            if (response.IsSuccessStatusCode)
            {
                var issue = response.Content.ReadAsStringAsync().Result;
                Issuelist = JsonConvert.DeserializeObject<List<Issue>>(issue);
            }
            else
            {
                Issuelist = null;
            }

            return Issuelist;
        }

        public static Issue GetIssueById(string Id)
        {
            Issue issue = new Issue();

            client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:7000/");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync("Issue/" + Id + "").Result;
            if (response.IsSuccessStatusCode)
            {
                var issu = response.Content.ReadAsStringAsync().Result;
                issue = JsonConvert.DeserializeObject<Issue>(issu);
            }
            else
            {
                issue = null;
            }

            return issue;
        }

        public static string convertToImage(byte[] byteArrayIn, string id)
        {
            Image image = Image.FromStream(new MemoryStream(byteArrayIn));
            myImageCodecInfo = GetEncoderInfo("image/jpeg");
            myEncoder = Encoder.Quality;
            myEncoderParameters = new EncoderParameters(1);
            myEncoderParameter = new EncoderParameter(myEncoder, 25L);
            myEncoderParameters.Param[0] = myEncoderParameter;
            path = "~Image/" + id + ".jpg";
            myBitmap.Save(path, myImageCodecInfo, myEncoderParameters);
            

            return path;
        }

        private static ImageCodecInfo GetEncoderInfo(String mimeType)
        {
            int j;
            ImageCodecInfo[] encoders;
            encoders = ImageCodecInfo.GetImageEncoders();
            for (j = 0; j < encoders.Length; ++j)
            {
                if (encoders[j].MimeType == mimeType)
                    return encoders[j];
            }
            return null;
        }

        public static bool UpdateStatus(Issue issue)
        {
            Boolean res = false;

            client = new HttpClient();
            Issue p = issue;
            client.BaseAddress = new Uri("http://localhost:7000/");
            var response = client.PutAsJsonAsync("Issue/", p).Result;
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

        public static bool RemoveIssue(string id)
        {
            Boolean res = false;

            client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:7000/");
            var response = client.DeleteAsync("Issue/"+id+"").Result;
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