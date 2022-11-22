<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Num2Word</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Transforms a number into a word (a number written as a string).</p>
<p><b>Plugin type:</b> non-visual, non-system.</p>
<p><b>Supported editors:</b> spreadsheets.</p>

<img alt="Num2Word" src="<%= Url.Content("~/content/img/plugins/gifs/num2word.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/num2word" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Select any number.</li>
    <li>Open the <b>Plugins</b> tab and press <b>num2word</b>.</li>
    <li>The number will be transformed into a string in Russian and inserted to the cell below.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/num2word" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/num2word</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
</ol>


<div class="header-gray">Config</div>
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

            "initDataType"    : "text",
            "initData"        : "",

            "buttons"         : [],

            "initOnSelectionChanged" : true
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul>
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("info") %>#recalculate">info.recalculate</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
