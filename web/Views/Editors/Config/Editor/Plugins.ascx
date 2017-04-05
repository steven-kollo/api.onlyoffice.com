<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/editor") %>"></a>
    <span class="hdr">Plugins</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The plugins section allows to connect the special add-ons to your Document Server installation which will help you add additional features to document editors.</p>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="pluginsData">pluginsData</td>
            <td>The list of absolute paths to the plugin configuration files (<a href="<%= Url.Action("config", "plugin") %>">config.json</a>), which is defined relatively to the <em>url</em> path.</td>
            <td>Collection of string
                <div class="infotext">Collection</div>
            </td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="url">url</td>
            <td>The absolute path to the directory where the plugins are stored. Deprecated since v.4.3.</td>
            <td>string</td>
            <td>"http://example.com/plugins/"</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/plugins.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>

<div class="header-gray">Example</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "plugins": {
             "pluginsData": [
                 "http://example.com/plugin1/config.json",
                 "http://example.com/plugin2/config.json",
                 ...
             ]
        },
        ...
    },
    ...
});
</pre>
<p>Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed and the plugins are placed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>

<p>
    If you have any further questions, please contact us at
    <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com</a>.
</p>

