using ASC.Api.Web.Help.Models;
using ASC.Common.Logging;
using Markdig;
using Markdig.Renderers;
using Markdig.Renderers.Html;
using Markdig.Syntax;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Web.Hosting;

namespace ASC.Api.Web.Help.DocumentGenerator
{
    internal static class MarkDown
    {
        private static ILog _logger;
        private static Dictionary<string, string> routes;
        private static MarkdownPipeline pipeline;

        private static readonly string rootPath = Path.Combine(HostingEnvironment.ApplicationPhysicalPath, @"App_Data\markdown");

        public static void Load()
        {
            _logger = LogManager.GetLogger("ASC.Markdown");

            Download();
            BuildRoutes();

            pipeline = new MarkdownPipelineBuilder()
                .Use<CssExtension>()
                .UsePipeTables()
                .Build();
        }

        public static void Download()
        {
            var remotePath = Path.Combine(rootPath, "remote");
            var remoteFiles = Path.Combine(rootPath, "remote.json");
            var json = JsonConvert.DeserializeObject<Dictionary<string, string>>(File.ReadAllText(remoteFiles));

            using (var wc = new WebClient())
            {
                foreach (var kv in json)
                {
                    try
                    {
                        _logger.DebugFormat("Downloading {0} from {1}", kv.Key, kv.Value);
                        var path = Path.Combine(remotePath, kv.Key);
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
            routes = new Dictionary<string, string>();
            foreach (var path in files)
            {
                var converted = path
                    .Substring(0, path.Length - 3)
                    .Substring(rootPath.Length + 1)
                    .Replace('\\', '/');

                if (converted.StartsWith("remote/")) converted = converted.Substring("remote/".Length);

                routes.Add(converted, path);
            }
        }

        public static bool TryGetMd(string path, out MarkDownViewModel model)
        {
            path = path.Trim('/');

            model = null;
            if (!routes.ContainsKey(path)) return false;

            var md = File.ReadAllText(routes[path]);
            var writer = new StringWriter();
            var markDoc = Markdown.ToHtml(md, writer, pipeline);
            model = new MarkDownViewModel()
            {
                Content = writer.ToString(),
                //Title = markDoc.Count > 0 && (markDoc[0] is HeadingBlock) ? (Block)markDoc[0].Inline
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
}