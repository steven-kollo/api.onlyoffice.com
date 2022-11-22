<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Count words and characters</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Counts paragraphs, words and characters with or without spaces in the selected part of the document.</p>
<note>
    <p>The following elements are not included in the word count:</p>
    <ul>
        <li>footnotes/endnotes;</li>
        <li>numbers from numbered lists;</li>
        <li>page numbers.</li>
    </ul>
</note>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents.</p>

<img alt="CountWordsAndCharacters" src="<%= Url.Content("~/content/img/plugins/gifs/count-words-and-characters.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in ONLYOFFICE Enterprise Edition and Community Edition (Document Server + Community Server).</p>
<p>You can also download this plugin from <a href="https://www.onlyoffice.com/en/app-directory/word-counter" target="_blank">the ONLYOFFICE App Directory</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a> or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Select the text.</li>
    <li>Open the <b>Plugins</b> tab and press <b>Count words and characters</b>.</li>
    <li>Calculations will be displayed in the plugin window automatically.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-wordscounter" target="_blank">https://github.com/ONLYOFFICE/plugin-wordscounter</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech and French.</li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name" : "Count words and characters",
    "guid" : "asc.{584EEEE8-DBF5-45C3-A4CA-F52177C82754}",

    "variations" : [
        {
            "description" : "Count words and characters",
            "url"         : "index.html",

            "icons"           : ["resources/img/icon.png", "resources/img/icon@2x.png", "resources/img/icon2.png", "resources/img/icon2@2x.png"],
            "isViewer"        : true,
            "EditorsSupport"  : ["word"],

            "isVisual"        : true,
            "isModal"         : false,
            "isInsideMode"    : true,

            "initDataType"    : "text",
            "initData"        : "",

            "buttons"         : [],

            "initOnSelectionChanged": true
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul>
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onTranslate") %>">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/plugin-wordscounter/issues" target="_blank">GitHub</a>.</p>
