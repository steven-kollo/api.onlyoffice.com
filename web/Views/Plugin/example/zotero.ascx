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
    "guid" : "asc.{BFC5D5C6-89DE-4168-9565-ABD8D1E48711}",

    "variations" : [
      {
        "description": "Zotero",
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
        "EditorsSupport": [ "word" ],
        "initDataType": "text",
        "initData": "",
        "isVisual": true,
        "isModal": false,
        "isInsideMode": true,
        "initOnSelectionChanged": true
      }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul>
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onTranslate") %>">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/common/pastehtml") %>">executeMethod ("PasteHtml")</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
