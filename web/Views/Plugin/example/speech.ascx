<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Speech</span>
</h1>

<p class="dscr">A non-visual, non-system plugin that is available in the document editor and allows the user to connect the  <a href="http://richtr.github.io/guessLanguage.js/" target="_blank">guessLanguage.js</a> library and the  <a href="https://responsivevoice.org/" target="_blank">ResponsiveVoice</a> service for reading text documents out loud by converting the selected text into speech.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> document.</p>

<img alt="Speech" src="<%= Url.Content("~/content/img/plugins/gifs/speech.gif") %>" />


<h2>Installation</h2>
<p>Available by default in ONLYOFFICE Enterprise Edition and Community Edition (Document Server + Community Server), and ONLYOFFICE cloud.</p>
<p>You can also download this plugin from the <a href="https://www.onlyoffice.com/en/app-directory/speech" target="_blank">ONLYOFFICE App Directory</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a> installation instruction.</p>


<h2>Usage</h2>

<ol>
    <li>Select the necessary text.</li>
    <li>Open the <b>Plugins</b> tab and press <b>Speech</b>.</li>
    <li>The text will be read out loud.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-speech" target="_blank">https://github.com/ONLYOFFICE/plugin-speech</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
    <li><em>index_about.html</em> for the plugin <b>About</b> window.</li>
    <li>Third-party services:
        <ul>
            <li><b>guessLanguage.js</b> is a natural language detection library based on trigram statistical analysis. This library is written in JavaScript and works equally well when run in either browser or node.js (<a href="http://richtr.github.io/guessLanguage.js/" target="_blank">http://richtr.github.io/guessLanguage.js/</a>). License: <a href="https://www.gnu.org/licenses/lgpl-3.0.html" target="_blank">GNU LGPL</a>.</li>
            <li><b>ResponsiveVoice</b> is a  service for converting text into speech using HTML5 (<a href="https://responsivevoice.org/" target="_blank">https://responsivevoice.org/</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-speech/blob/master/licenses/ResponsiveVoice.license" target="_blank">CC-BY</a>.</li>
        </ul>
    </li>
</ol>


<h2>Config</h2>
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

<ul>
    <li>The <em>"isVisual": false</em> parameter means that this plugin does not have its own frame or tab.</li>
    <li>The plugin name and description are translated into Russian, French, Spanish and German with the <em>nameLocale</em> and <em>descriptionLocale</em> parameters.</li>
    <li>This plugin has two variations - for the plugin itself and for the <b>About</b> window.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/plugin-speech/blob/master/scripts/speech.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
