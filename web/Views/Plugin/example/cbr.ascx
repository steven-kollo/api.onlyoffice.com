<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">CBR</span>
</h1>

<p class="dscr">A non-visual, non-system plugin that is available in the spreadsheet editor and allows the user to connect <a href="https://fixer.io/" target="_blank">Fixer API</a> for inserting the current and historical foreign exchange (forex) rates into the document.</p>
<p><b>Plugin type:</b> non-visual, non-system.</p>
<p><b>Supported editors:</b> spreadsheet.</p>

<img alt="CBR" src="<%= Url.Content("~/content/img/plugins/gifs/cbr.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/cbr" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Select the cell.</li>
    <li>Open the <b>Plugins</b> tab and press <b>cbr</b>.</li>
    <li>The current and historical exchange rates will be inserted below, starting from the selected cell.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/cbr" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/cbr</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
    <li>Third-party services:
        <ul>
            <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="http://jquery.com/" target="_blank">http://jquery.com/</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/cbr/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><b>jQuery UI</b> - a curated set of user interface interactions, effects, widgets, and themes built on top of the jQuery JavaScript Library. Whether you're building highly interactive web applications or you just need to add a date picker to a form control, jQuery UI is the perfect choice (<a href="http://jqueryui.com/" target="_blank">http://jqueryui.com/</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/cbr/licenses/jQuery.license" target="_blank">MIT</a>.</li>
            <li><b>Fixer</b> is a free API for current and historical foreign exchange rates published by the European Central Bank (<a href="https://fixer.io/" target="_blank">https://fixer.io/</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/cbr/licenses/Fixer.license" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<h2>Config</h2>
<pre>
{
    "name" : "cbr",
    "guid" : "asc.{5F9D4EB4-AF61-46EF-AE25-46C96E75E1DD}",

    "variations" : [
        {
            "description" : "cbr",
            "url"         : "index.html",

            "icons"           : ["resources/img/icon.png", "resources/img/icon@2x.png"],

            "isViewer"        : false,
            "EditorsSupport"  : ["cell"],

            "isVisual"        : false,
            "isModal"         : false,
            "isInsideMode"    : false,

            "initDataType"    : "none",
            "initData"        : "",

    "isUpdateOleOnResize" : false,

    "buttons" : []
        }
    ]
}
</pre>

<ul>
    <li>The (<em>"isVisual": false</em>) parameter means that this plugin does not have its own frame or tab.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/cbr/cbr.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("info/recalculate") %>">info.recalculate</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
