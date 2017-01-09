/*
 *
 * (c) Copyright Ascensio System Limited 2010-2016
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
using System.Web.Mvc;
using ASC.Api.Web.Help.DocumentGenerator;
using ASC.Api.Web.Help.Helpers;
using HtmlAgilityPack;

namespace ASC.Api.Web.Help.Controllers
{
    [Redirect]
    public class ApiSystemController : AsyncController
    {
        private enum SectionType
        {
            Portal,
            Tariff,
        }

        private enum ActionType
        {
            Authentication,
            Basic,
            PortalGet,
            PortalRegister,
            PortalRemove,
            PortalStatus,
            TariffGet,
            TariffSet,
            ValidatePortalName,
        }

        public ActionResult Index()
        {
            return View("basic");
        }

        public ActionResult Navigation()
        {
            return View();
        }

        public ActionResult Basic()
        {
            return View();
        }

        public ActionResult Section(string section, string category)
        {
            if (string.IsNullOrEmpty(section))
                return View("sectionnotfound");

            SectionType sectionType;
            return Enum.TryParse(section, true, out sectionType) ? View("section", (object) section) : View("sectionnotfound");
        }

        [ValidateInput(false)]
        public ActionResult Search(string query)
        {
            var result = new List<SearchResult>();

            foreach (var action in (ActionType[]) Enum.GetValues(typeof (ActionType)))
            {
                var actionString = action.ToString().ToLower();
                var doc = new HtmlDocument();
                var html = this.RenderView(actionString, new ViewDataDictionary());
                doc.LoadHtml(html);
                var headerNode = doc.DocumentNode.SelectSingleNode("//span[@class='hdr']");
                var descrNode = doc.DocumentNode.SelectSingleNode("//p[@class='dscr']");
                var header = headerNode != null ? headerNode.InnerText : string.Empty;
                var descr = descrNode != null ? descrNode.InnerText : string.Empty;
                var content = doc.DocumentNode.SelectSingleNode("//div[contains(@class,'layout-content')]");

                if (!string.IsNullOrEmpty(query) && content != null && content.InnerText.ToLowerInvariant().Contains(query.ToLowerInvariant()))
                {
                    result.Add(new SearchResult
                        {
                            Module = "apisystem",
                            Name = actionString,
                            Resource = Highliter.HighliteString(header, query).ToHtmlString(),
                            Description = Highliter.HighliteString(descr, query).ToHtmlString(),
                            Url = Url.Action(actionString, "apisystem")
                        });
                }
            }

            ViewData["query"] = query ?? string.Empty;
            ViewData["result"] = result;
            return View(new Dictionary<MsDocEntryPoint, Dictionary<MsDocEntryPointMethod, string>>());
        }

        public ActionResult Authentication()
        {
            return View();
        }


        public ActionResult PortalGet()
        {
            return View();
        }

        public ActionResult PortalRegister()
        {
            return View();
        }

        public ActionResult PortalRemove()
        {
            return View();
        }

        public ActionResult PortalStatus()
        {
            return View();
        }

        public ActionResult TariffGet()
        {
            return View();
        }

        public ActionResult TariffSet()
        {
            return View();
        }

        public ActionResult ValidatePortalName()
        {
            return View();
        }
    }
}