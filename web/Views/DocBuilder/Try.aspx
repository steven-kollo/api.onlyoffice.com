<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Try now
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Try now</span>
    </h1>

    <h2>Search for methods and create a document</h2>
    <p>You can use the search for the desired method to use its script in the text area below. Or, in case you have a script of your own, use the button under the textarea to upload it. You can select the necessary editor.</p>

    <div>
        <ul id="doc-builder-file-types" class="top-nav">
            <li>
                <a href="?type=word">Document Editor</a>
            </li>
            <li>
                <a href="?type=cell">Spreadsheet Editor</a>
            </li>
            <li>
                <a href="?type=slide">Presentation Editor</a>
            </li>
        </ul>
    </div>

    <div class="search-box" id="doc-builder-search-box">
        <div class="search-input">
            <a class="btn"></a>
            <input type="text" name="queryBuilder">
        </div>
        <ul class="builder-search-results"></ul>
    </div>

    <textarea id="builderScript" name="builderScript" class="builder-code" spellcheck="false"></textarea>

    <ul class="list-buttons doc-builder-list-buttons">
        <li>
            <a id="startButton" class="button red">Start script</a>
        </li>
        <li>
            <a id="clearButton" class="button">Clear</a>
        </li>
        <li>
            <a id="builderFileLink" class="button">Upload script</a>
            <input type="file" id="builderFile" />
        </li>
    </ul>

    <h2>Resulting document</h2>

    <div id="editorSpace">
        <div id="placeholder"></div>
    </div>

    <h2>Want to learn how it works?</h2>
    <p><a href="<%= Url.Action("gettingstarted") %>">Get started here</a> and find out the main principles of <b>ONLYOFFICE Document Builder</b> work, or read the <a href="<%= Url.Action("integrationapi") %>">Integration API</a>, <a href="<%= Url.Action("textdocumentapi") %>">Text document API</a>, <a href="<%= Url.Action("spreadsheetapi") %>">Spreadsheet API</a> or <a href="<%= Url.Action("presentationapi") %>">Presentation API</a> articles to find out how to automate your document creation using <b>ONLYOFFICE Document Builder</b>.</p>

    <h2>Get help</h2>

    <p>If you have any questions or feature requests about ONLYOFFICE Document Builder, please visit <a href="https://github.com/ONLYOFFICE/DocumentBuilder/issues" target="_blank">GitHub</a>.</p>
    <p>You can also ask our developers on <a href="https://forum.onlyoffice.com/c/document-builder/37" target="_blank">ONLYOFFICE forum</a> (registration required).</p>

    <script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>
    <script type="text/javascript">

        $(".builder-search-results").hide();

        <% var editorType = HttpUtility.ParseQueryString(new Uri(Request.Url.ToString()).Query).Get("type");
            var docFormat = "docx";
            if (editorType == null)
            {
                editorType = "word";
            }
            else if (editorType.Equals("cell"))
            {
                docFormat = "xlsx";
            }
            else if (editorType.Equals("slide")) docFormat = "pptx";
        %>

        var methodNames = [];
        var editorType = "<%= editorType %>";
        var sections = <%= Newtonsoft.Json.JsonConvert.SerializeObject(DocBuilderDocumentation.GetModule(editorType)) %>;

        for (var section in sections) {
            for (var md in sections[section].methods) {
                var method = sections[section].methods[md];
                var desc = method.description;
                if (desc.includes("<note>")) {
                    desc = desc.substring(0, desc.indexOf("<note>") - 1) + "</p>";
                }
                if (desc.includes("<ul>")) {
                    desc = desc.substring(0, desc.indexOf("<ul>") - 1) + "</p>";
                }
                desc = desc.replace(".", "") + "<p> — " + method.memberof + "." + method.name + "</p>";
                methodNames.push(desc);
            }
        }

        var editorTypesList = document.getElementById("doc-builder-file-types"); 
        var builderTextArea = document.getElementById("builderScript");

        <% var defaultMethod = DocBuilderDocumentation.GetMethod(editorType, "api", "save"); %>
        builderTextArea.value = "<%= Regex.Replace(defaultMethod.Example.Script.Replace("\"", "\\\""), "\\n", "") %>".replaceAll(";", ";\n");

        if ("<%= editorType %>" == "word") {
            editorTypesList.children[0].className = "active";
        } else if ("<%= editorType %>" == "cell") {
            editorTypesList.children[1].className = "active";     
        } else {
            editorTypesList.children[2].className = "active";
        }

        var config = <%= Config.Serialize(
            new Config {
                Document = new Config.DocumentConfig
                    {
                        FileType = docFormat,
                        Key = "apiwh" + Guid.NewGuid(),
                        Title = "Example Title." + docFormat,
                        Url = ConfigurationManager.AppSettings["storage_demo_url"] + "new." + docFormat 
                    },
                DocumentType = editorType,
                EditorConfig = new Config.EditorConfigConfiguration
                    {
                        CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
                        Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                            {
                                Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                    {
                                        Request = false
                                    },
                                CompactHeader = true,
                                CompactToolbar = true,
                                Feedback = new Config.EditorConfigConfiguration.CustomizationConfig.FeedbackConfig
                                    {
                                        Visible = true
                                    },
                                HideRightMenu = true,
                                HideRulers = true,
                                ToolbarHideFileName = true,
                                ToolbarNoTabs = true
                            },
                        Plugins = new Config.EditorConfigConfiguration.PluginsConfig
                            {
                                PluginsData = new List<string>
                                    {
                                        new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/externallistener/config.json"), Query = ""}.ToString()
                                    }
                            }
                    },
                Height = "550px",
                Width = "100%"
            }) %>;

        var postScript = function (newDoc) {
            var removeMethod = {
                docx: "Api.GetDocument().RemoveAllElements();",
                xlsx: "Api.AddSheet(\"Sheet 1\");sheets = Api.GetSheets(); for (shInd = 0; shInd < sheets.length - 1; shInd++){ sheets[shInd].Delete(); }",
                pptx: "var oPresentation = Api.GetPresentation(); var nSlidesCount = oPresentation.GetSlidesCount(); for(var nSlideIdx = nSlidesCount - 1; nSlideIdx > -1; --nSlideIdx) { oPresentation.GetSlideByIndex(nSlideIdx).Delete(); } oPresentation.AddSlide(Api.CreateSlide());"
            };
            var script = (newDoc ? "" : removeMethod["<%= docFormat %>"]) + builderTextArea.value.replaceAll("\\", "").replaceAll("builder.CreateFile", "").replaceAll("\n", "");

            document.getElementsByName("frameEditor")[0].contentWindow.postMessage(JSON.stringify({
                guid : "asc.{A8705DEE-7544-4C33-B3D5-168406D92F72}",
                type : "onExternalPluginMessage",
                data : {
                    type: "executeCommand",
                    text: script
                }
            }), "<%= ConfigurationManager.AppSettings["editor_url"] ?? "*" %>");
        };

        var cleanUpScriptArea = function () {
            document.getElementById("builderScript").value = "";
        };

        window.addEventListener("message", function (message) {
            if (message && message.data == "externallistenerReady") {
                postScript(true);
                document.getElementById("startButton").addEventListener("click", function () {
                    postScript(false);
                }, false);
                document.getElementById("clearButton").addEventListener("click", cleanUpScriptArea, false);
            }
        }, false);

        window.docEditor = new DocsAPI.DocEditor("placeholder", config);
    </script>

</asp:Content>
