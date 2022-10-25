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
using log4net;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.Hosting;
using System.Web.Mvc;

namespace ASC.Api.Web.Help.DocumentGenerator
{
    public class DocBuilderDocumentation : JsDocDocumentation
    {
        private static DocBuilderDocumentation _instance;
        public static DocBuilderDocumentation Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new DocBuilderDocumentation();
                }
                return _instance;
            }
        }

        private DocBuilderDocumentation() { }

        public void Load()
        {
            PathMapping = new Dictionary<string, string>
            {
                { "word", "textdocumentapi" },
                { "cell", "spreadsheetapi" },
                { "slide", "presentationapi" },
                { "form", "formapi" }
            };

            _logger = LogManager.GetLogger("ASC.DocumentBuilder");
            Load("docbuilder");
        }

        protected override void CheckSharedMethods()
        {
            foreach (var mod in _entries)
            {
                foreach (var section in mod.Value)
                {
                    var sharedMethods = section.Value.Methods.Values.Where(m => m.Tags != null && m.Tags.EditorTypes != null);
                    foreach (var method in sharedMethods)
                    {
                        foreach (var type in method.Tags.EditorTypes)
                        {
                            if (!EditorsTypeMapping.ContainsKey(type)) continue;
                            if (EditorsTypeMapping[type] == mod.Key) continue;

                            var targetType = GetSection(EditorsTypeMapping[type], section.Key);

                            if (targetType == null)
                            {
                                targetType = new DBEntry
                                {
                                    Comment = section.Value.Comment,
                                    Description = section.Value.Description,
                                    Methods = new SortedDictionary<string, DBMethod>(StringComparer.OrdinalIgnoreCase),
                                    Name = section.Value.Name,
                                    Params = section.Value.Params != null ? section.Value.Params.Select(p => new DBParam
                                    {
                                        DefaultValue = p.DefaultValue,
                                        Description = p.Description,
                                        Module = EditorsTypeMapping[type],
                                        Name = p.Name,
                                        Optional = p.Optional,
                                        Type = p.Type
                                    }).ToList() : null,
                                    Scope = section.Value.Scope,
                                    Path = PathMapping[EditorsTypeMapping[type]],
                                    Module = EditorsTypeMapping[type]
                                };
                                _entries[EditorsTypeMapping[type]].Add(section.Key, targetType);
                            }

                            if (!targetType.Methods.ContainsKey(method.Name))
                            {
                                targetType.Methods.Add(method.Name, new DBMethod
                                {
                                    Description = method.Description,
                                    Inherits = method.Inherits,
                                    MemberOf = method.MemberOf,
                                    Name = method.Name,
                                    Params = method.Params != null ? method.Params.Select(p => new DBParam
                                    {
                                        DefaultValue = p.DefaultValue,
                                        Description = p.Description,
                                        Module = EditorsTypeMapping[type],
                                        Name = p.Name,
                                        Optional = p.Optional,
                                        Type = p.Type
                                    }).ToList() : null,
                                    Returns = method.Returns,
                                    See = method.See,
                                    Tags = method.Tags,
                                    Module = targetType.Module
                                });
                            }
                        }
                    }
                }
            }
        }

        protected override void LoadExamples()
        {
            var docbuilderExt = ".docbuilder";
            var examplesPath = Path.Combine(HostingEnvironment.ApplicationPhysicalPath, @"App_Data\docbuilder\examples");

            foreach (var moduleName in _entries.Keys)
            {
                var mod = GetModule(moduleName);
                if (mod == null) continue;

                var path = Path.Combine(examplesPath, moduleName);
                if (!Directory.Exists(path))
                {
                    _logger.Info("Couldn't find any examples: " + path);
                }
                else
                {
                    foreach (var examplePath in Directory.GetFiles(path))
                    {
                        if (Path.GetExtension(examplePath) != docbuilderExt) continue;

                        var exampleName = Path.GetFileNameWithoutExtension(examplePath);
                        if (exampleName.Contains("."))
                        {
                            var split = exampleName.Split('.');
                            if (mod.ContainsKey(split[0]))
                            {
                                var section = mod[split[0]];
                                if (section.Methods.ContainsKey(split[1]))
                                {
                                    var example = new DBExample
                                    {
                                        Script = File.ReadAllText(examplePath)
                                    };
                                    section.Methods[split[1]].Example = example;
                                }
                                else
                                {
                                    _logger.InfoFormat("Found example for {0}.{1} but the method is missing", moduleName, exampleName);
                                }
                            }
                            else
                            {
                                _logger.InfoFormat("Found example for {0}.{1} but the class is missing", moduleName, exampleName);
                            }
                        }
                        else
                        {
                            if (mod.ContainsKey(exampleName))
                            {
                                var example = new DBExample
                                {
                                    Script = File.ReadAllText(examplePath)
                                };
                                mod[exampleName].Example = example;
                            }
                            else
                            {
                                _logger.InfoFormat("Found example for {0}.{1} but the class is missing", moduleName, exampleName);
                            }
                        }
                    }
                }
            }

            Action<DBExample, string> logMissing = (ex, path) =>
            {
                if (ex == null)
                {
                    _logger.InfoFormat("Missing example and demo for {0}", path);
                }
                else
                {
                    if (ex.Script == null)
                    {
                        _logger.InfoFormat("Missing example for {0}", path);
                    }
                }
            };

            foreach (var mod in _entries)
            {
                foreach (var section in mod.Value.Values)
                {
                    logMissing(section.Example, string.Format("{0}.{1}", mod.Key, section.Name));

                    foreach (var method in section.Methods.Values)
                    {
                        logMissing(method.Example, string.Format("{0}.{1}.{2}", mod.Key, section.Name, method.Name));
                    }
                }
            }

            foreach (var globalsExamplePath in Directory.GetFiles(examplesPath))
            {
                if (Path.GetExtension(globalsExamplePath) != docbuilderExt) continue;

                var globalExampleName = Path.GetFileNameWithoutExtension(globalsExamplePath);

                if (_globals.ContainsKey(globalExampleName))
                {
                    _globals[globalExampleName].Script = File.ReadAllText(globalsExamplePath);
                }
                else
                {
                    _logger.InfoFormat("Found global example for {0} but the method is missing", globalExampleName);
                }
            }
        }

        public override List<SearchResult> Search(string query, UrlHelper url)
        {
            var q = query.ToLowerInvariant();
            var result = new List<SearchResult>();

            var sections = _entries.SelectMany(m => m.Value.Values);

            foreach (var section in sections)
            {
                var action = string.Format("{0}/{1}", section.Path, section.Name);
                if (section.Name.ToLowerInvariant().Contains(q) || (!string.IsNullOrEmpty(section.Description) && section.Description.ToLowerInvariant().Contains(q)))
                {
                    result.Add(new SearchResult
                    {
                        Module = "docbuilder",
                        Name = action,
                        Resource = Highliter.HighliteString(section.Name, query).ToHtmlString(),
                        Description = Highliter.HighliteString(section.Description, query).ToHtmlString(),
                        Url = url.Action(action, "docbuilder")
                    });
                }

                foreach (var method in section.Methods.Values)
                {
                    if (method.Name.ToLowerInvariant().Contains(q) || (!string.IsNullOrEmpty(method.Description) && method.Description.ToLowerInvariant().Contains(q)))
                    {
                        var methodAction = string.Format("{0}/{1}", action, method.Name);
                        result.Add(new SearchResult
                        {
                            Module = "docbuilder",
                            Name = methodAction,
                            Resource = Highliter.HighliteString(method.Name, query).ToHtmlString(),
                            Description = Highliter.HighliteString(method.Description, query).ToHtmlString(),
                            Url = url.Action(methodAction, "docbuilder")
                        });
                    }
                }
            }

            foreach (var type in _globals)
            {
                if (type.Key.ToLowerInvariant().Contains(q) || (!string.IsNullOrEmpty(type.Value.Description) && type.Value.Description.ToLowerInvariant().Contains(q)))
                {
                    var action = string.Format("{0}#{1}", url.Action("global", "docbuilder"), type.Key);
                    result.Add(new SearchResult
                    {
                        Module = "docbuilder",
                        Name = action,
                        Resource = Highliter.HighliteString(type.Key, query).ToHtmlString(),
                        Description = Highliter.HighliteString(type.Value.Description, query).ToHtmlString(),
                        Url = action
                    });
                }
            }

            return result;
        }

        public override string SearchType(string type, string priorityModule = "word")
        {
            if (type.StartsWith("\"")) return null;

            type = type.ToLowerInvariant();
            var module = GetModule(priorityModule);
            if (module == null) return null;

            if (module.ContainsKey(type))
            {
                return string.Format("/docbuilder/{0}/{1}", module[type].Path, module[type].Name);
            }

            var sections = _entries.Where(kv => kv.Key != priorityModule).SelectMany(m => m.Value.Values);

            foreach (var section in sections)
            {
                if (section.Name.ToLowerInvariant() == type)
                {
                    return string.Format("/docbuilder/{0}/{1}", section.Path, section.Name);
                }
            }

            foreach (var global in _globals)
            {
                if (global.Key.ToLowerInvariant() == type)
                {
                    return string.Format("/docbuilder/global#{0}", global.Key);
                }
            }

            return null;
        }
    }
}