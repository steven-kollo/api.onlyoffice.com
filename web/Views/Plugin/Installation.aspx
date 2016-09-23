<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plugin installation
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Installing plugins to document editors</span>
    </h1>

    <p class="dscr">Plugins can be added to any editor versions: server and desktop.</p>

    <h2>Adding a plugin to the desktop editors</h2>

    <p>You need to take the plugin folder (it <b>must</b> contain the <a class="underline" href="<%= Url.Action("config") %>">config.json</a>, <a class="underline" href="<%= Url.Action("indexhtml") %>">index.html</a> and the <a class="underline" href="<%= Url.Action("code") %>">pluginCode.js</a> files), archive it, change the file extension to <em>.plugin</em> and drag-and-drop this archived file to the desktop editor main page. It will be added immediately to the opened editors and all the editors you will open afterwards.</p>


    <h2>Adding a plugin to the server editors</h2>

    <p>You need to edit the editor config and all the Document Server users will have the plugin available afterwards. Use the <b>Document Server</b> config to add the following lines:</p>

    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    ...
    "editorConfig": {
        ...
        "plugins": {
             "pluginsData": [
                 "plugin1/config.json",
                 "plugin2/config.json",
                 ...
             ],
             "url": "http://example.com/plugins/",
        },
    },
});
</pre>

    <p>See the <a class="underline" href="<%= Url.Action("config/editor/plugins", "editors") %>">Document Server API</a> documentation for more information on where to find the config and what and how can be changed there.</p>


    <h2>Uninstalling plugins from document editors</h2>

    <p>To remove the installed plugins the following actions need to be done:</p>

    <ul>
        <li>For the desktop editors - remove the <em>config.json</em> file from the <em>%USERPROFILE%\AppData\Local\ONLYOFFICE\DesktopEditors\data\</em> (for Windows) or from <em>$HOME/ONLYOFFICE/DesktopEditors/data/</em> (for Linux) folder and restart the desktop editor application.</li>
        <li>For the server version - remove the lines added to the <b>Document Server</b> configuration file, the plugins will become unavailable for all portal users at the editors next start.</li>
    </ul>
</asp:Content>
