<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Hello World</span>
</h1>

<p class="dscr">A non-visual, system plugin that is available in the document editor and allows the user to insert the <em>Hello world!</em> phrase when he/she presses the button.</p>
<p><b>Plugin type:</b> non-visual, system.</p>
<p><b>Supported editors:</b> document.</p>

<img alt="HelloWorld" src="<%= Url.Content("~/content/img/plugins/gifs/hello-world.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/helloworld" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
<li>Find the plugin on the <b>Plugins</b> tab.</li>
<li>Click the <b>hello world</b> button.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/helloworld" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/helloworld</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
    <li><em>index_about.html</em> for the plugin <b>About</b> window</li>
</ol>


<h2>Config</h2>
<pre>
{
    "name"       : "hello world",
    "guid"       : "asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}",
    "baseUrl"    : "",
    "variations" : [
        {
            "description"         : "hello world",
            "url"                 : "index.html",
            "icons"               : ["resources/img/icon.png", "resources/img/icon@2x.png"],
            "isViewer"            : false,
            "EditorsSupport"      : ["word"],
            "isVisual"            : false,
            "isModal"             : true,
            "isInsideMode"        : false,
            "initDataType"        : "none",
            "initData"            : "",
            "isUpdateOleOnResize" : true,
            "buttons"             : []
        },
        {
            "description"         : "About",
            "url"                 : "index_about.html",
            "icons"               : ["resources/img/icon.png", "resources/img/icon@2x.png"],
            "isViewer"            : false,
            "EditorsSupport"      : ["word"],
            "isVisual"            : true,
            "isModal"             : true,
            "isInsideMode"        : false,
            "initDataType"        : "none",
            "initData"            : "",
            "isUpdateOleOnResize" : true,
            "buttons"         : [
                {
                    "text": "Ok",
                    "primary": true
                }
            ],

            "size" : [392, 147]
        }
    ]
}
</pre>

<ul>
    <li>This plugin has two variations - for the plugin itself and for the <b>About</b> window.</li>
    <li>The <em>"isVisual": false</em> parameter means that this plugin does not have its own frame or panel.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/helloworld/helloworld.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("callcommand") %>">callCommand</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("scope") %>">Asc.scope object</a></li>
    <li><a href="<%= Url.Action("info") %>#recalculate">info.recalculate</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
