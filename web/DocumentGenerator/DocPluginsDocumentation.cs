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
 * Pursuant to Section 7 § 3(b) of the GNU GPL you must retain the original ONLYOFFICE logo which contains 
 * relevant author attributions when distributing the software. If the display of the logo in its graphic 
 * form is not reasonably feasible for technical reasons, you must include the words "Powered by ONLYOFFICE" 
 * in every copy of the program you distribute. 
 * Pursuant to Section 7 § 3(e) we decline to grant you any rights under trademark law for use of our trademarks.
 *
*/


using ASC.Api.Web.Help.Helpers;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace ASC.Api.Web.Help.DocumentGenerator
{
    public class DocPluginsDocumentation : JsDocDocumentation
    {
        private static DocPluginsDocumentation _instance;
        public static DocPluginsDocumentation Instance
        {
            get {
                if (_instance == null)
                {
                    _instance = new DocPluginsDocumentation();
                }
                return _instance;
            }
        }

        private DocPluginsDocumentation() { }

        public void Load()
        {
            PathMapping = new Dictionary<string, string>
            {
                { "pluginBase", "pluginBase" },
                { "sharedPluginMethods", "sharedPluginMethods" },
                { "wordPluginMethods", "wordPluginMethods" },
            };
            Load("plugins");
        }

        protected override void CheckSharedMethods()
        {
            var sharedSection = _entries["sharedPluginMethods"]["api"];

            foreach (var method in _entries["wordPluginMethods"]["api"].Methods.Values)
            {
                if (!sharedSection.Methods.ContainsKey(method.Name))
                {
                    sharedSection.Methods.Add(method.Name, new DBMethod
                    {
                        Description = method.Description,
                        Inherits = method.Inherits,
                        MemberOf = method.MemberOf,
                        Name = method.Name,
                        Params = method.Params != null ? method.Params.Select(p => new DBParam
                        {
                            DefaultValue = p.DefaultValue,
                            Description = p.Description,
                            Module = sharedSection.Module,
                            Name = p.Name,
                            Optional = p.Optional,
                            Type = p.Type
                        }).ToList() : null,
                        Returns = method.Returns,
                        See = method.See,
                        Tags = method.Tags,
                        Module = sharedSection.Module
                    });
                }
            }
        }

        protected override void LoadExamples()
        {
            
        }

        public override List<SearchResult> Search(string query, UrlHelper url)
        {
            return new List<SearchResult>();
        }

        public override string SearchType(string type, string priorityModule = "pluginBase")
        {
            if (type.StartsWith("\"")) return null;

            type = type.ToLowerInvariant();
            var module = GetModule(priorityModule);
            if (module == null) return null;

            if (module.ContainsKey(type))
            {
                return string.Format("/plugin/{0}", module[type].Name);
            }

            var sections = _entries.Where(kv => kv.Key != priorityModule).SelectMany(m => m.Value.Values);

            foreach (var section in sections)
            {
                if (section.Name.ToLowerInvariant() == type)
                {
                    return string.Format("/plugin/{0}/{1}", section.Path, section.Name);
                }
            }

            foreach (var global in _globals)
            {
                if (global.Key.ToLowerInvariant() == type)
                {
                    return string.Format("/plugin/global#{0}", global.Key);
                }
            }

            return null;
        }
    }
}