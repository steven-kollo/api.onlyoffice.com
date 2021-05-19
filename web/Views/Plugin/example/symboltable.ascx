<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Symbol Table</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in all the editors and allows the user to insert special symbols into the document.
</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> document, spreadsheet, presentation.</p>

<img alt="SymbolTable" src="<%= Url.Content("~/content/img/plugins/gifs/symbol-table.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/symboltable" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Find the plugin on the <b>Plugins</b> tab.</li>
    <li>Choose any character you want to paste (you can enter its unicode Hex value by yourself). You can choose the characters range to quickly navigate through them.</li>
    <li>Choose the characters font.</li>
    <li>Press the <b>Insert</b> button.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/symboltable" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/symboltable</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish and French.</li>
    <li><em>character.js</em> contains all the characters that the plugin supports.</li>
    <li>Third-party services:
        <ul>
            <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="http://jquery.com/" target="_blank">http://jquery.com/</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/symboltable/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><b>Select2</b> gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options (<a href="https://select2.org/" target="_blank">https://select2.org/</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/symboltable/licenses/Select2.license" target="_blank">MIT</a>.</li>
        </ul>
    </li>
</ol>


<h2>Config</h2>
<pre>
{
    "name": "Symbol Table",
    "nameLocale": {
        "ru": "&#1058;&#1072;&#1073;&#1083;&#1080;&#1094;&#1072; &#1089;&#1080;&#1084;&#1074;&#1086;&#1083;&#1086;&#1074;",
        "fr": "Table des symboles",
        "es": "Tabla de si&#769;mbolos",
        "de": "Symboltabelle"
    },
    "guid": "asc.{03C18A8D-8E01-444A-86EB-EDDFA7773157}",
    "baseUrl": "",

    "variations": [
        {
            "description": "Symbol Table",
            "descriptionLocale": {
                "ru": "&#1058;&#1072;&#1073;&#1083;&#1080;&#1094;&#1072; &#1089;&#1080;&#1084;&#1074;&#1086;&#1083;&#1086;&#1074;",
                "fr": "Table des symboles",
                "es": "Tabla de si&#769;mbolos",
                "de": "Symboltabelle"
            },
            "url": "index.html",

            "icons": [ "resources/img/icon.png", "resources/img/icon@2x.png", "resources/img/icon2.png", "resources/img/icon2@2x.png" ],
            "isViewer": false,
            "EditorsSupport": [ "word", "cell", "slide" ],

            "isVisual": true,
            "isModal": false,
            "isInsideMode": true,

            "initDataType": "html",
            "initData": "",

            "isUpdateOleOnResize": false,

            "buttons": [
                {
                    "text": "Insert",
                    "primary": true,
                    "textLocale": {
                        "ru": "&#1042;&#1089;&#1090;&#1072;&#1074;&#1080;&#1090;&#x044C;",
                        "fr": "Inse&#769;rer",
                        "es": "Insertar",
                        "de": "Einf&#252;gen"
                    }
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

            "size": [ 600, 700 ]
        }
    ]
}
</pre>

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so it works on the left-side panel of the editor</li>
    <li>The plugin name and description are translated into Russian, French, Spanish and German with the <em>nameLocale</em> and <em>descriptionLocale</em> parameters.</li>
    <li>This plugin has two buttons - <em>Insert</em> and <em>Cancel</em>. They are specified with the buttons parameter and translated into Russian, French, Spanish and German languages with the <em>textLocale</em> parameter.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/symboltable/symboltable.js" target="_blank">here</a>.</p>
<ul class="columns-2">
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onExternalMouseUp">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("events") %>#onMethodReturn">onMethodReturn</a></li>
    <li><a href="<%= Url.Action("events") %>#onTranslate">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/getfontlist") %>">executeMethod ("GetFontList")</a></li>
    <li><a href="<%= Url.Action("executemethod/pastehtml") %>">executeMethod ("PasteHtml")</a></li>
    <li><a href="<%= Url.Action("info") %>#editorType">info.editorType</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
