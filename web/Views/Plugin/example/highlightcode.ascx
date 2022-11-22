<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Highlight code</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects the <a href="https://highlightjs.org/" target="_blank">highlight.js library</a> for highlighting code syntax with the necessary language, style, and background color.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>

<img alt="HighlightCode" src="<%= Url.Content("~/content/img/plugins/gifs/highlight-code.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.</p>
<p>You can remove it following the <a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>" target="_blank">on-premises</a>, or <a href="<%= Url.Action("installation/cloud") %>" target="_blank">cloud</a> installation instructions.
<p>The plugin guid: {BE5CBF95-C0AD-4842-B157-AC40FEDD9841}.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Find the plugin in the <b>Plugins</b> tab.</li>
    <li>Paste the code into the plugin window</li>
    <li>The language is detected automatically, but you can change it. You can also customize the code display style, tabs and background color.</li>
    <li>Click the <b>Ok</b> button to paste the code into the document.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-highlightcode" target="_blank">https://github.com/ONLYOFFICE/plugin-highlightcode</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish and French.</li>
    <li>The <em>styles</em> folder contains all the code styles that the plugin supports.</li>
    <li><em>plugin_style.css</em> and <em>scrollable_div.js</em> are used to adjust the plugin style.</li>
    <li>Third-party service:
    <ul>
        <li><b>Highlight.js library</b> - a syntax highlighter written in JavaScript (<a href="https://highlightjs.org/" target="_blank">https://highlightjs.org/</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-highlightcode/blob/master/licenses/Highlight.license" target="_blank">BSD License</a>.</li>
        <li><b>Spectrum</b> - a JavaScriptcolorpickerplugin that uses the jQuery framework. License: <a href="https://github.com/ONLYOFFICE/plugin-highlightcode/blob/master/licenses/spectrum.license" target="_blank">MIT License</a>.</li>
        <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="https://jquery.com" target="_blank">https://jquery.com</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-highlightcode/blob/master/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
        <li><b>Select2</b> gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options (<a href="https://select2.org/" target="_blank">https://select2.org/</a>). License:  <a href="https://github.com/ONLYOFFICE/plugin-highlightcode/blob/master/licenses/Select2.license" target="_blank">MIT</a>.</li>
    </ul>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "Highlight code",
    "nameLocale": {
        "ru": "&#1055;&#1086;&#1076;&#1089;&#1074;&#1077;&#1090;&#1082;&#1072; &#1082;&#1086;&#1076;&#1072;",
        "fr": "Code en surbrillance",
        "es": "Resaltar el co&#769;digo",
        "de": "Code hervorheben"
    },
    "guid": "asc.{BE5CBF95-C0AD-4842-B157-AC40FEDD9841}",
    "version": "1.0",

    "variations": [
        {
            "description": "Highlight code",
            "descriptionLocale": {
                "ru": "&#1055;&#1086;&#1076;&#1089;&#1074;&#1077;&#1090;&#1082;&#1072; &#1082;&#1086;&#1076;&#1072;",
                "fr": "Code en surbrillance",
                "es": "Resaltar el co&#769;digo",
                "de": "Code hervorheben"
            },
            "url": "index.html",

            "icons": [ "resources/light/icon.png", "resources/light/icon@2x.png" ],
            "icons2": [
                {
                    "style" : "light",
                    
                    "100%": {
                        "normal": "resources/light/icon.png"
                    },
                    "125%": {
                        "normal": "resources/light/icon@1.25x.png"
                    },
                    "150%": {
                        "normal": "resources/light/icon@1.5x.png"
                    },
                    "175%": {
                        "normal": "resources/light/icon@1.75x.png"
                    },
                    "200%": {
                        "normal": "resources/light/icon@2x.png"
                    }
                },
                {
                    "style" : "dark",
                    
                    "100%": {
                        "normal": "resources/dark/icon.png"
                    },
                    "125%": {
                        "normal": "resources/dark/icon@1.25x.png"
                    },
                    "150%": {
                        "normal": "resources/dark/icon@1.5x.png"
                    },
                    "175%": {
                        "normal": "resources/dark/icon@1.75x.png"
                    },
                    "200%": {
                        "normal": "resources/dark/icon@2x.png"
                    }
                }
            ],
            "isViewer": false,
            "EditorsSupport": [ "word", "cell", "slide" ],

            "isVisual": true,
            "isModal": true,
            "isInsideMode": false,

            "initDataType": "html",
            "initData": "",

            "buttons": [
                {
                    "text": "Ok",
                    "primary": true
                },
                {
                    "text": "Cancel",
                    "primary": false,
                    "textLocale": {
                        "ru": "&#1054;&#1090;&#1084;&#1077;&#1085;&#1072;",
                        "fr": "Annuler",
                        "es": "Cancelar",
                        "de": "Abbrechen"
                    }
                }
            ],

            "initOnSelectionChanged": true
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul class="columns-2">
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onExternalMouseUp") %>">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("events/onTranslate") %>">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/common/pastehtml") %>">executeMethod ("PasteHtml")</a></li>
    <li><a href="<%= Url.Action("loadmodule") %>">loadModule</a></li>
    <li><a href="<%= Url.Action("resizewindow") %>">resizeWindow</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/plugin-highlightcode/issues" target="_blank">GitHub</a>.</p>
