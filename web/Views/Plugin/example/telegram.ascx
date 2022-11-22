<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Telegram</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects the Telegram application for instant messaging within the ONLYOFFICE editors.</p>
<p class="note">
The plugin has no access to the camera and microphone, so you will be unable to record voice and video messages. Also, it does not work in the incognito mode.
</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>
<p><b>Analogues:</b> <a href="https://github.com/ONLYOFFICE/plugin-rainbow" target="_blank">Rainbow</a>.</p>

<img alt="Telegram" src="<%= Url.Content("~/content/img/plugins/gifs/telegram.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in ONLYOFFICE Enterprise Edition and Community Edition (Document Server + Community Server).</p>
<p>You can also download this plugin from the <a href="https://www.onlyoffice.com/en/app-directory/telegram" target="_blank">ONLYOFFICE App Directory</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a> or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Find the plugin on the <b>Plugins</b> tab.</li>
    <li>Log in to your Telegram account.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-telegram" target="_blank">https://github.com/ONLYOFFICE/plugin-telegram</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
    <li>Third-party service:
        <ul>
            <li><a href="https://github.com/evgeny-nadymov/telegram-react" target="_blank">Telegram-reactapplication</a> - the application which uses the ReactJS JavaScript framework and TDLib (Telegram Database library) compiled to WebAssembly. License: <a href="https://github.com/ONLYOFFICE/plugin-telegram/blob/master/licenses/telegram-react.license" target="_blank">GNU General Public License</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name" : "Telegram",
    "guid" : "asc.{E5773A43-F9B3-4E81-81D9-CE0A132470E7}",

    "variations" : [
        {
            "description" : "Telegram",
            "url"         : "index.html",

            "icons"           : ["resources/img/icon.png", "resources/img/icon@2x.png", "resources/img/icon2.png", "resources/img/icon2@2x.png"],
            "isViewer"        : true,
            "EditorsSupport"  : ["word", "cell", "slide"],

            "isVisual"        : true,
            "isModal"         : false,
            "isInsideMode"    : true,

            "initDataType"    : "none",
            "initData"        : "",

            "buttons"         : [ ]
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul>
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onExternalMouseUp") %>">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/plugin-telegram/issues" target="_blank">GitHub</a>.</p>
