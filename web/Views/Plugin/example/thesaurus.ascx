<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Thesaurus</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects <a href="https://words.bighugelabs.com/" target="_blank">Big Huge Thesaurus</a> to search for word synonyms and antonyms.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>

<img alt="Thesaurus" src="<%= Url.Content("~/content/img/plugins/gifs/thesaurus.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.</p>
<p>You can remove it following the <a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>" target="_blank">on-premises</a>, or <a href="<%= Url.Action("installation/cloud") %>" target="_blank">cloud</a> installation instructions.
<p>The plugin guid: {BE5CBF95-C0AD-4842-B157-AC40FEDD9840}.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>Thesaurus</b>.</li>
    <li>Select the necessary word. The list of synonyms and antonyms will be displayed automatically in the plugin window.</li>
    <li>Choose a suitable synonym or antonym and click it.</li>
    <li>The chosen synonym or antonym replaces the selected word in the text.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-thesaurus" target="_blank">https://github.com/ONLYOFFICE/plugin-thesaurus</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish and French.</li>
    <li><em>plugin style.css</em> is used to bring the plugin to the specific style.
    <li>Third-party services:
        <ul>
            <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="http://jquery.com/" target="_blank">http://jquery.com/</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-thesaurus/blob/master/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><b>Big Huge Thesaurus</b> - the developer-friendly <a href="https://words.bighugelabs.com/" target="_blank">API</a> for getting synonyms and antonyms for your apps and websites. License: <a href="https://github.com/ONLYOFFICE/plugin-thesaurus/blob/master/LICENSE" target="_blank">Apache 2.0 License</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "Thesaurus",
    "nameLocale": {
        "ru": "&#1057;&#1080;&#1085;&#1086;&#1085;&#1080;&#1084;&#1099;",
        "fr": "The&#769;saurus",
        "es": "Tesauro",
        "de": "Thesaurus"
    },
    "guid": "asc.{BE5CBF95-C0AD-4842-B157-AC40FEDD9840}",

    "variations": [
        {
            "description": "Thesaurus",
            "descriptionLocale": {
                "ru": "&#1057;&#1080;&#1085;&#1086;&#1085;&#1080;&#1084;&#1099;",
                "fr": "The&#769;saurus",
                "es": "Tesauro",
                "de": "Thesaurus"
            },
            "url": "index.html",

            "icons": [ "icon.png", "icon@2x.png", "icon.png", "icon@2x.png" ],
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

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/plugin-thesaurus/blob/master/scripts/synonim.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onExternalMouseUp">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("events") %>#onTranslate">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/pastetext") %>">executeMethod ("PasteText")</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/plugin-thesaurus/issues" target="_blank">GitHub</a>.</p>
