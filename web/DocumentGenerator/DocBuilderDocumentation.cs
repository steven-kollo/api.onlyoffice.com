﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;
using ASC.Api.Web.Help.Helpers;
using ASC.Common.Logging;
using Newtonsoft.Json;

namespace ASC.Api.Web.Help.DocumentGenerator
{
    public static class DocBuilderDocumentation
    {
        private static readonly Dictionary<string, string> PathMapping = new Dictionary<string, string>
            {
                { "word", "textdocumentapi" },
                { "cell", "spreadsheetapi" },
                { "slide", "presentationapi" }
            };

        private static readonly Dictionary<string, string> EditorsTypeMapping = new Dictionary<string, string>
            {
                { "CDE", "word" },
                { "CPE", "slide" },
                { "CSE", "cell" }
            };

        private static Dictionary<string, SortedDictionary<string, DBEntry>> _entries;
        private static SortedDictionary<string, DBGlobal> _globals;
        private static ILog _logger;

        public static void Load()
        {
            _logger = LogManager.GetLogger("ASC.DocbuilderDocs");

            var tree = new Dictionary<string, SortedDictionary<string, DBEntry>>(StringComparer.OrdinalIgnoreCase);
            var path = Path.Combine(HostingEnvironment.ApplicationPhysicalPath, @"App_Data\docbuilder\references");

            if (!Directory.Exists(path))
            {
                _logger.Info("Couldn't find any docs: " + path);
                _entries = tree;
                return;
            }

            foreach (var dir in Directory.GetDirectories(path))
            {
                var moduleTree = new SortedDictionary<string, DBEntry>(StringComparer.OrdinalIgnoreCase);
                var moduleName = dir.Split(Path.DirectorySeparatorChar).Last();

                foreach (var file in Directory.GetFiles(dir))
                {
                    try
                    {
                        var clearname = Path.GetFileNameWithoutExtension(file);
                        if (clearname == "Globals") continue;

                        var entry = JsonConvert.DeserializeObject<DBEntry>(File.ReadAllText(file));
                        entry.Name = clearname;
                        entry.Path = PathMapping[moduleName];
                        if (entry.Methods == null || entry.Methods.Count == 0) continue;
                        moduleTree.Add(entry.Name, entry);
                    }
                    catch (Exception e)
                    {
                        _logger.WarnFormat("Couldn't parse {0}. Got an error: {1}", file, e.Message);
                    }
                }

                tree.Add(moduleName, moduleTree);

                var globalsPath = Path.Combine(dir, "Globals.json");
                if (!File.Exists(globalsPath))
                {
                    _logger.Info("Couldn't find globals: " + globalsPath);
                }
                else
                {
                    try
                    {
                        if (_globals == null) _globals = new SortedDictionary<string, DBGlobal>(StringComparer.OrdinalIgnoreCase);
                        var content = JsonConvert.DeserializeObject<SortedDictionary<string, DBGlobal>>(File.ReadAllText(globalsPath));
                        foreach (var kv in content)
                        {
                            if (!_globals.ContainsKey(kv.Key)) _globals.Add(kv.Key, kv.Value);
                        }
                    }
                    catch (Exception e)
                    {
                        _logger.WarnFormat("Couldn't parse globals. Got an error: {1}", e.Message);
                    }
                }
            }

            _entries = tree;
            CheckSharedMethods();
            LoadExamples();
            ParseLinks();
        }

        public static SortedDictionary<string, DBEntry> GetModule(string name)
        {
            return _entries.ContainsKey(name) ? _entries[name] : null;
        }

        public static DBEntry GetSection(string module, string name)
        {
            var mod = GetModule(module);
            if (mod == null) return null;

            return mod.ContainsKey(name) ? mod[name] : null;
        }

        public static DBMethod GetMethod(string module, string section, string name)
        {
            var sec = GetSection(module, section);
            if (sec == null) return null;

            return sec.Methods.ContainsKey(name) ? sec.Methods[name] : null;
        }

        public static SortedDictionary<string, DBGlobal> GetGlobals()
        {
            return _globals;
        }

