<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Typograf</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects the <a href="https://github.com/typograf/typograf" target="_blank">Typograf</a> assistant to prepare text for publishing by correcting typographical errors. It helps automatically place non-breaking spaces, remove extra spaces, correct minor typos, insert correct quotes, replace hyphens with dashes, and much more.</p>
<p class="dscr">Supported languages are listed <a href="https://github.com/typograf/typograf/blob/dev/docs/LOCALES.en-US.md" target="_blank">here</a>.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents.</p>

<img alt="Typograf" src="<%= Url.Content("~/content/img/plugins/gifs/typograf.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in ONLYOFFICE Enterprise Edition and Community Edition (Document Server + Community Server).</p>
<p>You can also download this plugin from the <a href="https://www.onlyoffice.com/en/app-directory/typograph" target="_blank">ONLYOFFICE App Directory</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a> or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>Typograf</b>.</li>
    <li>Click on <b>Show Advanced Settings</b>. Choose the locale and the rules you want to apply to your text.</li>
    <li>Select the text you want to correct.</li>
    <li>Run the plugin with the <b>Correct text</b> button.</li>
</ol>


<div class="header-gray">Known issues</div>
<ul>
    <li>When using the plugin in a document abstract with graphic objects, these objects (images, shapes, Text Arts, Text Boxes, tables, charts) are lost along with the text they contained.</li>
    <li>If you select the text inside a graphic object, the text will be removed from the object and inserted into the document in a corrected form.</li>
    <li>Graphic formulas are converted to strings.</li>
    <li>Drop caps, content controls, hyperlinks, underlays, footnotes, bookmarks, caption, tables of contents are removed.</li>
    <li>If at least a part of the text is split into columns, then the columns will be applied to the entire document.</li>
    <li>Breaks are not saved</li>
    <li>Changes suggested using <em>Track Changes</em> are not saved.</li>
    <li>If the plugin is used with the <em>Track Changes</em> mode on, the corrected text will be inserted as a suggested change.</li>
    <li>Comments are not saved, except for the comments to the whole document.</li>
    <li>Headers and footers remain unchanged if the entire document is selected.</li>
    <li>If  header/footer content is selected, the graphic objects it contained will be lost.</li>
    <li>Line numbering is saved if it is applied to the entire document. If it is applied to a section, then it will be lost along with the section.</li>
    <li>When two or more paragraphs have been selected, an empty paragraph will be added after the corrected text.</li>
</ul>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-typograf" target="_blank">https://github.com/ONLYOFFICE/plugin-typograf</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
    <li>Third-party services:
        <ul>
            <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="https://jquery.com" target="_blank">https://jquery.com</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-typograf/blob/master/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><b>Select2</b> gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options (<a href="https://select2.org/" target="_blank">https://select2.org/</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-typograf/blob/master/licenses/Select2.license" target="_blank">MIT</a>.</li>
            <li><b>Typograf</b> - screen typography for typesetting text (<a href="https://github.com/typograf/typograf" target="_blank">https://github.com/typograf/typograf</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-typograf/blob/master/licenses/Typograf.license" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "Typograf",
    "nameLocale": {
        "ru": "&#1058;&#1080;&#1087;&#1086;&#1075;&#1088;&#1072;&#1092;",
        "fr": "Typograf",
        "es": "Typograf",
        "de": "Typograf"
    },
    "guid": "asc.{55159EC6-C91A-4DDB-8E1E-558454666461}",

    "variations": [
        {
            "description": "Typograf",
            "descriptionLocale": {
                "ru": "&#1058;&#1080;&#1087;&#1086;&#1075;&#1088;&#1072;&#1092;",
                "fr": "Typograf",
                "es": "Typograf",
                "de": "Typograf"
            },
            "url": "index.html",

            "icons": [ "resources/img/icon.png", "resources/img/icon@2x.png"],
            "isViewer": true,
            "EditorsSupport": [ "word" ],

            "isVisual": true,
            "isModal": false,
            "isInsideMode": true,

            "initDataType": "",
            "initData": "",

            "isUpdateOleOnResize": false,

            "buttons": [],

            "initOnSelectionChanged": true
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/plugin-typograf/blob/master/scripts/typograf.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onExternalMouseUp">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/getselectedtext") %>">executeMethod ("GetSelectedText")</a></li>
    <li><a href="<%= Url.Action("executemethod/pastetext") %>">executeMethod ("PasteText")</a></li>
    <li><a href="<%= Url.Action("info") %>#recalculate">info.recalculate</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
