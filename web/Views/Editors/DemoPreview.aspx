<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<List<string>>"
    ContentType="text/html" %>

<%@ Import Namespace="ASC.Web.Core.Files" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Integration Examples
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Integration Examples</span>
    </h1>

    <h2>To start integrating document editors into your own website you need to do the following:</h2>

    <ol>
        <li>Download Document Server installation and set it up on your local server:
            <div class="list-buttons">
                <a class="button" href="https://sourceforge.net/projects/teamlab/files/ONLYOFFICE_DocumentServer/v4.0/binaries/" target="_blank">Download Editors
                </a>
            </div>
        </li>

        <% if (Model.Count > 0)
           { %>
        <li>Select the programming language and download the code for the sample of online editors integration into your web site:
            <ul class="list-buttons">
                <% foreach (var example in Model)
                   { %>
                <li>
                    <a class="button" href="<%= Url.Content("~/app_data/" + example.Replace("#", "%23")) %>" target="_blank">
                        <%= example.TrimEnd(".zip".ToCharArray()) %>
                    </a>
                </li>
                <% } %>
            </ul>
        </li>
        <% } %>

        <li><a href="<%= Url.Action("advanced") %>">Edit the configuration files</a> in the sample changing the default path for the one to the editors installed at step 1 and other advanced parameters available for editor configuration.</li>
    </ol>

    <div class="note">The integration examples are used to demonstrate document editors functions and the ways to connect <b>Document Server</b> to your own application. <b>DO NOT USE</b> these examples on your own server without <b>PROPER CODE MODIFICATIONS</b>!</div>

    <p>The result should look like the demo preview below.</p>

    <h2 id="DemoPreview">Demo Preview</h2>
    <table class="demo-tab-panel">
        <tr>
            <td>
                <%= Html.ActionLink("Demo Document editor", "demopreview", "editors", null, null, "text", null, new { id = "textDemo", @class = "active" }) %>
            </td>
            <td>
                <%= Html.ActionLink("Demo Spreadsheet editor", "demopreview", "editors", null, null, "spreadsheet", null, new { id = "spreadsheetDemo", @class = "demo-tab-center" }) %>
            </td>
            <td>
                <%= Html.ActionLink("Demo Presentation editor", "demopreview", "editors", null, null, "presentation", null, new { id = "presentationDemo" }) %>
            </td>
        </tr>
    </table>

    <div class="demo-block">
        <div id="embeddedEditor"></div>
    </div>

    <p>
        If you have any further questions, please contact us at
        <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com</a>.
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceholder" runat="server">
    <script type="text/javascript">
        window.Config = {
            EditorKey: "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
            DemoUrl: "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>"
        };
    </script>

    <script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_api_url"] ?? "" %>"></script>
    <script type="text/javascript" src="<%= Url.Content("~/scripts/init.js") %>"></script>

</asp:Content>
