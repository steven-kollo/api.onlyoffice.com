<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Translator</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in all the editors and allows the user to connect the <a href="https://cloud.google.com/translate?hl=ru" target="_blank">Google Translate API</a> for translating the selected text into other languages.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> document, spreadsheet, presentation.</p>
<p><b>Analogues:</b> <a href="https://github.com/ONLYOFFICE/plugin-apertium" target="_blank">Apertium</a>, <a href="https://github.com/ONLYOFFICE/plugin-deepl" target="_blank">DeepL</a>.</p>

<img alt="Translator" src="<%= Url.Content("~/content/img/plugins/gifs/translator.gif") %>" />


<h2>Installation</h2>
<p>Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.</p>
<p>You can remove it using the <a href="https://api.teamlab.info/plugin/installation/desktop">desktop</a>, <a href="https://api.teamlab.info/plugin/installation/onpremises" target="_blank">on-premises</a> or <a href="https://api.teamlab.info/plugin/installation/cloud" target="_blank">cloud</a> installation instructions.
<p>The plugin guid: {7327FC95-16DA-41D9-9AF2-0E7F449F6800}.</p>


<h2>Usage</h2>

<ol>
    <li>Select the text you want to translate.</li>
    <li>Open the <b>Plugins</b> tab and press <b>Translator</b>.</li>
    <li>Select the necessary language. The translation will be displayed in the plugin window immediately.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-translator" target="_blank">https://github.com/ONLYOFFICE/plugin-translator</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish and French.</li>
    <li>Third-party service:
        <ul>
            <li><a href="https://cloud.google.com/translate?hl=ru" target="_blank">Google Translate API</a> enables translation between languages. License: <a href="https://github.com/matheuss/google-translate-api/blob/master/LICENSE" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<h2>Config</h2>
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

            "icons": [ "resources/img/icon.png", "resources/img/icon@2x.png", "resources/img/icon.png", "resources/img/icon@2x.png" ],
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

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so it works on the left-side panel of the editor.</li>
    <li>This plugin name and description are translated into Russian, French, Spanish and German with the <em>nameLocale</em> and <em>descriptionLocale</em> parameters</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/plugin-translator/blob/master/scripts/translate.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onExternalMouseUp">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("events") %>#onTranslate">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
