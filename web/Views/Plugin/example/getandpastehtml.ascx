<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Get and paste html</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in all the editors and allows the user to get the document content as HTML code, modify it, and paste back to the document.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> document, spreadsheet, presentation.</p>

<img alt="GetAndPasteHTML" src="<%= Url.Content("~/content/img/plugins/gifs/get-and-paste-html.gif") %>" />


<h2>Installation</h2>
<p>Available by default in ONLYOFFICE Enterprise Edition and Community Edition (Document Server + Community Server). </p>
<p>You can also download this plugin from the <a href="https://www.onlyoffice.com/en/app-directory/html" target="_blank">ONLYOFFICE App Directory</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a> or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Select the necessary content.</li>
    <li>Open the <b>Plugins</b> tab and press <b>Get and past html</b>.</li>
    <li>The <em>HTML</em> code of the selected content will be automatically displayed in the plugin window. You can modify this code or write your own one.</li>
    <li>To paste the modified or your own HTML code into the document, press the <b>Paste into document</b> button.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-html" target="_blank">https://github.com/ONLYOFFICE/plugin-html</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
    <li>The <em>translations</em> folder which contains translations into Russian, German, Spanish, Czech and French.</li>
    <li>Third-party service:
        <ul>
            <li><a href="https://codemirror.net/" target="_blank">CodeMirror</a>- versatile text editor implemented in JavaScript for the browser. License:  <a href="https://github.com/ONLYOFFICE/plugin-html/blob/master/licenses/codemirror.license" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<h2>Config</h2>
<pre>
Config
{
    "name": "Get and past html",
    "guid": "asc.{E581C417-3C80-4BC2-B42D-502850FDC1E7}",

    "variations": [
        {
            "description": "Get and past html",
            "url": "index.html",

            "icons": [ "resources/img/icon.png", "resources/img/icon@2x.png", "resources/img/icon2.png", "resources/img/icon2@2x.png" ],
            "isViewer": true,
            "EditorsSupport": [ "word", "cell", "slide" ],

            "isVisual": true,
            "isModal": false,
            "isInsideMode": true,

            "initDataType": "html",
            "initData": "",

            "isUpdateOleOnResize": false,

            "buttons": [],

            "initOnSelectionChanged": true
        }
    ]
}
</pre>

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so it works on the left-side panel of the editor.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/plugin-html/blob/master/scripts/code.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onTranslate">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/pastehtml") %>">executeMethod ("PasteHtml")</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/plugin-html/issues" target="_blank">on GitHub</a>.</p>
