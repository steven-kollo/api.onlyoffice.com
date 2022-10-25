using ASC.Api.Web.Help.Helpers;
using log4net;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;

namespace ASC.Api.Web.Help.DocumentGenerator
{
    public abstract class JsDocDocumentation
    {
        protected static readonly Dictionary<string, string> EditorsTypeMapping = new Dictionary<string, string>
        {
            { "CDE", "word" },
            { "CPE", "slide" },
            { "CSE", "cell" }
        };

        protected Dictionary<string, string> PathMapping { get; set; }

        protected Dictionary<string, SortedDictionary<string, DBEntry>> _entries;
        protected SortedDictionary<string, DBGlobal> _globals;
        protected ILog _logger;

        protected void Load(string pathPiece)
        {
            _logger.Debug("Generate docbuilder documentations");

            var tree = new Dictionary<string, SortedDictionary<string, DBEntry>>(StringComparer.OrdinalIgnoreCase);

            var path = Path.Combine(HostingEnvironment.ApplicationPhysicalPath, $@"App_Data\{pathPiece}\references");
            if (!Directory.Exists(path))
            {
                _logger.Info("Couldn't find any docs: " + path);
                _entries = tree;
                return;
            }

            foreach (var dir in Directory.GetDirectories(path))
            {
                var moduleName = dir.Split(Path.DirectorySeparatorChar).Last();
                var moduleTree = ParseFiles(dir, moduleName);

                tree.Add(moduleName, moduleTree);

                var globalsPath = Path.Combine(dir, "Globals.json");
                ParseGlobals(globalsPath, moduleName);
            }

            _entries = tree;
            CheckSharedMethods();
            LoadExamples();
            ParseLinks();
        }

        protected abstract void CheckSharedMethods();
        protected abstract void LoadExamples();
        public abstract List<SearchResult> Search(string query, UrlHelper url);
        public abstract string SearchType(string type, string priorityModule);

        private SortedDictionary<string, DBEntry> ParseFiles(string directory, string moduleName)
        {
            var moduleTree = new SortedDictionary<string, DBEntry>(StringComparer.OrdinalIgnoreCase);

            foreach (var file in Directory.GetFiles(directory))
            {
                try
                {
                    var clearname = Path.GetFileNameWithoutExtension(file);
                    if (clearname == "Globals") continue;

                    var entry = JsonConvert.DeserializeObject<DBEntry>(File.ReadAllText(file));
                    entry.Name = clearname;
                    entry.Path = PathMapping[moduleName];
                    entry.Module = moduleName;
                    if (entry.Methods == null || entry.Methods.Count == 0) continue;

                    entry.Methods.ToList().ForEach(m =>
                    {
                        m.Value.Module = moduleName;
                        if (m.Value.Params != null) m.Value.Params.ToList().ForEach(p => p.Module = moduleName);
                    });
                    if (entry.Events != null) entry.Events.ToList().ForEach(e => e.Value.Module = moduleName);
                    if (entry.Params != null) entry.Params.ToList().ForEach(p => p.Module = moduleName);

                    moduleTree.Add(entry.Name, entry);
                }
                catch (Exception e)
                {
                    _logger.WarnFormat("Couldn't parse {0}. Got an error: {1}", file, e.Message);
                }
            }

            return moduleTree;
        }


        private void ParseGlobals(string path, string moduleName)
        {
            if (!File.Exists(path))
            {
                _logger.Info("Couldn't find globals: " + path);
            }
            else
            {
                try
                {
                    if (_globals == null) _globals = new SortedDictionary<string, DBGlobal>(StringComparer.OrdinalIgnoreCase);
                    var content = JsonConvert.DeserializeObject<SortedDictionary<string, DBGlobal>>(File.ReadAllText(path));
                    foreach (var kv in content)
                    {
                        kv.Value.Module = moduleName;
                        if (!_globals.ContainsKey(kv.Key)) _globals.Add(kv.Key, kv.Value);
                    }
                }
                catch (Exception e)
                {
                    _logger.WarnFormat("Couldn't parse globals. Got an error: {1}", e.Message);
                }
            }
        }

        public SortedDictionary<string, DBEntry> GetModule(string name)
        {
            return _entries.ContainsKey(name) ? _entries[name] : null;
        }

        public DBEntry GetSection(string module, string name)
        {
            var mod = GetModule(module);
            if (mod == null) return null;

            return mod.ContainsKey(name) ? mod[name] : null;
        }

        public DBMethod GetMethod(string module, string section, string name)
        {
            var sec = GetSection(module, section);
            if (sec == null) return null;

            return sec.Methods.ContainsKey(name) ? sec.Methods[name] : null;
        }

