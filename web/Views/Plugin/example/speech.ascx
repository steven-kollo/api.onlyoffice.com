<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Speech</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects the  <a href="https://richtr.github.io/guessLanguage.js/" target="_blank">guessLanguage.js</a> library and the  <a href="https://responsivevoice.org/" target="_blank">ResponsiveVoice</a> service for reading text documents out loud by converting the selected text into speech.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents.</p>

<img alt="Speech" src="<%= Url.Content("~/content/img/plugins/gifs/speech.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in ONLYOFFICE Enterprise Edition and Community Edition (Document Server + Community Server), and ONLYOFFICE cloud.</p>
<p>You can also download this plugin from the <a href="https://www.onlyoffice.com/en/app-directory/speech" target="_blank">ONLYOFFICE App Directory</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a> installation instruction.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Select the necessary text.</li>
    <li>Open the <b>Plugins</b> tab and press <b>Speech</b>.</li>
    <li>The text will be read out loud.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-speech" target="_blank">https://github.com/ONLYOFFICE/plugin-speech</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
    <li><em>index_about.html</em> for the plugin <b>About</b> window</li>
    <li>Third-party services:
        <ul>
            <li><b>guessLanguage.js</b> is a natural language detection library based on trigram statistical analysis. This library is written in JavaScript and works equally well when run in either browser or node.js (<a href="https://richtr.github.io/guessLanguage.js/" target="_blank">https://richtr.github.io/guessLanguage.js/</a>). License: <a href="https://www.gnu.org/licenses/lgpl-3.0.html" target="_blank">GNU LGPL</a>.</li>
            <li><b>ResponsiveVoice</b> is a  service for converting text into speech using HTML5 (<a href="https://responsivevoice.org/" target="_blank">https://responsivevoice.org/</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-speech/blob/master/licenses/ResponsiveVoice.license" target="_blank">CC-BY</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "Speech",
    "nameLocale": {
        "ru": "&#1056;&#1077;&#1095;&#x044C;",
        "fr": "Parole",
        "es": "Habla",
        "de": "Rede"
    },
    "guid": "asc.{D71C2EF0-F15B-47C7-80E9-86D671F9C595}",

    "variations": [
        {
            "description": "Speech",
            "descriptionLocale": {
                "ru": "&#1056;&#1077;&#1095;&#x044C;",
                "fr": "Parole",
                "es": "Habla",
                "de": "Rede"
            },
            "url": "index.html",

            "icons": [ "icon.png", "icon@2x.png", "icon2.png", "icon2@2x.png" ],
            "isViewer": true,
            "EditorsSupport": [ "word" ],

            "isVisual": false,
            "isModal": false,
            "isInsideMode": false,

            "initDataType": "text",
            "initData": "",

            "isUpdateOleOnResize": false,

            "buttons": []
        }
    ]
}
</pre>

<div class="header-gray">Methods and events</div>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/plugin-speech/blob/master/scripts/speech.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
