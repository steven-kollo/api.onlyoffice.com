<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Telegram</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in all the editors and allows the user to connect the Telegram application for instant messaging within the ONLYOFFICE editors.</p>
<p class="note">
The plugin has no access to the camera and microphone, so you will be unable to record voice and video messages. Also, it does not work in the incognito mode.
</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> document, spreadsheet, presentation.</p>

<img alt="Telegram" src="<%= Url.Content("~/content/img/plugins/gifs/telegram.gif") %>" />


<h2>Installation</h2>
<p>Available by default in ONLYOFFICE Enterprise Edition and Community Edition (Document Server + Community Server).</p>
<p>You can also download this plugin from <a href="https://www.onlyoffice.com/en/app-directory/telegram" target="_blank">the ONLYOFFICE App Directory</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a> or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Find the plugin on the <b>Plugins</b> tab.</li>
    <li>Log in to your Telegram account.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-telegram" target="_blank">https://github.com/ONLYOFFICE/plugin-telegram</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
    <li>Third-party service:
        <ul>
            <li><a href="https://github.com/evgeny-nadymov/telegram-react" target="_blank">Telegram-reactapplication</a> - the application which uses the ReactJS JavaScript framework and TDLib (Telegram Database library) compiled to WebAssembly. License: <a href="https://github.com/ONLYOFFICE/plugin-telegram/blob/master/licenses/telegram-react.license" target="_blank">GNU General Public License</a>.</li>
        </ul>
    </li>
</ol>


<h2>Config</h2>
<pre>
{
    "name" : "Telegram",
    "guid" : "asc.{E5773A43-F9B3-4E81-81D9-CE0A132470E7}",

    "variations" : [
        {
            "description" : "Telegram",
            "url"         : "index.html",

            "icons"           : ["resources/img/icon.png", "resources/img/icon@2x.png"],
            "isViewer"        : true,
            "EditorsSupport"  : ["word", "cell", "slide"],

            "isVisual"        : true,
            "isModal"         : false,
            "isInsideMode"    : true,

            "initDataType"    : "none",
            "initData"        : "",

            "isUpdateOleOnResize" : false,

            "buttons"         : [ ]
        }
    ]
}
</pre>

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so it works on the left-side panel of the editor.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/plugin-telegram/blob/master/scripts/code.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onExternalMouseUp">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/plugin-telegram/issues" target="_blank">on GitHub</a>.</p>
