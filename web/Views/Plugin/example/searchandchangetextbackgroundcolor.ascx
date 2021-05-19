<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Search and change text background color</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in the document editor and allows the user to search for target text and change its background color.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> document.</p>

<img alt="SearchAndChangeTextBackgroundColor" src="<%= Url.Content("~/content/img/plugins/gifs/search-and-change-background-text.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/develop/example_search_and_change_text_background_color" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>Example search and change background text</b>.</li>
    <li>Enter the required text in the field.</li>
    <li>Choose the necessary color in the color block.</li>
    <li>Press the <b>Color</b> button to change the background color for the selected text.</li>
    <li>Press the <b>Color all</b> button to change the background color for all the found results.</li>
    <li>Press the <b>Reset</b> button to reset the background color for the selected text.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/develop/example_search_and_change_text_background_color" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/develop/example_search_and_change_text_background_color</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
</ol>


<h2>Config</h2>
<pre>
{
    "name" : "Example search and change background text",
    "guid" : "asc.{EF5735E0-69A7-4D4A-9ABE-F58FD70F488J}",

    "variations" : [
        {
            "description" : "Example search and change background text",
            "url"         : "index.html",

            "icons"           : ["resources/img/icon.png", "resources/img/icon@2x.png", "resources/img/icon2.png", "resources/img/icon2@2x.png"],
            "isViewer"        : false,
            "EditorsSupport"  : ["word"],

            "isVisual"        : true,
            "isModal"         : false,
            "isInsideMode"    : true,

            "initDataType"    : "",
            "initData"        : "",

            "isUpdateOleOnResize" : false,

            "buttons"         : []

        }
    ]
}
</pre>

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so it works on the left-side panel of the editor.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/example_search_and_change_text_background_color/scripts/code.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("callcommand") %>">callCommand</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("scope") %>">Asc.scope object</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
