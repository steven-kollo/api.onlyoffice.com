<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Num2Word</span>
</h1>

<p class="dscr">A non-visual, non-system plugin that is available in the spreadsheet editor and allows the user to transform a number into a word (a number written as a string).</p>
<p><b>Plugin type:</b> non-visual, non-system.</p>
<p><b>Supported editors:</b> spreadsheet.</p>

<img alt="Num2Word" src="<%= Url.Content("~/content/img/plugins/gifs/num2word.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/num2word" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Select any number.</li>
    <li>Open the <b>Plugins</b> tab and press <b>num2word</b>.</li>
    <li>The number will be transformed into a string in Russian and inserted to the cell below.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/num2word" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/num2word</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
</ol>


<h2>Config</h2>
<pre>
{
    "name" : "num2word",
    "guid" : "asc.{902F74A4-89F2-4028-8DB0-BD913E07335C}",

    "variations" : [
        {
            "description" : "num2word",
            "url"         : "index.html",

            "icons"           : ["resources/img/icon.png", "resources/img/icon@2x.png"],
            "isViewer"        : false,
            "EditorsSupport"  : ["cell"],

            "isVisual"        : false,
            "isModal"         : false,
            "isInsideMode"    : false,

            "initDataType"    : "text",
            "initData"        : "",

            "isUpdateOleOnResize" : false,

            "buttons"         : [],

            "initOnSelectionChanged" : true
        }
    ]
}
</pre>

<ul>
    <li>The (<em>"isVisual": false</em>) parameter means that this plugin does not have its own frame or tab.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/num2word/num2word.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("info") %>#recalculate">info.recalculate</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