        public static List<SearchResult> Search(string query, UrlHelper url)
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
                            Url = url.Action(action, "docbuilderjson")
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
                                Url = url.Action(methodAction, "docbuilderjson")
                            });
                    }
                }
            }

            foreach (var type in _globals)
            {
                if (type.Key.ToLowerInvariant().Contains(q) || (!string.IsNullOrEmpty(type.Value.Description) && type.Value.Description.ToLowerInvariant().Contains(q)))
                {
                    var action = string.Format("{0}#{1}", url.Action("global", "docbuilderjson"), type.Key);
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

        public static string SearchType(string type, string priorityModule = null)
        {
            if (type.StartsWith("\"")) return null;

            type = type.ToLowerInvariant();
            if (priorityModule != null)
            {
                var module = GetModule(priorityModule);
                if (module == null) return null;

                if (module.ContainsKey(type))
                {
                    return string.Format("/docbuilderjson/{0}/{1}", module[type].Path, module[type].Name);
                }
            }

            IEnumerable<DBEntry> sections;
            if (priorityModule != null)
            {
                sections = _entries.Where(kv => kv.Key != priorityModule).SelectMany(m => m.Value.Values);
            }
            else
            {
                sections = _entries.SelectMany(m => m.Value.Values);
            }

            foreach (var section in sections)
            {
                if (section.Name.ToLowerInvariant() == type)
                {
                    return string.Format("/docbuilderjson/{0}/{1}", section.Path, section.Name);
                }
            }

            foreach (var global in _globals)
            {
                if (global.Key.ToLowerInvariant() == type)
                {
                    return string.Format("/docbuilderjson/global#{0}", global.Key);
                }
            }

            return null;
        }

        public static HtmlString ReturnTypeToHtml(DBMethod method)
        {
            return TypesToHtml(method.Returns.First());
        }

        public static HtmlString ParamTypeToHtml(DBParam param)
        {
            var link = SearchType(param.Type);
            return new HtmlString(link == null ? param.Type : string.Format("<a href=\"{0}\">{1}</a>", link, param.Type));
        }

        public static HtmlString TypesToHtml(IEnumerable<string> types)
        {
            var returnsHtml = new List<string>();

            foreach (var type in types)
            {
                if (type.StartsWith("\""))
                {
                    returnsHtml.Add(type);
                    continue;
                }

                var link = SearchType(type);
                returnsHtml.Add(link == null ? type : string.Format("<a href=\"{0}\">{1}</a>", link, type));
            }

            return new HtmlString(string.Join(" | ", returnsHtml));
        }

        private static void CheckSharedMethods()
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
                                        Methods = new SortedDictionary<string, DBMethod>(),
                                        Name = section.Value.Name,
                                        Params = section.Value.Params,
                                        Scope = section.Value.Scope,
                                        Path = PathMapping[EditorsTypeMapping[type]]
                                    };
                                _entries[EditorsTypeMapping[type]].Add(section.Key, targetType);
                            }

                            if (!targetType.Methods.ContainsKey(method.Name))
                            {
                                targetType.Methods.Add(method.Name, method);
                            }
                        }
                    }
                }
            }
        }

        private static void LoadExamples()
        {
            var examplesPath = Path.Combine(HostingEnvironment.ApplicationPhysicalPath, @"App_Data\docbuilder\references", "examples.json");
            var globalsExamplesPath = Path.Combine(HostingEnvironment.ApplicationPhysicalPath, @"App_Data\docbuilder\references", "globalsExamples.json");
            if (!File.Exists(examplesPath))
            {
                _logger.Info("Couldn't find any examples: " + examplesPath);
            }
            else
            {
                var examplesContent = File.ReadAllText(examplesPath);
                try
                {
                    var examples = JsonConvert.DeserializeObject<Dictionary<string, Dictionary<string, DBExample>>>(examplesContent);
                    foreach (var module in examples)
                    {
                        var mod = GetModule(module.Key);
                        if (mod == null) continue;

                        foreach (var ex in module.Value)
                        {
                            if (ex.Key.Contains("."))
                            {
                                var split = ex.Key.Split('.');
                                if (mod.ContainsKey(split[0]))
                                {
                                    var section = mod[split[0]];
                                    if (section.Methods.ContainsKey(split[1])) section.Methods[split[1]].Example = ex.Value;
                                }
                            }
                            else
                            {
                                if (mod.ContainsKey(ex.Key)) mod[ex.Key].Example = ex.Value;
                            }
                        }
                    }
                }
                catch (Exception e)
                {
                    _logger.WarnFormat("Couldn't parse examples.json. Got an error: {0}", e.Message);
                }
            }

            if (!File.Exists(globalsExamplesPath))
            {
                _logger.Info("Couldn't find any globalsExamples: " + globalsExamplesPath);
            }
            else
            {
                var examplesContent = File.ReadAllText(globalsExamplesPath);
                try
                {
                    var examples = JsonConvert.DeserializeObject<Dictionary<string, string>>(examplesContent);
                    foreach (var global in _globals)
                    {
                        if (examples.ContainsKey(global.Key.ToLowerInvariant()))
                        {
                            global.Value.Script = examples[global.Key.ToLowerInvariant()];
                        }
                    }
                }
                catch (Exception e)
                {
                    _logger.WarnFormat("Couldn't parse globalsExamples.json. Got an error: {0}", e.Message);
                }
            }
        }

        private static void ParseLinks()
        {
            var regex = new Regex("{@link (.*?)#(.*?)}", RegexOptions.Multiline);

            var entities = new List<DBEntity>();
            foreach (var mod in _entries)
            {
                entities.AddRange(mod.Value.Values);

                foreach (var section in mod.Value)
                {
                    if (section.Value.Params != null) entities.AddRange(section.Value.Params);
                    entities.AddRange(section.Value.Methods.Values);

                    foreach (var method in section.Value.Methods)
                    {
                        if (method.Value.Params != null) entities.AddRange(method.Value.Params);
                    }
                }
            }
            entities.AddRange(_globals.Values);

            foreach (var entity in entities)
            {
                if (string.IsNullOrEmpty(entity.Description)) continue;

                entity.Description = regex.Replace(entity.Description, m =>
                    {
                        var link = SearchType(m.Groups[1].Value);
                        var text = string.Format("{0}.{1}", m.Groups[1].Value, m.Groups[2].Value);
                        return string.IsNullOrEmpty(link) ? text : string.Format(" <a href=\"{0}/{1}\">{2}</a> ", link, m.Groups[2].Value, text);
                    });
            }
        }
    }

    public class DBEntry : DBEntity
    {
        [JsonProperty("methods")]
        public SortedDictionary<string, DBMethod> Methods { get; set; }

        [JsonProperty("comment")]
        public string Comment { get; set; }

        [JsonProperty("scope")]
        public string Scope { get; set; }

        [JsonProperty("params")]
        public List<DBParam> Params { get; set; }

        [JsonIgnore]
        public DBExample Example { get; set; }

        [JsonIgnore]
        public string Path { get; set; }

        public DBEntry()
        {
            Methods = new SortedDictionary<string, DBMethod>(StringComparer.OrdinalIgnoreCase);
        }
    }

    public class DBMethod : DBEntity
    {
        [JsonProperty("memberof")]
        public string MemberOf { get; set; }

        [JsonProperty("tags")]
        public DBTags Tags { get; set; }

        [JsonProperty("params")]
        public List<DBParam> Params { get; set; }

        [JsonProperty("returns")]
        public List<List<string>> Returns { get; set; }

        [JsonIgnore]
        public DBExample Example { get; set; }
    }

    public class DBTags
    {
        [JsonProperty("typeofeditors")]
        public List<string> EditorTypes { get; set; }
    }

    public class DBParam : DBEntity
    {
        [JsonProperty("type")]
        public string Type { get; set; }
    }

    public abstract class DBEntity
    {
        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("description")]
        public string Description { get; set; }
    }

    public class DBExample
    {
        [JsonProperty("script")]
        public string Script { get; set; }

        [JsonProperty("demo")]
        public string DemoUrl { get; set; }
    }

    public class DBGlobal : DBEntity
    {
        [JsonProperty("type")]
        public List<string> Types { get; set; }

        [JsonProperty("script")]
        public string Script { get; set; }
    }
}