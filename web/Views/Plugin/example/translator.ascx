<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Translator</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects the <a href="https://cloud.google.com/translate?hl=ru" target="_blank">Google Translate API</a> for translating the selected text into other languages.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>
<p><b>Analogues:</b> <a href="https://github.com/ONLYOFFICE/plugin-apertium" target="_blank">Apertium</a>, <a href="https://github.com/ONLYOFFICE/plugin-deepl" target="_blank">DeepL</a>.</p>

<img alt="Translator" src="<%= Url.Content("~/content/img/plugins/gifs/translator.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.</p>
<p>You can remove it following the <a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>" target="_blank">on-premises</a>, or <a href="<%= Url.Action("installation/cloud") %>" target="_blank">cloud</a> installation instructions.
<p>The plugin guid: {7327FC95-16DA-41D9-9AF2-0E7F449F6800}.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Select the text you want to translate.</li>
    <li>Open the <b>Plugins</b> tab and press <b>Translator</b>.</li>
    <li>Select the necessary language. The translation will be displayed in the plugin window immediately.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-translator" target="_blank">https://github.com/ONLYOFFICE/plugin-translator</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish and French.</li>
    <li>Third-party services:
        <ul>
            <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="https://jquery.com" target="_blank">https://jquery.com</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-translator/blob/master/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><b>Select2</b> gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options (<a href="https://select2.org/" target="_blank">https://select2.org/</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-translator/blob/master/licenses/Select2.license" target="_blank">MIT</a>.</li>
            <li><a href="https://cloud.google.com/translate?hl=ru" target="_blank">Google Translate API</a> enables translation between languages. License: <a href="https://github.com/matheuss/google-translate-api/blob/master/LICENSE" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "Translator",
    "nameLocale": {
        "ru": "&#1055;&#1077;&#1088;&#1077;&#1074;&#1086;&#1076;&#1095;&#1080;&#1082;",
        "fr": "Traducteur",
        "es": "Traductor",
        "de": "&#220;bersetzer"
    },
    "guid": "asc.{7327FC95-16DA-41D9-9AF2-0E7F449F6800}",
    "version": "1.0",

    "variations": [
        {
            "description": "Translator",
            "descriptionLocale": {
                "ru": "&#1055;&#1077;&#1088;&#1077;&#1074;&#1086;&#1076;&#1095;&#1080;&#1082;",
                "fr": "Traducteur",
                "es": "Traductor",
                "de": "&#220;bersetzer"
            },
            "url": "index.html",

            "icons": [ "resources/img/icon.png", "resources/img/icon@2x.png" ],
            "icons2": [
                {
                    "100%": { "normal": "resources/img/icon.png" },
                    "125%": { "normal": "resources/img/icon@1.25x.png" },
                    "150%": { "normal": "resources/img/icon@1.5x.png" },
                    "175%": { "normal": "resources/img/icon@1.75x.png" },
                    "200%": { "normal": "resources/img/icon@2x.png" }
                }
            ],
            "isViewer": true,
            "EditorsSupport": [ "word", "cell", "slide" ],

            "isVisual": true,
            "isModal": false,
            "isInsideMode": true,

            "initDataType": "text",
            "initData": "",

            "isUpdateOleOnResize": false,

            "buttons": [],

            "initOnSelectionChanged": true
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul class="columns-2">
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onExternalMouseUp">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("events") %>#onTranslate">onTranslate</a></li>
    <li><a href="<%= Url.Action("callcommand") %>">callCommand</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/getversion") %>">executeMethod ("GetVersion")</a></li>
    <li><a href="<%= Url.Action("executemethod/getselectiontype") %>">executeMethod ("GetSelectionType")</a></li>
    <li><a href="<%= Url.Action("executemethod/pastetext") %>">executeMethod ("PasteText")</a></li>
    <li><a href="<%= Url.Action("scope") %>">Asc.scope object</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
