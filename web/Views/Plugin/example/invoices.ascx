<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Invoices</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in the document editor and allows the user to insert template fields for invoice information.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> document.</p>

<img alt="Invoices" src="<%= Url.Content("~/content/img/plugins/gifs/invoices.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/invoices" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>Invoices</b>.</li>
    <li>Press the <b>+</b> or <b>Mark</b> buttons to add template fields into the document.
</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/invoices" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/invoices</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
</ol>


<h2>Config</h2>
<pre>
{
    "name" : "Invoices",
    "guid" : "asc.{6B6715E5-A558-4F70-8058-40704CD659CF}",

    "variations" : [
        {
            "description" : "invoices",
            "url"         : "index.html",

            "icons"           : ["resources/img/icon.png", "resources/img/icon@2x.png"],
            "isViewer"        : false,
            "EditorsSupport"  : ["word"],

            "isVisual"        : true,
            "isModal"         : false,
            "isInsideMode"    : true,

            "initDataType"    : "none",
            "initData"        : "",

            "isUpdateOleOnResize" : false,

            "buttons"        : [ ]
        }
    ]
}
</pre>

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so it works on the left-side panel of the editor.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/invoices/code.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("info") %>#recalculate">info.recalculate</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
