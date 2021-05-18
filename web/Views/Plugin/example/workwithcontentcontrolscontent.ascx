<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Work with content controls content</span>
</h1>

<p class="dscr">A non-visual, system plugin that is available in the document editor and allows the user to insert the content of one content control into another.</p>
<p><b>Plugin type:</b> non-visual, system.</p>
<p><b>Supported editors:</b> document.</p>

<img alt="WorkWithContentControlsContent" src="<%= Url.Content("~/content/img/plugins/gifs/work-with-content-controls-content.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_work_with_content_controls_content" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Add two content controls to the document. One of them should have tag 11 and the other - tag 14 (these tags are used in the plugin code as an example but you can change them).</li>
    <li>Open the <b>Plugins</b> tab and press <b>Example  work with content controls content</b>.</li>
    <li>The content from the content control with tag 11 will be inserted into the content control with tag 14.
</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_work_with_content_controls_content" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_work_with_content_controls_content</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
</ol>


<h2>Config</h2>
<pre>
{
    "name" : "example_work_with_content_controls_combo",
    "guid" : "asc.{639E69BC-58DE-4029-9B43-F0420F67E6F9}",

    "variations" : [
        {
            "description" : "example_work_with_content_controls_combo",
            "url"         : "index.html",

            "icons"           : ["resources/img/icon.png", "resources/img/icon@2x.png"],
            "isViewer"        : false,
            "EditorsSupport"  : ["word"],

            "isVisual"        : false,
            "isModal"         : false,
            "isInsideMode"    : false,
            "isSystem"        : true,

            "initDataType"    : "none",
            "initData"        : "",

            "isUpdateOleOnResize" : false,

            "buttons"        : [ ],

            "events" : [
                "onClick"
            ]
        }
    ]
}
</pre>

<ul>
    <li>The plugin is system (<em>"isSystem": true</em>), so it works in the background as long as the editors are launched.</li>
    <li>The (<em>"isVisual": false</em>) parameter means that this plugin does not habe its own frame or tab.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/example_work_with_content_controls_content/code.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/getallcontentcontrols") %>">executeMethod ("GetAllContentControls")</a></li>
    <li><a href="<%= Url.Action("executemethod/pastetext") %>">executeMethod ("PasteText")</a></li>
    <li><a href="<%= Url.Action("executemethod/selectcontentcontrol") %>">executeMethod ("SelectContentControl")</a></li>
    <li><a href="<%= Url.Action("scope") %>">Asc.scope object</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
