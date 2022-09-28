<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Get and paste html</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Gets the document content as HTML code, modifies it, and pastes back to the document.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>

<img alt="GetAndPasteHTML" src="<%= Url.Content("~/content/img/plugins/gifs/get-and-paste-html.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in ONLYOFFICE Enterprise Edition and Community Edition (Document Server + Community Server). </p>
<p>You can also download this plugin from the <a href="https://www.onlyoffice.com/en/app-directory/html" target="_blank">ONLYOFFICE App Directory</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a> or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Select the necessary content.</li>
    <li>Open the <b>Plugins</b> tab and press <b>Get and past html</b>.</li>
    <li>The <em>HTML</em> code of the selected content will be automatically displayed in the plugin window. You can modify this code or write your own one.</li>
    <li>To paste the modified or your own HTML code into the document, press the <b>Paste into document</b> button.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-html" target="_blank">https://github.com/ONLYOFFICE/plugin-html</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
    <li>The <em>translations</em> folder which contains translations into Russian, German, Spanish, Czech and French.</li>
    <li>Third-party service:
        <ul>
            <li><a href="https://codemirror.net/" target="_blank">CodeMirror</a>- versatile text editor implemented in JavaScript for the browser. License:  <a href="https://github.com/ONLYOFFICE/plugin-html/blob/master/licenses/codemirror.license" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
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

            "buttons": [],

            "initOnSelectionChanged": true
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onTranslate">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/pastehtml") %>">executeMethod ("PasteHtml")</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/plugin-html/issues" target="_blank">GitHub</a>.</p>