        public DBEvent GetEvent(string module, string section, string name)
        {
            var sec = GetSection(module, section);
            if (sec == null) return null;

            return sec.Events.ContainsKey(name) ? sec.Events[name] : null;
        }

        public SortedDictionary<string, DBGlobal> GetGlobals()
        {
            return _globals;
        }

        public HtmlString ReturnTypeToHtml(DBMethod method)
        {
            return TypesToHtml(method.Returns.First(), method.Module);
        }

        public HtmlString ParamTypeToHtml(DBParam param)
        {
            var link = SearchType(param.Type, param.Module);
            var encoded = HttpUtility.HtmlEncode(param.Type);
            return new HtmlString(link == null ? encoded : string.Format("<a href=\"{0}\">{1}</a>", link, encoded));
        }

        public HtmlString TypesToHtml(IEnumerable<string> types, string priority)
        {
            var returnsHtml = new List<string>();

            foreach (var type in types)
            {
                if (type.StartsWith("\""))
                {
                    returnsHtml.Add(type);
                    continue;
                }

                var link = SearchType(type, priority);
                var encoded = HttpUtility.HtmlEncode(type);
                returnsHtml.Add(link == null ? encoded : string.Format("<a href=\"{0}\">{1}</a>", link, encoded));
            }

            return new HtmlString(string.Join(" | ", returnsHtml));
        }

        private void ParseLinks()
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

                Func<string, MatchEvaluator> replacer = priority => {
                    return m =>
                    {
                        var link = SearchType(m.Groups[1].Value, priority);
                        var text = string.Format("{0}.{1}", m.Groups[1].Value, m.Groups[2].Value);
                        return string.IsNullOrEmpty(link) ? text : string.Format(" <a href=\"{0}/{1}\">{2}</a> ", link, m.Groups[2].Value, text);
                    };
                };

                entity.Description = regex.Replace(entity.Description, replacer(entity.Module));
                if (entity is DBMethod)
                {
                    var m = (DBMethod)entity;
                    if (m.See != null) m.See = regex.Replace(m.See, replacer(m.Module));
                    if (m.Inherits != null) m.Inherits = regex.Replace(m.Inherits, replacer(m.Module));
                }
            }
        }
    }

    public class DBEntry : DBEntity
    {
        [JsonProperty("methods")]
        public SortedDictionary<string, DBMethod> Methods { get; set; }

        [JsonProperty("properties")]
        public List<DBProperty> Properties { get; set; }

        [JsonProperty("comment")]
        public string Comment { get; set; }

        [JsonProperty("scope")]
        public string Scope { get; set; }

        [JsonProperty("params")]
        public List<DBParam> Params { get; set; }

        [JsonProperty("events")]
        public SortedDictionary<string, DBEvent> Events { get; set; }

        [JsonIgnore]
        public DBExample Example { get; set; }

        [JsonIgnore]
        public string Path { get; set; }

        public DBEntry()
        {
            Methods = new SortedDictionary<string, DBMethod>(StringComparer.OrdinalIgnoreCase);
            Events = new SortedDictionary<string, DBEvent>(StringComparer.OrdinalIgnoreCase);
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

        [JsonProperty("see")]
        public string See { get; set; }

        [JsonProperty("inherits")]
        public string Inherits { get; set; }

        [JsonIgnore]
        public DBExample Example { get; set; }
    }

    public class DBEvent : DBEntity
    {
        [JsonProperty("memberof")]
        public string MemberOf { get; set; }

        [JsonProperty("tags")]
        public DBTags Tags { get; set; }

        [JsonProperty("see")]
        public string See { get; set; }

        [JsonProperty("properties")]
        public List<DBProperty> Properties { get; set; }
    }

    public class DBProperty : DBEntity
    {
        [JsonProperty("type")]
        public string Type { get; set; }
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

        [JsonProperty("optional")]
        public bool Optional { get; set; }

        [JsonProperty("defaultValue")]
        public string DefaultValue { get; set; }
    }

    public abstract class DBEntity
    {
        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("description")]
        public string Description { get; set; }

        [JsonIgnore]
        public string Module { get; set; }
    }

    public class DBExample
    {
        [JsonProperty("script")]
        public string Script { get; set; }
    }

    public class DBGlobal : DBEntity
    {
        [JsonProperty("type")]
        public List<string> Types { get; set; }

        [JsonProperty("properties")]
        public List<DBProperty> Properties { get; set; }

        [JsonProperty("script")]
        public string Script { get; set; }
    }
}