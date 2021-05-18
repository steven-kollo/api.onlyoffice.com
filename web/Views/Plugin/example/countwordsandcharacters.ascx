<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Count words and characters</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in the document editor and allows the user to count paragraphs, words and characters with or without spaces in the selected part of the document.</p>
<note>
    <p>The following elements are not included in the word count:</p>
    <ul>
        <li>footnotes/endnotes,</li>
        <li>numbers from numbered lists,</li>
        <li>page numbers.</li>
    </ul>
</note>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> document.</p>

<img alt="CountWordsAndCharacters" src="<%= Url.Content("~/content/img/plugins/gifs/count-words-and-characters.gif") %>" />


<h2>Installation</h2>
<p>Available by default in ONLYOFFICE Enterprise Edition and Community Edition (Document Server + Community Server).</p>
<p>You can also download this plugin from <a href="https://www.onlyoffice.com/en/app-directory/word-counter" target="_blank">the ONLYOFFICE App Directory</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a> or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Select the text.</li>
    <li>Open the <b>Plugins</b> tab and press <b>Count words and characters</b>.</li>
    <li>Calculations will be displayed in the plugin window automatically.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-wordscounter" target="_blank">https://github.com/ONLYOFFICE/plugin-wordscounter</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech and French.</li>
</ol>


<h2>Config</h2>
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

            "isUpdateOleOnResize" : true,

            "buttons"         : [],

            "initOnSelectionChanged": true
        }
    ]
}
</pre>

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so it works on the left-side panel of the editor.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/plugin-wordscounter/blob/master/scripts/code.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onTranslate">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/plugin-wordscounter/issues" target="_blank">on GitHub</a>.</p>
