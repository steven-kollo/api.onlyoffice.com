using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Web;
using System.Web.Configuration;
using log4net;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace ASC.Api.Web.Help.Helpers
{
    public class GCustomSearch
    {
        public static List<SearchResult> Search(string query, string subPath = null)
        {
            var result = new List<SearchResult>();

            var searchUrl = string.Format("{0}?key={1}&cx={2}&q={3}",
                                          WebConfigurationManager.AppSettings["google.search.url"],
                                          WebConfigurationManager.AppSettings["google.search.key"],
                                          WebConfigurationManager.AppSettings["google.search.cx"],
                                          HttpUtility.UrlEncode(query));

            if (!string.IsNullOrWhiteSpace(subPath))
            {
                searchUrl += " site:*/" + HttpUtility.UrlEncode(subPath);
            }

            try
            {
                var request = WebRequest.Create(searchUrl);

                var responce = (HttpWebResponse)request.GetResponse();
                var responseString = string.Empty;

                using (var dataStream = responce.GetResponseStream())
                {
                    if (dataStream != null)
                    {
                        using (var reader = new StreamReader(dataStream))
                        {
                            responseString = reader.ReadToEnd();
                        }
                    }
                }

                var jsonData = JsonConvert.DeserializeObject<JObject>(responseString);

                if (jsonData.ContainsKey("items"))
                {
                    foreach (var item in jsonData["items"])
                    {
                        result.Add(new SearchResult
                            {
                                Name = item["title"].ToString(),
                                Url = item["link"].ToString(),
                                Description = item["snippet"].ToString()
                            });
                    }
                }
            }
            catch (Exception error)
            {
                LogManager.GetLogger("ASC.Api").Error(error);
            }

            return result;
        }
    }
}