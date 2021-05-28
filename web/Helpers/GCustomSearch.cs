using ASC.Api.Web.Help.DocumentGenerator;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Web.Configuration;
using System.Web.Mvc;

namespace ASC.Api.Web.Help.Helpers
{
    public class GCustomSearch
    {
        public static Dictionary<MsDocEntryPoint, Dictionary<MsDocEntryPointMethod, string>> Search(ViewDataDictionary viewData, string query, string subPath = null)
        {
            var result = new List<SearchResult>();

            var searchUrl = string.Format("{0}?key={1}&cx={2}&q={3}",
                                                          WebConfigurationManager.AppSettings["google.search.url"],
                                                          WebConfigurationManager.AppSettings["google.search.key"],
                                                          WebConfigurationManager.AppSettings["google.search.cx"],
                                                          query);

            if (!string.IsNullOrWhiteSpace(subPath))
            {
                searchUrl += " site:*/" + subPath;
            }

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

            JObject jsonData = JsonConvert.DeserializeObject<JObject>(responseString);

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

            viewData["query"] = query ?? string.Empty;
            viewData["result"] = result;
            return new Dictionary<MsDocEntryPoint, Dictionary<MsDocEntryPointMethod, string>>();
        }
    }
}