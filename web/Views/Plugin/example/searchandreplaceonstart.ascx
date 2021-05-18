<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Search and replace on start</span>
</h1>

<p class="dscr">A non-visual, system plugin that is available in the document editor and allows the user to search for and replace text in the document when it is reopened.</p>
<p><b>Plugin type:</b> non-visual, system.</p>
<p><b>Supported editors:</b> document.</p>

<img alt="SearchAndReplaceOnStart" src="<%= Url.Content("~/content/img/plugins/gifs/search-and-replace-on-start.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/searchAndReplaceOnStart" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Enter any text into the document (for this example it is <em>ONLYOFFICE</em>).</li>
    <li>In the plugin code enter the replacement text in <b>replaceString</b> parameter.</li>
    <li>Reopen the document.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/searchAndReplaceOnStart" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/searchAndReplaceOnStart</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
</ol>


<h2>Config</h2>
<pre>
{
    "name"       : "searchAndReplaceOnStart",
    "guid"       : "asc.{C820F3CC-1248-4CA2-8D0F-D7EFD44DE09C}",
    "baseUrl"    : "",
    "variations" : [
        {
            "description"         : "searchAndReplaceOnStart",
            "url"                 : "index.html",
            "icons"               : ["resources/img/icon.png", "resources/img/icon@2x.png"],
            "isViewer"            : true,
            "EditorsSupport"   : [ "word" ],
            "isSystem"     : true,
            "isVisual"            : false,
            "isModal"             : false,
            "isInsideMode"        : false,
            "initDataType"        : "none",
            "initData"            : "",
            "buttons"             : [],

            "events" : ["onDocumentContentReady"]
        }
    ]
}
</pre>

<ul>
    <li>The (<em>"isVisual": false</em>) parameter means that this plugin does not have its own frame or tab.</li>
    <li>Please note that this is a system plugin (<em>"isSystem" : true</em>), so it is not displayed on the <b>Plugins</b> tab.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/searchAndReplaceOnStart/code.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onDocumentContentReady">onDocumentContentReady</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/searchandreplace") %>">executeMethod ("SearchAndReplace")</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
