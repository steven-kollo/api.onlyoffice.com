<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Settings</span>
</h1>

<p class="dscr">A non-visual, system plugin that is available in all the editors and allows the user to protect a document using a watermark.</p>
<p><b>Plugin type:</b> non-visual, system.</p>
<p><b>Supported editors:</b> document, spreadsheet, presentation.</p>

<img alt="Settings" src="<%= Url.Content("~/content/img/plugins/gifs/settings.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from  <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/settings" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>After adding the plugin to the editor, just reopen the document. A watermark will be displayed.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/settings" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/settings</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
</ol>


<h2>Config</h2>
<pre>
{
    "name"       : "settings",
    "guid"       : "asc.{CF3A000F-C6B4-451D-AC0B-F3DDAB1880D2}",
    "baseUrl"    : "",
    "variations" : [
        {
            "description"         : "settings",
            "url"                 : "index.html",
            "icons"               : ["icon.png", "icon@2x.png"],
            "isViewer"            : true,
            "EditorsSupport"   : [ "word", "cell", "slide" ],
            "isSystem"  : true,
            "isVisual"            : false,
            "isModal"             : false,
            "isInsideMode"        : false,
            "initDataType"        : "none",
            "initData"            : "",
            "buttons"             : []
        }
    ]
}
</pre>

<ul>
    <li>Please note that this plugin is system (<em>"isSystem" : true</em>), so it is not displayed on the <b>Plugins</b> tab.</li>
    <li>The <em>"isVisual": false</em> parameter means that this plugin does not have its own frame or panel.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/settings/code.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executeMethod/setproperties") %>">executeMethod ("SetProperties")</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
