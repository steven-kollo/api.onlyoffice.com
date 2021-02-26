/*
 *
 * (c) Copyright Ascensio System Limited 2010-2017
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
 * Pursuant to Section 7 § 3(b) of the GNU GPL you must retain the original ONLYOFFICE logo which contains 
 * relevant author attributions when distributing the software. If the display of the logo in its graphic 
 * form is not reasonably feasible for technical reasons, you must include the words "Powered by ONLYOFFICE" 
 * in every copy of the program you distribute. 
 * Pursuant to Section 7 § 3(e) we decline to grant you any rights under trademark law for use of our trademarks.
 *
*/


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using ASC.Api.Web.Help.DocumentGenerator;
using ASC.Api.Web.Help.Helpers;
using HtmlAgilityPack;
using log4net;

namespace ASC.Api.Web.Help.Controllers
{
    [Redirect]
    public class DesktopController : AsyncController
    {
        private readonly string[] _actionMap = new[]
            {
                "addingdms",
                "basic",
                "changelog",
                "debugging",
                "encryption",
                "faq",
                "loginlogout",
                "opening",
                "plugins"
            };

        public ActionResult Index()
        {
            return View("basic");
        }

        public ActionResult Navigation()
        {
            return View();
        }

        [ValidateInput(false)]
        public ActionResult Search(string query)
        {
            var result = new List<SearchResult>();

            foreach (var action in _actionMap)
            {
                var actionString = action.ToLower();
                var doc = new HtmlDocument();
                try
                {
                    var html = this.RenderView(actionString, new ViewDataDictionary());
                    doc.LoadHtml(html);
                }
                catch (Exception e)
                {
                    LogManager.GetLogger("ASC.Api").Error(e);
                }
                var content = doc.DocumentNode;
                if (content.SelectSingleNode("html") != null)
                {
                    content = content.SelectSingleNode("//div[contains(@class,'layout-content')]");
                }

                if (!string.IsNullOrEmpty(query) && content != null && content.InnerText.ToLowerInvariant().Contains(query.ToLowerInvariant()))
                {
                    var headerNode = doc.DocumentNode.SelectSingleNode("//span[@class='hdr']");
                    var descrNode = doc.DocumentNode.SelectSingleNode("//p[@class='dscr']");
                    var header = headerNode != null ? headerNode.InnerText : string.Empty;
                    var descr = descrNode != null ? descrNode.InnerText : string.Empty;
                    result.Add(new SearchResult
                        {
                            Module = "desktop",
                            Name = actionString,
                            Resource = Highliter.HighliteString(header, query).ToHtmlString(),
                            Description = Highliter.HighliteString(descr, query).ToHtmlString(),
                            Url = Url.Action(actionString, "desktop")
                        });
                }
            }

            ViewData["query"] = query ?? string.Empty;
            ViewData["result"] = result;
            return View(new Dictionary<MsDocEntryPoint, Dictionary<MsDocEntryPointMethod, string>>());
        }

        public ActionResult Addingdms()
        {
            return View();
        }

        public ActionResult Basic()
        {
            return View();
        }

        public ActionResult Changelog()
        {
            return View();
        }

        public ActionResult Debugging()
        {
            return View();
        }

        public ActionResult Encryption()
        {
            return View();
        }

        public ActionResult Faq()
        {
            return View();
        }

        public ActionResult Loginlogout()
        {
            return View();
        }

        public ActionResult Opening()
        {
            return View();
        }

        public ActionResult Plugins()
        {
            return View();
        }

    }
}