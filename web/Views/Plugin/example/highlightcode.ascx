<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Highlight code</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in all the editors and allows the user to connect the <a href="https://highlightjs.org/" target="_blank">highlight.js library</a> for highlighting code syntax with the necessary language, style, and background color.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> document, spreadsheet, presentation.</p>

<img alt="HighlightCode" src="<%= Url.Content("~/content/img/plugins/gifs/highlight-code.gif") %>" />


<h2>Installation</h2>
<p>Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors</p>
<p>You can remove it using the <a href="https://api.teamlab.info/plugin/installation/desktop">desktop</a>, <a href="https://api.teamlab.info/plugin/installation/onpremises" target="_blank">on-premises</a> or <a href="https://api.teamlab.info/plugin/installation/cloud" target="_blank">cloud</a> installation instructions.
<p>The plugin guid: {BE5CBF95-C0AD-4842-B157-AC40FEDD9841}.</p>


<h2>Usage</h2>

<ol>
    <li>Find the plugin in the <b>Plugins</b> tab.</li>
    <li>Paste the code into the plugin window</li>
    <li>The language is detected automatically, but you can change it. You can also customize the code display style, tabs and background color.</li>
    <li>Click the <b>Ok</b> button to paste the code into the document.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-highlightcode" target="_blank">https://github.com/ONLYOFFICE/plugin-highlightcode</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish and French.</li>
    <li>The <em>styles</em> folder contains all the code styles that the plugin supports.</li>
    <li><em>plugin_style.css</em> and <em>scrollable_div.js</em> are used to adjust the plugin style.</li>
    <li>Third-party service:
    <ul>
        <li><b>Highlight.js library</b> - a syntax highlighter written in JavaScript (<a href="https://highlightjs.org/" target="_blank">https://highlightjs.org/</a>). License: <a href="https://github.com/highlightjs/highlight.js/blob/master/LICENSE" target="_blank">BSD License</a>.</li>
        <li><b>Spectrum</b> - a JavaScriptcolorpickerplugin that uses the jQuery framework. License: <a href="https://github.com/ONLYOFFICE/plugin-highlightcode/blob/master/licenses/spectrum.license" target="_blank">MIT License</a>.</li>
        <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="http://jquery.com/" target="_blank">http://jquery.com/</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-highlightcode/blob/master/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
        <li><b>Select2</b> gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options (<a href="https://select2.org/" target="_blank">https://select2.org/</a>). License:  <a href="https://github.com/ONLYOFFICE/plugin-highlightcode/blob/master/licenses/Select2.license" target="_blank">MIT</a>.</li>
    </ul>
</ol>


<h2>Config</h2>
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

            "icons": [ "icon.png", "icon@2x.png", "icon.png", "icon@2x.png" ],
            "isViewer": false,
            "EditorsSupport": [ "word", "cell", "slide" ],

            "isVisual": true,
            "isModal": true,
            "isInsideMode": false,

            "initDataType": "html",
            "initData": "",

            "isUpdateOleOnResize": false,

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

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so it works in its own frame.</li>
    <li>This plugin has two buttons - <em>Ok</em> and <em>Cancel</em>. They are specified with the <em>buttons</em> parameter. The <em>Cancel</em> button is translated into Russian, French, Spanish and German languages with the <em>textLocale</em> parameter.</li>
    <li>The plugin name and description are translated into Russian, French, Spanish and German with the <em>nameLocale</em> and <em>descriptionLocale</em> parameters.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/plugin-highlightcode/blob/master/scripts/code.js" target="_blank">here</a>.</p>
<ul class="columns-2">
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onExternalMouseUp">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/pastehtml") %>">executeMethod ("PasteHtml")</a></li>
    <li><a href="<%= Url.Action("loadmodule") %>">loadModule</a></li>
    <li><a href="<%= Url.Action("resizewindow") %>">resizeWindow</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/plugin-highlightcode/issues" target="_blank">on GitHub</a>.</p>
