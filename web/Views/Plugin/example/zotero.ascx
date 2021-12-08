<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Zotero</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects a Zotero account for adding references to the document in full accordance with the chosen style guides.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents.</p>
<p><b>Analogues:</b> <a href="https://github.com/ONLYOFFICE/plugin-mendeley" target="_blank">Mendeley</a>, <a href="https://github.com/ONLYOFFICE/plugin-easybib" target="_blank">EasyBib</a>.</p>

<img alt="Zotero" src="<%= Url.Content("~/content/img/plugins/gifs/zotero.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in ONLYOFFICE Enterprise Edition, Community Edition (Document Server + Community Server), and ONLYOFFICE cloud.</p>
<p>You can also download this plugin from the <a href="https://www.onlyoffice.com/en/app-directory/zotero" target="_blank">ONLYOFFICE App Directory</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a> installation instruction.</p>

<div class="header-gray">Connect ONLYOFFICE to Zotero account</div>
<ol>
    <li>Find the plugin on the <b>Plugins</b> tab.</li>
    <li>Click the <b>Zotero API settings</b> link.</li>
    <li>On the Zotero site, create a new key, copy and paste it to the <b>API key</b> field in the editor.</li>
    <li>Click the <b>Save</b> button.</li>
</ol>


<div class="header-gray">Usage</div>

<ol>
    <li>Find the plugin on the <b>Plugins</b> tab.</li>
    <li>Find the necessary bibliography by author, title or year.</li>
    <li>Select all the necessary sources.</li>
    <li>Choose the reference style from the <b>Style</b> pull-down menu.</li>
    <li>Click the <b>Insert Bibliography</b> button. The bibliography list will be inserted at the cursor position.</li>
</ol>

<div class="header-gray">Known issues</div>

<p>For CentOS users with SELinx enabled, after copying the src folder to sdkjs-plugins, plugins may not work due to the variable file security context. To restore the rights, use the following command:</p>
<pre>
sudo restorecon -Rv /var/www/onlyoffice/documentserver/sdkjs-plugins/
</pre>
<p>After that restart the services:</p>
<pre>
sudo supervisorctl restart ds:docservice
</pre>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-zotero" target="_blank">https://github.com/ONLYOFFICE/plugin-zotero</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
    <li><em>plugin_style.css</em> are used to adjust the plugin style.</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech, Italian, Japanese, Dutch, Portuguese, Chinese and French.</li>
    <li><em>zotero.js</em> allows the user to get access to their Zotero account.</li>
    <li>Third-party services:
        <ul>
            <li><b>fetch-polyfill</b> - a project that implements a subset of the standard Fetch specification, enough to make fetch a viable replacement for most uses of XMLHttpRequest in traditional web applications (<a href="https://github.com/github/fetch" target="_blank">https://github.com/github/fetch</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-zotero/blob/master/licenses/fetch-polyfill.license" target="_blank">MIT</a></li>
            <li><b>promise-polyfill</b> - lightweight ES6 Promise polyfill for the browser and node (<a href="https://github.com/taylorhakes/promise-polyfill" target="_blank">https://github.com/taylorhakes/promise-polyfill</a>). License:  <a href="https://github.com/ONLYOFFICE/plugin-zotero/blob/master/licenses/promise-polyfill.license" target="_blank">MIT</a>.</li>
            <li><b>url-polyfill</b> -  Polyfill URL and URLSearchParams to match last WHATWG specifications (<a href="https://github.com/lifaon74/url-polyfill" target="_blank">https://github.com/lifaon74/url-polyfill</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-zotero/blob/master/licenses/url-polyfill.license" target="_blank">MIT</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name" : "Zotero",
    "guid" : "asc.{0788E794-718F-4697-BCEC-3E8A0F44570B}",

    "variations" : [
        {
            "description" : "Zotero",
            "url"         : "index.html",

            "icons"           : ["icon.png", "icon@2x.png", "icon.png", "icon@2x.png"],
            "isViewer"        : true,
            "EditorsSupport"  : ["word"],

            "isVisual"        : true,
            "isModal"         : true,
            "isInsideMode"    : false,

            "initDataType"    : "text",
            "initData"        : "",

            "isUpdateOleOnResize" : false,

            "buttons"        : [
                {
                    "text": "Link",
                    "primary": true,
                    "textLocale": {
                        "ru": "&#1057;&#1089;&#1099;&#1083;&#1082;&#1072;",
                        "fr": "Lien",
                        "es": "Enlace",
                        "de": "Referenz"
                    }
                },
                {
                    "text": "Bibliography",
                    "primary": true,
                    "textLocale": {
                        "ru": "&#1041;&#1080;&#1073;&#1083;&#1080;&#1086;&#1075;&#1088;&#1072;&#1092;&#1080;&#1103;",
                        "fr": "Bibliographie",
                        "es": "Bibliografi&#769;a",
                        "de": "Literaturverzeichnis"
                    }
                },
                {
                    "text": "Clear local storage",
                    "primary": true,
                    "textLocale": {
                        "ru": "&#1054;&#1095;&#1080;&#1089;&#1090;&#1080;&#1090;&#x044C; &#1083;&#1086;&#1082;&#1072;&#1083;&#x044C;&#1085;&#1086;&#1077; &#1093;&#1088;&#1072;&#1085;&#1080;&#1083;&#1080;&#1097;&#1077;",
                        "fr": "Effacer le stockage local",
                        "es": "Borrar almacenamiento local",
                        "de": "L&#246;schen Sie den lokalen Speicher"
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

            "initOnSelectionChanged" : true
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onTranslate">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/pastehtml") %>">executeMethod ("PasteHtml")</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
