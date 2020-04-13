using ASC.Api.Web.Help.Models;
using ASC.Common.Logging;
using Markdig;
using Markdig.Renderers;
using Markdig.Renderers.Html;
using Markdig.Syntax;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Net;
using System.Web.Hosting;

namespace ASC.Api.Web.Help.DocumentGenerator
{
    internal static class MarkDown
    {
        private static ILog _logger;
        private static Dictionary<string, MarkDownMeta> routes;
        private static MarkdownPipeline pipeline;

        private static readonly string rootPath = Path.Combine(HostingEnvironment.ApplicationPhysicalPath, @"App_Data\markdown");

        public static SortedDictionary<string, SortedList<string, MarkDownMeta>> Navigation { get; private set; }

        public static void Load()
        {
            _logger = LogManager.GetLogger("ASC.Markdown");

            //Download();
            BuildRoutes();
            BuildStatic();
            BuildNavigation();

            pipeline = new MarkdownPipelineBuilder()
                .Use<CssExtension>()
                .UsePipeTables()
                .Build();
        }

        public static void Download()
        {
            var remoteFiles = Path.Combine(rootPath, "remote.json");
            var json = JsonConvert.DeserializeObject<Dictionary<string, string>>(File.ReadAllText(remoteFiles));

            using (var wc = new WebClient())
            {
                foreach (var kv in json)
                {
                    try
                    {
                        _logger.DebugFormat("Downloading {0} from {1}", kv.Key, kv.Value);
                        var path = Path.Combine(rootPath, kv.Key, "body.md");
                        Directory.CreateDirectory(Path.GetDirectoryName(path));
                        wc.DownloadFile(kv.Value, path);
                    }
                    catch (Exception ex)
                    {
                        _logger.DebugFormat("Couldn't download {0}: {1}", kv.Key, ex.Message);
                    }
                }
            }
        }

        public static void BuildRoutes()
        {
            var files = Directory.GetFiles(rootPath, "*.md", SearchOption.AllDirectories);
            routes = new Dictionary<string, MarkDownMeta>();
            foreach (var path in files)
            {
                try
                {
                    var folderPath = Path.GetDirectoryName(path);

                    var converted = folderPath
                        .Substring(rootPath.Length + 1)
                        .Replace('\\', '/');

                    var metaPath = Path.Combine(folderPath, "meta.json");
                    if (!File.Exists(metaPath)) throw new Exception("No meta file");
                    var meta = JsonConvert.DeserializeObject<MarkDownMeta>(File.ReadAllText(metaPath));

                    var aspxPath = Path.Combine(folderPath, "partial.aspx");

                    meta.Path = path;
                    meta.Url = converted.Substring(converted.IndexOf("/"));
                    meta.Aspx = File.Exists(aspxPath) ? "~/" + aspxPath.Substring(HostingEnvironment.ApplicationPhysicalPath.Length).Replace('\\', '/') : null;

                    routes.Add(converted, meta);
                }
                catch (Exception ex)
                {
                    _logger.DebugFormat("Couldn't load md page at {0}: {1}", path, ex.Message);
                }
            }
        }

        public static void BuildStatic()
        {
            var staticFiles = Path.Combine(rootPath, "default.json");
            var def = JsonConvert.DeserializeObject<Dictionary<string, MarkDownMeta>>(File.ReadAllText(staticFiles));
            foreach(var item in def)
            {
                item.Value.Default = true;
                item.Value.Url = item.Key.Substring(item.Key.IndexOf("/"));
                routes.Add(item.Key, item.Value);
            }
        }

        public static void BuildNavigation()
        {
            Navigation = new SortedDictionary<string, SortedList<string, MarkDownMeta>>();

            foreach (var section in routes.Values.Select(x => x.Section).Distinct())
            {
                Navigation.Add(section, new SortedList<string, MarkDownMeta>());
            }

            foreach (var route in routes.Values)
            {
                if (string.IsNullOrEmpty(route.Parent))
                {
                    Navigation[route.Section].Add(route.Navigation, route);
                }
                else
                {
                    MarkDownMeta parent;
                    if (!routes.TryGetValue(route.Parent, out parent))
                    {
                        _logger.DebugFormat("Couldn't find parent {0}", route.Parent);
                        continue;
                    }

                    if (parent.Children == null) parent.Children = new SortedList<string, MarkDownMeta>();

                    parent.Children.Add(route.Navigation, route);
                }
            }
        }

        public static bool TryGetMd(string path, out MarkDownViewModel model)
        {
            path = path.Trim('/');

            model = null;
            if (!routes.ContainsKey(path)) return false;

            var meta = routes[path];
            if (meta.Default)
            {
                var relativePath = meta.Url.Substring(1);
                var index = relativePath.IndexOf("/");
                relativePath = index < 0 ? null : relativePath.Substring(index);
                model = new MarkDownViewModel()
                {
                    Aspx = meta.Aspx,
                    Default = true,
                    Content = relativePath
                };
                return true;
            }
            var md = File.ReadAllText(meta.Path);
            var writer = new StringWriter();
            Markdown.ToHtml(md, writer, pipeline);
            model = new MarkDownViewModel()
            {
                Content = writer.ToString(),
                Title = meta.Title,
                Aspx = meta.Aspx
            };
            return true;
        }

        public class CssExtension : IMarkdownExtension
        {
            public void Setup(MarkdownPipelineBuilder pipeline)
            {
                // Make sure we don't have a delegate twice
                pipeline.DocumentProcessed -= PipelineOnDocumentProcessed;
                pipeline.DocumentProcessed += PipelineOnDocumentProcessed;
            }

            public void Setup(MarkdownPipeline pipeline, IMarkdownRenderer renderer)
            {
            }

            private static void PipelineOnDocumentProcessed(MarkdownDocument document)
            {
                foreach (var node in document.Descendants())
                {
                    if (node is QuoteBlock)
                    {
                        node.GetAttributes().AddClass("note");
                    }
                }
            }
        }
    }

    public class MarkDownMeta
    {
        [JsonIgnore]
        public string Path { get; set; }

        [JsonIgnore]
        public string Url { get; set; }

        [JsonIgnore]
        public bool Default { get; set; }

        [JsonIgnore]
        public SortedList<string, MarkDownMeta> Children { get; set; }

        [JsonProperty("aspx")]
        public string Aspx { get; set; }

        [JsonRequired, JsonProperty("section")]
        public string Section { get; set; }

        [JsonProperty("navigation")]
        public string Navigation { get; set; }

        [JsonProperty("title")]
        public string Title { get; set; }

        [JsonProperty("parent")]
        public string Parent { get; set; }
    }
}