/*
 *
 * (c) Copyright Ascensio System Limited 2021
 *
 * This program is freeware. You can redistribute it and/or modify it under the terms of the GNU 
 * General Public License (GPL) version 3 as published by the Free Software Foundation (https://www.gnu.org/copyleft/gpl.html). 
 * In accordance with Section 7(a) of the GNU GPL its Section 15 shall be amended to the effect that 
 * Ascensio System SIA expressly excludes the warranty of non-infringement of any third-party rights.
 *
 * THIS PROGRAM IS DISTRIBUTED WITHOUT ANY WARRANTY; WITHOUT EVEN THE IMPLIED WARRANTY OF MERCHANTABILITY OR
 * FITNESS FOR A PARTICULAR PURPOSE. For more details, see GNU GPL at https://www.gnu.org/copyleft/gpl.html
 *
 * You can contact Ascensio System SIA by email at sales@onlyoffice.com
 *
 * The interactive user interfaces in modified source and object code versions of ONLYOFFICE must display 
 * Appropriate Legal Notices, as required under Section 5 of the GNU GPL version 3.
 *
 * Pursuant to Section 7 ยง 3(b) of the GNU GPL you must retain the original ONLYOFFICE logo which contains 
 * relevant author attributions when distributing the software. If the display of the logo in its graphic 
 * form is not reasonably feasible for technical reasons, you must include the words "Powered by ONLYOFFICE" 
 * in every copy of the program you distribute. 
 * Pursuant to Section 7 ยง 3(e) we decline to grant you any rights under trademark law for use of our trademarks.
 *
*/


using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using ASC.Web.Core.Files;

namespace ASC.Api.Web.Help.Helpers
{
    public class DocBuilderHelper
    {
        public UrlHelper Url;
        public HttpRequestBase Request;

        public DocBuilderHelper(UrlHelper url, HttpRequestBase request)
        {
            Url = url;
            Request = request;
        }

        public static string BuilderPath
        {
            get { return WebConfigurationManager.AppSettings["builder-path"] ?? string.Empty; }
        }

        private const int ScriptMaxLength = 10000;

        public string GenerateDocument(string builderScript)
        {
            builderScript = CutBuilderScript(builderScript);

            if (builderScript.Length > ScriptMaxLength)
            {
                throw new Exception("The script is too long");
            }

            var link = BuildFile(builderScript);
            return link;
        }

        private static string CutBuilderScript(string builderScript)
        {
            const string openFunction = "builder.OpenFile";
            const string createFunction = "builder.CreateFile";
            const string saveFunction = "builder.SaveFile";

            if (builderScript.IndexOf(openFunction, StringComparison.InvariantCulture) != -1)
            {
                throw new Exception("OpenFile not available there");
            }
            if (builderScript.IndexOf(createFunction, StringComparison.InvariantCulture) == -1)
            {
                throw new Exception("CreateFile not found");
            }
            var saveStartIndex = builderScript.IndexOf(saveFunction, StringComparison.InvariantCulture);
            if (saveStartIndex == -1)
            {
                throw new Exception("SaveFile not found");
            }

            var saveEndIndex = builderScript.IndexOf('\r', saveStartIndex);
            if (saveEndIndex != -1)
            {
                builderScript = builderScript.Substring(0, saveEndIndex);
            }
            builderScript += "\r\nbuilder.CloseFile();";

            return builderScript;
        }

        private static string GetFileName(string builderScript)
        {
            const string formatPattern = "builder.SaveFile\\s*\\(\\s*\"(.*)\"\\s*,\\s*\"(.*)\"\\s*\\)";

            var format = string.Empty;
            var fileName = string.Empty;

            foreach (Match match in Regex.Matches(builderScript, formatPattern))
            {
                format = match.Groups[1].Value.ToLowerInvariant();
                fileName = match.Groups[2].Value;
                break;
            }

            if (string.IsNullOrEmpty(format))
            {
                throw new Exception("SaveFile without format");
            }

            if (!string.IsNullOrEmpty(fileName) && fileName.ToLowerInvariant().EndsWith("." + format.ToLowerInvariant()))
            {
                fileName = fileName.Substring(0, fileName.Length - format.Length - 1);
            }

            fileName = Path.GetFileName(fileName);

            return fileName + "." + format;
        }

        public string CreateDocument(string name, string company, string title, string format)
        {
            const string replacePattern = "['\"\\(\\)\\r\\n]";

            format = (Path.GetFileName(format) ?? "").Split('.')[0];
            if (string.IsNullOrEmpty(format))
            {
                throw new Exception("SaveFile without format");
            }

            var templatePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data", "Templates", string.Format("{0}.docbuilder", format));

            if (!File.Exists(templatePath))
            {
                throw new Exception("Template not found");
            }
            var templateText = File.ReadAllText(templatePath);

            var customerData = new Dictionary<string, string>
                {
                    { "${Name}", Regex.Replace(name, replacePattern, string.Empty) },
                    { "${Company}", Regex.Replace(company, replacePattern, string.Empty) },
                    { "${Title}", Regex.Replace(title, replacePattern, string.Empty) },
                    { "${DateTime}", DateTime.Now.ToString(CultureInfo.InvariantCulture) }
                };

            var builderScript = customerData.Aggregate(templateText,
                                                       (current, substitution) =>
                                                       current.Replace(substitution.Key, substitution.Value));

            if (builderScript.Length > ScriptMaxLength)
            {
                throw new Exception("The script is too long");
            }

            var link = BuildFile(builderScript);
            return link;
        }

        private string GetScriptUrl(string builderScript)
        {
            var hash = Guid.NewGuid();
            var fileName = string.Format("{0}.docbuilder", hash);
            var builderPath = Path.Combine(Path.GetTempPath(), fileName);

            File.WriteAllText(builderPath, builderScript);
            return Url.Action("DownloadScript", null, new { fileId = hash }, (Request.Url ?? new Uri("")).Scheme);
        }

        private string BuildFile(string builderScript)
        {
            var fileName = GetFileName(builderScript);

            var scriptUrl = GetScriptUrl(builderScript);

            Dictionary<string, string> urls;
            DocumentService.DocbuilderRequest(
                ConfigurationManager.AppSettings["editor_url"] + "/docbuilder",
                null,
                scriptUrl,
                false,
                FileUtility.SignatureSecret,
                out urls
                );

            var fileUrl = string.Empty;
            if (urls != null && urls.ContainsKey(fileName))
            {
                fileUrl = urls[fileName];
            }
            if (string.IsNullOrEmpty(fileUrl))
            {
                throw new Exception("Result without file");
            }
            return fileUrl;
        }
    }
}