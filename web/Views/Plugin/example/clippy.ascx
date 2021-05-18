<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Clippy</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in all the editors and allows the user to add a clippy assistant to the document editor.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> document, spreadsheet, presentation.</p>

<img alt="Clippy" src="<%= Url.Content("~/content/img/plugins/gifs/clippy.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/clippy" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Find the plugin in the <b>Plugins</b> tab.</li>
    <li>Select any assistant from the drop down list.</li>
    <li>Click the assistant to start a random animation.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/clippy" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/clippy</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
    <li><em>index_about.html</em> for the plugin <b>About</b> window.</li>
    <li>Third-party services:
        <ul>
            <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="http://jquery.com/" target="_blank">http://jquery.com/</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/clippy/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><b>clippy.js</b> is a full Javascript implementation of Microsoft Agent (AKA Clippy and friends), ready to be embedded in any website (<a href="https://www.smore.com/clippy-js" target="_blank">https://www.smore.com/clippy-js</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/clippy/licenses/clippy.license" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<h2>Config</h2>
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

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so it works on the left-side panel of the editor.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/clippy/code.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
