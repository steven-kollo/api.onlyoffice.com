<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= ((DBEntry)Model).Name %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% var section = (DBEntry)Model; %>

    <h1>
       <span class="hdr"><%= section.Name %></span>
    </h1>

    <h4 class="header-gray" id="<%= section.Name %>">new <%= section.Name %>(<%= section.Params != null ? string.Join(", ", section.Params.Select(p => p.Name)) : "" %>)</h4> 

    <span id="dscr" class="dscr">
        <%= section.Description %>
    </span>

    <% if (section.Params != null && section.Params.Any()) { %>
    <h2>Parameters:</h2>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
                <td>Type</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <% foreach(var p in section.Params) { %>
                <tr class="tablerow">
                    <td><em><%= p.Name %></em></td>
                    <td><%= DocPluginsDocumentation.Instance.ParamTypeToHtml(p) %></td>
                    <td><%= p.Description %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <% } %>

    <% if (section.Properties != null && section.Properties.Any()) { %>
    <h2>Properties</h2>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
                <td>Type</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <% foreach(var p in section.Properties) { %>
                <tr class="tablerow">
                    <td><em><%= p.Name %></em></td>
                    <td><%= p.Type %></td>
                    <td><%= p.Description %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <% } %>

    <h2>Methods</h2>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <% foreach (var method in section.Methods) { %>
                <tr class="tablerow">
                    <% if (section.Name.ToLower() == "plugin") { %>
                        <td><a href="<%= Url.Action(method.Key.ToLower()) %>"><%= method.Key %></a></td>
                    <% } else if (section.Path.ToLower() == "pluginbase") { %>
                        <td><a href="<%= Url.Action(string.Format("{0}/{1}", section.Name.ToLower(), method.Key.ToLower())) %>"><%= method.Key %></a></td>
                    <% } else { %>
                        <td><a href="<%= Url.Action(string.Format("executemethod/{0}/{1}", section.Path.ToLower(), method.Key.ToLower())) %>"><%= method.Key %></a></td>
                    <% } %>
                    <td><%= method.Value.Description %></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <% if (section.Example != null) { %>
        <% if (!string.IsNullOrEmpty(section.Example.Script)) { %>
                <h2>Example</h2>
                <div class="button copy-code">Copy code</div>
<pre><%= section.Example.Script %></pre>

    <h2>Resulting document</h2>

    <script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>

    <div id="editorSpace">
        <div id="placeholder"></div>
    </div>

    <script type="text/javascript">
        <%
            var ext = "docx";
            switch (section.Module)
            {
                case "cell":
                    ext = "xlsx";
                    break;
                case "slide":
                    ext = "pptx";
                    break;
            }

            var documentType = section.Module;
            if (documentType == "form") documentType = "word";
        %>

        var config = <%= Config.Serialize(
            new Config
                {
                    Document = new Config.DocumentConfig
                        {
                            FileType = ext,
                            Key = "apiwh" + Guid.NewGuid(),
                            Permissions = new Config.DocumentConfig.PermissionsConfig(),
                            Title = "Example Title." + ext,
                            Url = ConfigurationManager.AppSettings["storage_demo_url"] + "new." + ext
                        },
                    DocumentType = documentType,
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
                            Plugins = new Config.EditorConfigConfiguration.PluginsConfig()
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

        window.addEventListener("message", function (message) {
            if (message && message.data == "externallistenerReady") {
                document.getElementsByName("frameEditor")[0].contentWindow.postMessage(JSON.stringify({
                    guid : "asc.{A8705DEE-7544-4C33-B3D5-168406D92F72}",
                    type : "onExternalPluginMessage",
                    data : {
                        type: "executeCommand",
                        text: "<%= Regex.Replace(section.Example.Script.Replace("\"", "\\\"").Replace("builder.CreateFile", "").Replace("builder.SaveFile", "").Replace("builder.CloseFile()", ""), "\\r*\\n", "") %>"
                    }
                }), "<%= ConfigurationManager.AppSettings["editor_url"] ?? "*" %>");
            }
        }, false);

        window.docEditor = new DocsAPI.DocEditor("placeholder", config);
    </script>
        <% } %>
    <% } %>

</asp:Content>
