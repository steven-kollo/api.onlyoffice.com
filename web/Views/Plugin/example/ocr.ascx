<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">OCR</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects the <a href="https://tesseract.projectnaptha.com/" target="_blank">TesseractJS-Core library</a> for extracting text from an image (<em>.png</em> <em>.jpg</em>) and inserting it into the document.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>

<img alt="OCR" src="<%= Url.Content("~/content/img/plugins/gifs/ocr.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.</p>
<p>You can remove it following the <a href="https://api.teamlab.info/plugin/installation/desktop">desktop</a>, <a href="https://api.teamlab.info/plugin/installation/onpremises" target="_blank">on-premises</a>, or <a href="https://api.teamlab.info/plugin/installation/cloud" target="_blank">cloud</a> installation instructions.
<p>The plugin guid: {440EBF13-9B19-4BD8-8621-05200E58140B}.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Find the plugin on the <b>Plugins</b> tab.</li>
    <li>Click the <b>Load File</b> buttonand select an image.</li>
    <li>Choose the recognition language from the <b>Choose Language</b> pull-down menu.</li>
    <li>Click the <b>Recognize</b> button. The text will appear to the right of the picture.</li>
    <li>Clickthe <b>Insert text</b> button and the text will be inserted into the document at the text cursor position.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-ocr" target="_blank">https://github.com/ONLYOFFICE/plugin-ocr</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech and French.</li>
    <li><em>index_about.html</em> for the plugin <b>About</b> window</li>
    <li>Third-party services:
        <ul>
            <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="http://jquery.com/" target="_blank">http://jquery.com/</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/clippy/licenses/jQuery.license" target="_blank">MIT License/</a>.</li>
            <li><b>TesseractJS-Core</b> is a pure Javascript port of the popularTesseract OCR engine. This library supportsmore than 100 languages, automatic textorientation and script detection, a simple interface for reading paragraph, word, and characterbounding boxes (<a href="https://tesseract.projectnaptha.com/" target="_blank">https://tesseract.projectnaptha.com/</a>). License: <a href="https://github.com/naptha/tesseract.js-core/blob/master/LICENSE" target="_blank">Apache License.</a></li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "OCR",
    "nameLocale": {
        "ru": "&#1056;&#1072;&#1089;&#1087;&#1086;&#1079;&#1085;&#1072;&#1074;&#1072;&#1085;&#1080;&#1077; &#1090;&#1077;&#1082;&#1089;&#1090;&#1072;",
        "fr": "Reconnaissance optique de caracte&#768;res",
        "es": "Reconocimiento o&#769;ptico de caracteres",
        "de": "OCR"
    },
    "guid": "asc.{440EBF13-9B19-4BD8-8621-05200E58140B}",
    "baseUrl": "",

    "variations": [
        {
            "description": "OCR",
            "descriptionLocale": {
                "ru": "&#1056;&#1072;&#1089;&#1087;&#1086;&#1079;&#1085;&#1072;&#1074;&#1072;&#1085;&#1080;&#1077; &#1090;&#1077;&#1082;&#1089;&#1090;&#1072;",
                "fr": "Reconnaissance optique de caracte&#768;res",
                "es": "Reconocimiento o&#769;ptico de caracteres",
                "de": "OCR"
            },
            "url": "index.html",

            "icons": [ "icon.png", "icon@2x.png", "icon2.png", "icon2@2x.png" ],
            "isViewer": false,
            "EditorsSupport": [ "word" ],

            "isVisual": true,
            "isModal": true,
            "isInsideMode": false,

            "initDataType": "none",
            "initData": "",

            "isUpdateOleOnResize": false,

            "buttons": [
                {
                    "text": "Insert Text",
                    "primary": true,
                    "textLocale": {
                        "ru": "&#1042;&#1089;&#1090;&#1072;&#1074;&#1080;&#1090;&#x044C; &#1090;&#1077;&#1082;&#1089;&#1090;",
                        "fr": "Inse&#769;rer le texte",
                        "es": "Insertar texto",
                        "de": "Text einf&#252;gen"
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

            "size": [ 592, 100 ]
        },
        {
            "description": "About",
            "descriptionLocale": {
                "ru": "&#1057;&#1087;&#1088;&#1072;&#1074;&#1082;&#1072;",
                "fr": "A&#768; propos",
                "es": "Sobre programa",
                "de": "&#220;ber"
            },
            "url": "index_about.html",

            "icons": [ "icon.png", "icon@2x.png", "icon2.png", "icon2@2x.png" ],
            "isViewer": false,
            "EditorsSupport": [ "word" ],

            "isVisual": true,
            "isModal": true,
            "isInsideMode": false,

            "initDataType": "none",
            "initData": "",

            "isUpdateOleOnResize": false,

            "buttons": [
                {
                    "text": "Ok",
                    "primary": true
                }
            ],

            "size": [ 392, 147 ]
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/plugin-ocr/blob/master/scripts/ocr.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onTranslate">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("resizewindow") %>">resizeWindow</a></li>
    <li><a href="<%= Url.Action("info") %>#recalculate">info.recalculate</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
