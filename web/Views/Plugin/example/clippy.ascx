<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Clippy</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Adds a clippy assistant to the document editor.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>

<img alt="Clippy" src="<%= Url.Content("~/content/img/plugins/gifs/clippy.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/clippy" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Find the plugin in the <b>Plugins</b> tab.</li>
    <li>Select any assistant from the drop down list.</li>
    <li>Click the assistant to start a random animation.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/clippy" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/clippy</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
    <li><em>index_about.html</em> for the plugin <b>About</b> window</li>
    <li>Third-party services:
        <ul>
            <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="https://jquery.com" target="_blank">https://jquery.com</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/clippy/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><b>clippy.js</b> is a full Javascript implementation of Microsoft Agent (AKA Clippy and friends), ready to be embedded in any website (<a href="https://www.smore.com/clippy-js" target="_blank">https://www.smore.com/clippy-js</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/clippy/licenses/clippy.license" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name"       : "Clippy",
    "guid"       : "asc.{DD97A73A-D8C9-11E6-BF26-CEC0C932CE01}",
    "isUICustomizer" : true,

    "variations" : [
        {
            "description"         : "Clippy",
            "url"                 : "code.js",

            "icons"               : ["icon.png", "icon@2x.png"],
            "isViewer"            : true,
            "EditorsSupport"      : ["word", "slide", "cell"],

            "isVisual"            : false,
            "isModal"             : false,
            "isInsideMode"        : false,

            "initDataType"        : "none",
            "initData"            : "",

            "isUpdateOleOnResize" : false,

            "buttons"             : []
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
